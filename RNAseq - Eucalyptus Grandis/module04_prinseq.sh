#!/bin/sh

echo 'Prinseq start!'

for fq in *paired_1.fq
do
	prinseq-lite -fastq ${fq} -fastq2 ${fq%1.fq}2.fq -out_format 3 -out_good ${fq%paired_1.fq}good -out_bad ${fq%paired_1.fq}bad -log ${fq%_paired_1.fq}.log -min_len 50 -min_qual_score 5 -min_qual_mean 15 -derep 14 &&
	echo ${fq%_paired_1.fq} 'prinseq done'
done
echo 'Prinseq.sh complete!'

