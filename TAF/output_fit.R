# Extract results of interest, write CSV output tables

# After:  CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)
# After:  cpue.csv, length_comps.csv (output)

library(TAF)
library(r4ss)

mkdir("output")

# Read model results
model <- SS_output("model", verbose=FALSE, printstats=FALSE)

# CPUE
cpue <- model$cpue
cpue <- cpue[c("Yr", "Obs", "Exp", "SE")]

# Length comps
length.comps <- model$lendbase
length.comps <- length.comps[c("Yr", "Fleet", "Bin", "Obs", "Exp", "Nsamp_adj")]

# Write tables
write.taf(cpue, dir="output")
write.taf(length.comps, dir="output")
