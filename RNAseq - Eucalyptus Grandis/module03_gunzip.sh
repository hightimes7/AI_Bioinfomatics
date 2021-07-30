#!/bin/sh

for x in *_paired*.fq.gz
do
	gunzip ${x}
done

