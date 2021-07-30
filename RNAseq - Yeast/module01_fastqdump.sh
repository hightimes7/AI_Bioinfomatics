#!/bin/sh

list="con_S_rep1 con_S_rep2 con_S_rep3"

for x in $list
do
    fastq-dump --split-files --gzip ${x}
done
