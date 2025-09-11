# Produce plots and tables for report

# Before: biology.csv, likelihoods.csv, stats.csv, summary.csv (output)
# After:  bbmsy.png, biology.csv, biomass.png, catch.png, depletion.png,
#         ffmsy.png, growth.png, fmort.png, likelihoods.csv, maturity.png,
#         stats.csv, summary.csv, weight.png (report)

library(TAF)

mkdir("report")

# Read tables
biology <- read.taf("output/biology.csv")
likelihoods <- read.taf("output/likelihoods.csv")
stats <- read.taf("output/stats.csv")
summary <- read.taf("output/summary.csv")

# Plot time series
taf.png("biomass")
plot(SB~Year, summary, ylim=lim(SB), type="l", yaxs="i", lwd=2,
     ylab="SB (tonnes)")
dev.off()
taf.png("catch")
barplot(Catch~Year, summary, ylab="Catch (tonnes)")
dev.off()
taf.png("fmort")
plot(F~Year, summary, ylim=lim(F), type="l", yaxs="i", lwd=2,
     ylab="Fishing mortality")
dev.off()
taf.png("depletion")
plot(SB_SB0~Year, summary, ylim=lim(SB_SB0), type="l", yaxs="i", lwd=2,
     ylab="SB/SB0")
dev.off()
taf.png("bbmsy")
plot(SB_SBmsy~Year, summary, ylim=lim(SB_SBmsy), type="l", yaxs="i", lwd=2,
     ylab="SB/SBmsy")
dev.off()
taf.png("ffmsy")
plot(F_Fmsy~Year, summary, ylim=lim(F_Fmsy), type="l", yaxs="i", lwd=2,
     ylab="F/Fmsy")
abline(h=1, lwd=2, lty=3, col="darkgray")
dev.off()

# Plot biology
taf.png("growth")
plot(Len~Age, biology, subset=Sex==1, ylim=lim(Len), type="l", yaxs="i", lwd=2,
     xlab="Age (yr)", ylab="Length (cm)")
dev.off()
taf.png("weight")
plot(Wt~Age, biology, subset=Sex==1, ylim=lim(Wt), type="l", yaxs="i", lwd=2,
     col=2, xlab="Age (yr)", ylab="Weight (kg)")
lines(Wt~Age, biology, subset=Sex==2, ylim=lim(Wt), type="l", lwd=2, col=4)
legend("topleft", c("Female","Male"), lwd=3, col=c(2,4), bty="n", inset=0.02,
       y.intersp=1.25)
dev.off()
taf.png("maturity")
plot(Mat~Age, biology, subset=Sex==1, ylim=0:1, type="l", lwd=2,
     xlab="Age (yr)", ylab="Proportion mature")
dev.off()

# Format tables
biology <- rnd(biology, c("M", "Len", "Wt", "Mat"), c(3, 1, 1, 3))
likelihoods <- data.frame(component=names(likelihoods),
                          value=unlist(likelihoods), row.names=NULL)
likelihoods <- rnd(likelihoods, "value", 3)
stats <- data.frame(info=names(stats), value=unlist(stats), row.names=NULL)
summary <- rnd(summary, c("Rec", "Catch", "TB", "SB"))
summary <- rnd(summary, c("F", "SB_SB0", "SB_SBmsy", "F_Fmsy"), 2)

# Write tables
write.taf(biology, dir="report")
write.taf(likelihoods, dir="report")
write.taf(stats, dir="report", quote=TRUE)
write.taf(summary, dir="report")
