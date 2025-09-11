# Extract results of interest, write CSV output tables

# Before: CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)
# After:  biology.csv, catch.csv, likelihoods.csv, selectivity.csv,
#         stats.csv (output)

library(TAF)
library(r4ss)

mkdir("output")

# Read model results
model <- SS_output("model", verbose=FALSE, printstats=FALSE)
catch <- model$catch
endgrowth <- model$endgrowth
likelihoods <- model$likelihoods_used
sizeselex <- model$sizeselex

# Biology
biology <- subset(endgrowth, Seas==1 & Settlement==1,
                  c("Sex", "Age_Beg", "M", "Len_Beg", "Wt_Beg", "Mat_F_Natage"))
names(biology) <- sub("_Beg", "", names(biology))
names(biology) <- sub("_F_Natage", "", names(biology))
row.names(biology) <- NULL

# Catch
catch <- catch[c("Fleet", "Fleet_Name", "Yr", "dead_bio")]
catch <- catch[catch$Yr >= model$startyr,]
names(catch)[names(catch) == "dead_bio"] <- "Catch"
row.names(catch) <- NULL

# Likelihoods
likelihoods <- likelihoods[likelihoods$values != 0,]
likelihoods <- data.frame(t(likelihoods["values"]), row.names=NULL)

# Selectivity
selectivity <- sizeselex[sizeselex$Factor == "Lsel",]
selectivity <- selectivity[selectivity$Sex == 1,]
selectivity <- selectivity[selectivity$Yr == model$endyr,]
exclude <- c("Factor", "Yr", "Sex", "Label")
selectivity <- selectivity[!names(selectivity) %in% exclude]
selectivity <- selectivity[selectivity$Fleet %in% 1:4,]  # fleets 5 & 6 not used
selectivity <- taf2long(selectivity, names=c("Fleet", "Length", "Sel"))

# Stats
npar <- model$N_estimated_parameters
objfun <- likelihoods$TOTAL
gradient <- model$maximum_gradient_component
start <- sub("StartTime: ", "", model$StartTime)
runtime <- sub("\\.$", "", model$RunTime)
version <- sub(";.*", "", model$SS_version)
stats <- data.frame(npar, objfun, gradient, start, runtime, version)

# Write tables
write.taf(biology, dir="output")
write.taf(catch, dir="output")
write.taf(likelihoods, dir="output")
write.taf(stats, dir="output", quote=TRUE)
write.taf(selectivity, dir="output")
