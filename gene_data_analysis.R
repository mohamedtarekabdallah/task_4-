gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")
control <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)
chromosome <- c("17", "17", "7", "8", "10", "12")
fold_change <- treated / control
classification <- ifelse(fold_change > 1.2,"upregulated",ifelse(fold_change < 0.8,"downregulated","stable"))
classification <- factor(classification,levels = c("upregulated", "downregulated", "stable"))

gene_info <- list(names = gene_names,states= list("control" = control ,"treated" = treated),source = "Gene expression dataset")
gene_info$names
gene_info$data_analyzed <- "Genes"

gene_df <- data.frame(gene_names,control,treated,chromosome,fold_change,classification)
gene_df[gene_df$chromosome==17,]
gene_df$log2_fc <- log2(fold_change)
gene_df <- gene_df[order(gene_df$fold_change, decreasing = TRUE)]
png("expression_plot.png")
plot(gene_df$control,gene_df$treated,xlab = "Control",ylab = "Treated", col = point_colors, main = "Gene Expression: Control vs Treated")
point_colors <- ifelse(
  gene_df$classification == "upregulated","red",ifelse(gene_df$classification == "downregulated","blue","grey"))
dev.off()
write.csv(gene_df,"gene_df_sorted.csv",row.names = FALSE)
