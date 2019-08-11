#!/bin/sh
# Script to get program completions.
echo $PATH | tr ":" "\n" | xargs -n 1 ls | cat | sort -u

