#!/usr/bin/env python3

from random import choice

WORD_FILE = 'gre-words'

f = open(WORD_FILE)
content = f.read()
f.close()

lines = content.split('\n')

while(1):
    try:
        random_line = choice(lines)
    except IndexError:
        break
    lines.remove(random_line)
    try:
        first_letter = list(random_line)[0]
    except IndexError:
        continue
    if first_letter == ' ' or first_letter == '#':
        continue
    word = random_line.split('-')[0].strip()
    print(word, end=' ')
    try:
        char = input()
    except EOFError:
        break
    else:
        if char != '':
            try:
                print(random_line.split('-', 1)[1])
            except IndexError:
                print('None')
        continue

