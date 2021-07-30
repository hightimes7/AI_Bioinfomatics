#!/bin/sh

mkdir rsem

for sample in *_rsem
do
	mv ${sample}/RSEM.genes.results ${sample}/${sample%_rsem}.genes.results
	cp ${sample}/*genes.results rsem/.
done

