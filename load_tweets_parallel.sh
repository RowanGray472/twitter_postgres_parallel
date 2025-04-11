#!/bin/sh

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
time echo "$files" | parallel ./load_denormalized.sh

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time echo "$files" | parallel python3 ./load_tweets.py --db postgresql://postgres:pass@localhost:4721 --inputs $file

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
# FIXME: implement this with GNU parallel
