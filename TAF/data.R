# Prepare data, write CSV data tables

# Before: OCS.dat (boot/data)
# After:  cpue.csv, fisheries.csv, length_comps.csv, (data)

library(TAF)
library(r4ss)

mkdir("data")

# Read model results
dat <- SS_readdat("boot/data/OCS.dat", verbose=FALSE)

# CPUE
cpue <- dat$CPUE
cpue$month <- NULL
cpue$index <- NULL

# Fisheries
fisheries <- dat$fleetinfo
fisheries <- fisheries[1:4,]  # purse seine CPUE not used
fisheries$area <- NULL
fisheries$need_catch_mult <- NULL

# Length comps
length.comps <- comp2long(dat$lencomp)
length.comps <- length.comps[length.comps$sex == "f",]
length.comps$month <- NULL
length.comps$sex <- NULL
length.comps$part <- NULL

# Write CSV tables
write.taf(cpue, dir="data")
write.taf(fisheries, dir="data")
write.taf(length.comps, dir="data")
