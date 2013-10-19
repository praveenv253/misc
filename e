#!/bin/bash

# Open with okular, and ensure that the terminal is not littered with arbitrary
# error lines and incomprehensible pieces of information.
okular "$@" > /dev/null 2>&1 &
