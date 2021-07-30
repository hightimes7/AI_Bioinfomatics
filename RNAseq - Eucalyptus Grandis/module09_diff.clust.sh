#!/bin/sh

analyze_diff_expr.pl --matrix ../RSEM.isoform.TMM.EXPR.matrix --samples ../samples.file &&

define_clusters_by_cutting_tree.pl -R diffExpr.P0.001_C2.matrix.RData --Ptree 30 --lexical_column_ordering

