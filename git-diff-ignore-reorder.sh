#!/usr/bin/env sh
# from http://stackoverflow.com/a/21779343/3150057
git diff $@ | awk '{ seen[substr($0,2)]++; l[i++] = $0; } END { for (j = 0; j < i; ++j) if (seen[substr(l[j],2)] < 2) print l[j] }' | grep '^[-+]'
