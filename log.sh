#!/bin/bash

# This program is a thin wrapper to provide git commit support to the logging
# program.

LOGBINARY="$HOME/Programs/misc/log"
LOGDIR="$HOME/Documents/.logs"

$LOGBINARY $@

cd $LOGDIR

# Should already be a git repo with logfile added.
git commit -a -q -m "New log message."
# The repo should already be configured with a remote.
git push -q &

# Reset the working directory quietly.
cd - > /dev/null
