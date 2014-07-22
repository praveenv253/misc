#!/usr/bin/env python3

"""
Program to display ASCII colours and their colour codes on the terminal.

On ubuntu, requires ncurses-term to be installed.
Also, it may be required for the TERM environment variable to be set to
xterm-256color
"""

if __name__ == '__main__':

    import string

    fg = '\033[38;5;'
    bg = '\033[48;5;'

    for i in range(0, 8):
        n = str(i).zfill(3)
        fgstr = fg + n + 'm' + n
        bgstr = bg + n + 'm' 'XXX'
        print(fgstr + ' ' + bgstr + '\033[0m', end=' ')

    print()

    for i in range(8, 16):
        n = str(i).zfill(3)
        fgstr = fg + n + 'm' + n
        bgstr = bg + n + 'm' 'XXX'
        print(fgstr + ' ' + bgstr + '\033[0m', end=' ')

    print()
    print()

    for i in range(16, 232, 36):
        for j in range(0, 36, 6):
            for k in range(0, 6):
                n = str(i + j + k).zfill(3)
                fgstr = fg + n + 'm' + n
                bgstr = bg + n + 'm' 'XXX'
                print(fgstr + ' ' + bgstr + '\033[0m', end=' ')
            print()
        print()

    for i in range(232, 256, 6):
        for j in range(0, 6):
            n = str(i + j).zfill(3)
            fgstr = fg + n + 'm' + n
            bgstr = bg + n + 'm' 'XXX'
            print(fgstr + ' ' + bgstr + '\033[0m', end=' ')
        print()
