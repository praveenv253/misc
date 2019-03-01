#!/usr/bin/env python3

from __future__ import print_function, division

import argparse
import os


if __name__ == '__main__':
    # Set up and parse arguments
    parser = argparse.ArgumentParser(description='Create a shortcut in the '
                                                 'form of a .desktop file')
    parser.add_argument('src', help='File whose shortcut is to be created')
    parser.add_argument('dest', nargs='?', help='Destination of the shortcut',
                        default=None)
    parser.add_argument('--name', help='Name of shortcut file')
    args = parser.parse_args()

    # Sanitize source
    if not os.path.exists(args.src):
        parser.exit(1, args.src + ': no such file or directory\n')

    # Extract file/directory name of source
    basename = os.path.basename(args.src.rstrip('/'))

    # Sanitize destination
    dir_warn_flag = False
    if not args.dest:
        args.dest = '.'
        dest = basename + '.desktop'
    elif os.path.isdir(args.dest):
        dir_warn_flag = True
        dest = os.path.join(args.dest, basename + '.desktop')
    else:
        if args.dest.endswith('.desktop'):
            dest = args.dest
        else:
            dest = args.dest + '.desktop'
    if os.path.isfile(dest):
        parser.exit(1, dest + ': file already exists\n')

    # Sanitize name
    if args.name:
        name = args.name
    else:
        name = basename

    # Create desktop entry
    desktop_entry = ('[Desktop Entry]\n'
                     '\tType=Link\n'
                     '\tName=%s\n'
                     '\tURL=%s' % (name, args.src))

    # Write desktop entry to destination
    with open(dest, 'w') as f:
        f.write(desktop_entry)

    if dir_warn_flag:
        print('Warning: wrote to %s, but this shortcut will not work '
              'unless the file is accessible from there!' % args.dest)
