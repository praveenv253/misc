#!/usr/bin/env python3

import sys

if len(sys.argv) != 2:
    sys.exit('Incorrect number of arguments.\nUsage: lyxify <filename>')

try:
    f = open(sys.argv[1])
except IOError:
    sys.exit('Error. File "%s" could not be opened.' % sys.argv[1])

header = """
#LyX 1.6.7 created this file. For more info see http://www.lyx.org/
\\lyxformat 345
\\begin_document
\\begin_header
\\textclass literate-article
\\use_default_options true
\\language english
\\inputencoding auto
\\font_roman default
\\font_sans default
\\font_typewriter default
\\font_default_family default
\\font_sc false
\\font_osf false
\\font_sf_scale 100
\\font_tt_scale 100

\\graphics default
\\paperfontsize default
\\spacing single
\\use_hyperref false
\\papersize default
\\use_geometry false
\\use_amsmath 1
\\use_esint 1
\\cite_engine basic
\\use_bibtopic false
\\paperorientation portrait
\\secnumdepth 3
\\tocdepth 3
\\paragraph_separation indent
\\defskip medskip
\\quotes_language english
\\papercolumns 1
\\papersides 1
\\paperpagestyle default
\\tracking_changes false
\\output_changes false
\\author ""
\\end_header

\\begin_body
"""

footer = """
\\end_body
\\end_document
"""

print(header)
print('\\begin_layout Scrap')
print('<<*>>=\n')
print('\\begin_inset Newline newline')
print('\\end_inset\n')

for line in f:
    print(line.replace('\\', '\n\\backslash\n').replace('<<', '@<<'))
    print('\\begin_inset Newline newline')
    print('\\end_inset\n')

print('@\n\\end_layout')
print(footer)
