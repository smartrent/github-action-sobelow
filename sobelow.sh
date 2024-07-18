#!/bin/sh -l

mix local.hex --force
mix escript.install hex sobelow --force

~/.mix/escripts/sobelow $1 --format sarif > results.sarif

# By default Sobelow doesn't output anything if it didn't find anything.
# But an empty file is not a valid sarif file. So here we check to see
# whether the output file has any data. If not then we replace it with
# a valid sarif file that has no results.
[ -s results.sarif ] || cp /empty.sarif results.sarif