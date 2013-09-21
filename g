#!/bin/bash

# Use -p to open multiple files in different tabs of the same gvim instance.
# Also, get rid of all those unwanted error messages that we can't decipher,
# and which just end up making terminal scrollback messy.
gvim -p $@ > /dev/null 2>&1 &
