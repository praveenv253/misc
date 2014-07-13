Misc
====

A tiny repository containing a bunch of scripts, configuration files and
programs maybe.

log.c
-----

Simple logging utility. I use it to jot down things I might need to refer to
in the future.

log.sh
------

A wrapper for `log.c` that automatically commits and pushes logs to a remote.

tasks.py
--------

Extremely simple tasklist utility. Supports adding, viewing and deletion of
tasks.

reinstall
---------

List of programs to install when my GNU/Linux operating system gets a
reinstall.

colors.py
---------

Display ASCII colours along with their colour codes.

vader.xml
---------

This is a custom gedit colorscheme file. Mainly because I don't like any of the
default dark themes and because I find that dark themes hurt my eyes much less
than light themes.

Language-specific classes for the different color sets available can be found
somewhere along your gtksourceview search path. As documented [here] [1], this
path is typically something like:

1. `~/.local/share/gtksourceview-3.0/styles/`
2. `/usr/share/gnome/gtksourceview-3.0/styles/`
3. `/usr/local/share/gtksourceview-3.0/styles/`
4. `/usr/share/gtksourceview-3.0/styles/`

(Replace 3.0 with 2.0 if you're still using gtksourceview-2.0)

There used to be a nice program that allowed you to create custom colorschemes
(called 'badschemer' if I remember right). Alas it no longer seems to work with
gtksourceview-3.0.

The vim analog of this colourscheme (or at least, a somewhat close analog) can
be found in my [dotvim] [2] repository.

lyxify.py
---------

Converts code into lyx scrap. Extremely useful when using older versions of
lyx that do not support tab-indentation for multiple lines.

  [1]: https://live.gnome.org/GtkSourceView/StyleSchemes  "here"
  [2]: https://github.com/praveenv253/dotvim "dotvim"
