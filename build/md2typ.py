#!/usr/bin/env python3
"""Convert the agent-written Markdown chapters into Typst, via a real MD AST."""
import re, os, sys
import mistune

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

CHAPTERS = [
    ('front-matter',        'Srpsko-Hrvatski'),
    ('how-to-use',          'How to Read an Entry'),
    ('reference-tables',    'Colors, Numbers, Days'),
    ('grammar-reference',   'Grammar Reference'),
    ('common-questions',    'Common Questions & Mistakes'),
    ('random-notes',        "Elder Mackay's Random Notes"),
    ('accent-and-tips',     'Accent & Tongue Placement'),
    ('croatian-serbian',    'Croatian vs. Serbian'),
    ('phrases-and-sayings', 'Phrases & Sayings'),
    ('flirting',            'Flirting'),
    ('psovke',              'Psovke'),
    ('daily-word-lists',    'Daily Word Lists'),
    ('resources',           'Links & Resources'),
    ('final-thoughts',      'Final Thoughts'),
]

# Every char that means something in Typst markup.
SPECIAL = '\\#$*_@<>`[]()~/\'"'
def esc(s):
    out = []
    for c in s:
        if c in SPECIAL:
            out.append('\\' + c)
        elif c == '°':
            out.append('\x01')          # placeholder -> #degmark
        else:
            out.append(c)
    return ''.join(out)

def fin(s):
    return s.replace('\x01', '#degmark ')

def q(s):
    return s.replace('\\', '\\\\').replace('"', '\\"')


def inline(tokens):
    out = []
    for t in tokens or []:
        ty = t['type']
        if ty == 'text':
            out.append(esc(t['raw']))
        elif ty == 'strong':
            out.append('#strong[' + inline(t['children']) + ']')
        elif ty == 'emphasis':
            out.append('#emph[' + inline(t['children']) + ']')
        elif ty == 'codespan':
            out.append('#raw("' + q(t['raw']) + '")')
        elif ty == 'link':
            label = inline(t.get('children')) or esc(t['attrs']['url'])
            out.append(f'#link("{q(t["attrs"]["url"])}")[{label}]')
        elif ty == 'linebreak':
            out.append('#linebreak() ')
        elif ty == 'softbreak':
            out.append(' ')
        elif ty == 'inline_html':
            pass
        elif 'children' in t:
            out.append(inline(t['children']))
        elif 'raw' in t:
            out.append(esc(t['raw']))
    return ''.join(out)


HSIZE = {2: 13, 3: 11, 4: 10, 5: 9.8, 6: 9.6}

def block(tokens, depth=0):
    out = []
    for t in tokens or []:
        ty = t['type']

        if ty == 'heading':
            lvl = t['attrs']['level']
            txt = inline(t['children'])
            if lvl == 1:
                out.append(f'#chapter[{txt}]')
            else:
                out.append(f'#block(above: 1.05em, below: 0.42em)'
                           f'[#text(size: {HSIZE.get(lvl,10)}pt, weight: "bold")[{txt}]]')

        elif ty == 'paragraph':
            out.append(inline(t['children']))
            out.append('')

        elif ty == 'block_text':
            out.append(inline(t['children']))

        elif ty == 'block_code':
            body = q(t['raw'].rstrip('\n'))
            # No "#set" here: it puts the block into code mode and the next
            # "#raw" then reads as a stray "#".
            out.append('#block(fill: luma(244), inset: 0.55em, radius: 3pt, width: 100%, '
                       'breakable: true)[#text(font: "Menlo", size: 8pt, '
                       f'raw("{body}"))]')

        elif ty == 'block_quote':
            out.append('#note[' + '\n'.join(block(t['children'], depth)) + ']')

        elif ty == 'thematic_break':
            out.append('#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)')

        elif ty == 'list':
            ordered = t['attrs']['ordered']
            marker = '+' if ordered else '-'
            pad = '  ' * depth
            out.append('#block(above: 0.42em, below: 0.5em)[')
            for item in t['children']:
                inner = block(item['children'], depth + 1)
                inner = [x for x in inner if x.strip()]
                if not inner:
                    continue
                first, rest = inner[0], inner[1:]
                out.append(f'{pad}{marker} {first}')
                for r in rest:
                    out.append(f'{pad}  {r}')
            out.append(']')

        elif ty == 'table':
            head = t['children'][0]
            body = t['children'][1] if len(t['children']) > 1 else None
            # table_head holds the cells directly; there is no intermediate row.
            hrow = head.get('children', [])
            ncol = max(1, len(hrow))
            out.append(f'#table(columns: {ncol}, stroke: 0.4pt + luma(195), '
                       'inset: (x: 0.45em, y: 0.3em), '
                       'fill: (_, y) => if y == 0 { luma(238) } else { none },')
            cells = [f'[#strong[{inline(c.get("children"))}]]' for c in hrow]
            out.append('  ' + ', '.join(cells) + ',')
            if body:
                for row in body['children']:
                    cs = [f'[{inline(c["children"])}]' for c in row['children']]
                    cs += ['[]'] * (ncol - len(cs))
                    out.append('  ' + ', '.join(cs[:ncol]) + ',')
            out.append(')')

        elif ty == 'blank_line':
            pass
        elif ty == 'block_html':
            pass
        elif 'children' in t:
            out.extend(block(t['children'], depth))

    return out


def convert(md):
    parser = mistune.create_markdown(renderer=None, plugins=['table', 'strikethrough'])
    ast = parser(md)
    return fin('\n'.join(block(ast)))


def main():
    src = os.path.join(ROOT, 'book', 'chapters')
    made = []
    for name, title in CHAPTERS:
        p = os.path.join(src, name + '.md')
        if not os.path.exists(p):
            print(f'  -- missing {name}.md')
            continue
        md = open(p).read()
        typ = convert(md)
        head = '#import "../lib.typ": *\n\n'
        if not re.search(r'^#\s', md, re.M):
            head += f'#chapter[{title}]\n'
        head += f'#runhead("{title}")\n\n'
        open(os.path.join(src, name + '.typ'), 'w').write(head + typ + '\n')
        made.append(name)
        print(f'  ok {name}  ({len(md.split()):>6} words)')
    print(f'converted {len(made)} chapters')

if __name__ == '__main__':
    main()
