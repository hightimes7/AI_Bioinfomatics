#!/bin/sh

#sample replicates QC
PtR --matrix RSEM.isoform.counts.matrix --samples samples.file --log2 --min_rowSums 10 --compare_replicates --CPM --sample_cor_matrix --center_rows --prin_comp 3 &&

##differential expression analysis
run_DE_analysis.pl --matrix RSEM.isoform.counts.matrix --method edgeR --samples_file samples.file

