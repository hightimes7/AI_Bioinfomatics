#!/bin/sh

list="C_1 C_2 C_3 T_1 T_2 T_3"
for x in $list
do 
	fastq-dump --split-files --gzip $x
done

