library(cluster)
library(Biobase)
library(fastcluster)
source("/usr/local/bin/trinityrnaseq-v2.12.0/Analysis/DifferentialExpression/R/heatmap.3.R")
load("diffExpr.P0.001_C2.matrix.RData")
data = heatmap_data
gene_partition_assignments <- cutree(as.hclust(hc_genes), h=30/100*max(hc_genes$height))
write.table(gene_partition_assignments[hc_genes$order], file="clusters_fixed_P_30.heatmap.heatmap_gene_order.txt", quote=F, sep='	')
max_cluster_count = max(gene_partition_assignments)
outdir = "diffExpr.P0.001_C2.matrix.RData.clusters_fixed_P_30"
dir.create(outdir)
partition_colors = rainbow(length(unique(gene_partition_assignments)), start=0.4, end=0.95)
gene_colors_dframe = data.frame(clusters=gene_partition_assignments, colors=partition_colors[gene_partition_assignments])
write.table(gene_colors_dframe, file="clusters_fixed_P_30.heatmap.gene_cluster_colors.dat", quote=F, sep='	')
gene_colors = as.matrix(partition_colors[gene_partition_assignments])
pdf("clusters_fixed_P_30.heatmap.heatmap.pdf")
data = data[,order(colnames(data))]
heatmap.3(data, dendrogram='row', Rowv=as.dendrogram(hc_genes), Colv=F, col=myheatcol, RowSideColors=gene_colors, scale="none", density.info="none", trace="none", key=TRUE, cexCol=1, margins=c(10,10))
dev.off()
gene_names = rownames(data)
num_cols = length(data[1,])
for (i in 1:max_cluster_count) {
    partition_i = (gene_partition_assignments == i)
    partition_data = data[partition_i,,drop=F]
partition_data = partition_data[,order(colnames(partition_data)), drop=F]
    outfile = paste(outdir, "/subcluster_", i, "_log2_medianCentered_fpkm.matrix", sep='')
    write.table(partition_data, file=outfile, quote=F, sep="\t")
}
