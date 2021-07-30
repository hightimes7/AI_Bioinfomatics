#!/bin/sh

echo 'rsem start!'

align_and_estimate_abundance.pl --transcripts Eucalyptus_grandis.ref --est_method RSEM --aln_method bowtie2 --prep_reference &&

for fq in *good_1.fastq
do
	align_and_estimate_abundance.pl --transcripts Eucalyptus_grandis.ref --seqType fq --left ${fq} --right ${fq%1.fastq}2.fastq --est_method RSEM --output_dir ${fq%good_1.fastq}rsem --aln_method bowtie2
	echo ${fq%_good_1.fastq} 'rsem complete!'
done

echo 'rsem end!'

