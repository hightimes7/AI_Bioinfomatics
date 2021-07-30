#!/bin/sh

echo 'Trimmomatic start!' 

for gz in *1.fastq.gz
do
	java -jar /usr/local/bin/Trimmomatic-0.39/trimmomatic-0.39.jar PE -summary ${gz%_1.fastq.gz}.stats ${gz} ${gz%1.fastq.gz}2.fastq.gz ${gz%1.fastq.gz}paired_1.fq.gz ${gz%1.fastq.gz}unpaired_1.fq.gz ${gz%1.fastq.gz}paired_2.fq.gz ${gz%1.fastq.gz}unpaired_2.fq.gz ILLUMINACLIP:/usr/local/bin/Trimmomatic-0.39/illumina_PE_adapters.fa:2:30:10:2:keepBothReads LEADING:10 TRAILING:10 MINLEN:50 &&
	echo ${gz%_1.fastq.gz} 'cleaning done!'
done

echo 'whole read cleaning complete!'

