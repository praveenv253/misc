#!/usr/bin/env python

import sys
import os
import tempfile
from subprocess import call

HOME_DIR = os.environ['HOME']
TASKFILE = os.path.join(HOME_DIR, 'Documents', '.taskfile')
EDITOR = os.environ.get('EDITOR', 'vim')

# Show usage help
def _help():
    help_info = """tasks - create, edit and view tasklist

    Usage:
        tasks [l]
        tasks [a task]
        tasks [e task_number]
        tasks [c]
        tasks [r task_number]

    Parameters:
        h -h --help
            Show this help text and exit.
        l -l --list
            List all tasks in the taskfile.
        a -a --add
            Add a new task to the taskfile. Expects an additional command line
            parameter: the raw text of the task to be added.
        e -e --edit
            Edit an existing task. Expects an additional parameter: the task
            number to edit. Use --list to locate tasks to edit.
        r -r --remove
            Remove an existing task. Expects an additional parameter: the task
            number to remove. Use --list to locate tasks to remove.
        c -c --clear
            Clear all tasks. Dangerous! Issues a warning before continuing.
    """
    print help_info

# Handle an incorrect number of parameters
def _param_error():
    print 'I can\'t understand these parameters.'
    print
    _help()
    sys.exit(1)

# Since the '#' marker is used to separate tasks, we escape all # characters in
# a task string before storage
def _marksafe(s):
    l = list(s)
    try:
        i = l.index('#')
        while(1):
            l.insert(i, '\\')
            i = i+2 + l[i+2:].index('#')
    except ValueError:
        pass
    return ''.join(l)

# Read the tasks and store them in a list. Return the list. Take care of
# undoing the safe-marking
def _read_tasks():
    import re

    try:
        f = open(TASKFILE, 'r')
    except IOError:
        print 'The taskfile at %s does not exist.' % TASKFILE
        sys.exit(1)

    raw = f.read()
    f.close()

    blob = raw.split('#')[1:]
    i = 0
    while i < len(blob):
        if len(blob[i]) > 0 and blob[i][-1] == '\\':
            s = list(blob[i])
            s[-1] = '#'
            blob[i] = ''.join(s)
            try:
                blob[i] += blob[i+1]
            except IndexError:
                pass
            blob[i+1:] = blob[i+2:]
            i -= 1
        i += 1
    if blob == ['']:            # No tasks
        return []
    else:
        return [ elem.strip() for elem in blob ]

# Write a list of tasks into the taskfile
def _write_tasks(tasks):
    # Yes, the taskfile is always erased. So be careful what you pass to this
    # function
    f = open(TASKFILE, 'w')

    # The '#' marker is used as a simple separator for tasks
    for i in xrange(len(tasks)):
        f.write('#')
        f.write(_marksafe(tasks[i]))
        # This space is important! It ensures that a backslash at the end of a
        # task does not get converted into a # and combined with the next task!
        f.write(' ')

    f.close()

# List all tasks in the taskfile
def _list():
    tasks = _read_tasks()
    if tasks == []:                  # Taskfile is empty
        print 'No tasks in here!'
    else:
        task_num = 1
        for task in tasks:
            print str(task_num) + ': ' + task.strip()
            task_num += 1

# Add a new task to the taskfile
def _add():
    tasks = _read_tasks()

    with tempfile.NamedTemporaryFile(suffix=".tmp") as temp:
        call([EDITOR, temp.name])
        tasks.append(temp.read().strip())

    _write_tasks(tasks)
    print 'Added task.'

# Edit an existing task
def _edit(args):
    tasks = _read_tasks()
    try:
        task_num = int(args[2]) - 1
    except (ValueError, IndexError):
        _param_error()
    try:
        task = tasks[task_num]
    except IndexError:
        print 'No such task'
        sys.exit(1)

    with tempfile.NamedTemporaryFile(suffix=".tmp") as temp:
        temp.write(task)
        temp.flush()
        call([EDITOR, temp.name])
        temp.seek(0)
        tasks[task_num] = temp.read()

    _write_tasks(tasks)
    print 'Edited task.'

# Clear all existing tasks
def _clear():
    choice = raw_input('This will delete all tasks! Are you sure? (y/N): ')
    if choice == 'y':
        _write_tasks([])
    else:
        print 'No action taken.'

# Remove a given task from the taskfile
def _remove(args):
    tasks = _read_tasks()
    try:
        task_num = int(args[2]) - 1
    except (ValueError, IndexError):
        _param_error()
    try:
        task = tasks[task_num]
    except IndexError:
        print 'No such task'
        sys.exit(1)

    tasks[task_num:] = tasks[task_num+1:]
    _write_tasks(tasks)
    print 'Removed task.'

# Parse arguments and call the appropriate function
if __name__ == '__main__':
    if len(sys.argv) not in [2, 3]:
        _param_error()

    if sys.argv[1] in ['l', '-l', '--list']:
        _list()
    elif sys.argv[1] in ['a', '-a', '--add']:
        _add()
    elif sys.argv[1] in ['e', '-e', '--edit']:
        _edit(sys.argv)
    elif sys.argv[1] in ['r', '-r', '--remove']:
        _remove(sys.argv)
    elif sys.argv[1] in ['c', '-c', '--clear']:
        _clear()
    else:
        _help()
