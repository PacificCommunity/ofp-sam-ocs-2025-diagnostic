# Produce plots and tables for report

# Before: biology.csv, likelihoods.csv, stats.csv, summary.csv (output)
# After:  biology.csv, likelihoods.csv, stats.csv, summary.csv (report)

library(TAF)

mkdir("report")

# Read table
biology <- read.taf("output/biology.csv")
likelihoods <- read.taf("output/likelihoods.csv")
stats <- read.taf("output/stats.csv")
summary <- read.taf("output/summary.csv")

# Format table
biology <- rnd(biology, c("M", "Len", "Wt", "Mat"), c(3, 1, 1, 3))
likelihoods <- data.frame(component=names(likelihoods),
                          value=unlist(likelihoods), row.names=NULL)
likelihoods <- rnd(likelihoods, "value", 3)
stats <- data.frame(info=names(stats), value=unlist(stats), row.names=NULL)
summary <- rnd(summary, c("Rec", "Catch", "TB", "SB"))
summary <- rnd(summary, c("F", "SB_SB0", "SB_SBmsy", "F_Fmsy"), 2)

# Write table
write.taf(biology, dir="report")
write.taf(likelihoods, dir="report")
write.taf(stats, dir="report", quote=TRUE)
write.taf(summary, dir="report")
