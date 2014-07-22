#!/usr/bin/env python3

# Program to display lists (that contain many nested lists) nicely.

if __name__ == '__main__':
    import sys
    TAB = '  '
    for line in sys.stdin.readlines():
        numtabs = 0
        chars = list(line.replace(' ', ''))
        for char in chars:
            if char == '[':
                print('\b' + char)
                numtabs += 1
                print(numtabs * TAB, end=' ')
            elif char == ']':
                numtabs -= 1
                print()
                print(numtabs * TAB + char, end=' ')
            elif char == ',':
                print('\b' + char)
                print(numtabs * TAB, end=' ')
            else:
                print('\b' + char, end=' ')
