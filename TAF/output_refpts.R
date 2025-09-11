# Extract reference points, write CSV output tables

# Before: CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)
# After:  refpts.csv (output)

library(TAF)
library(r4ss)

mkdir("output")

# Read model results
model <- SS_output("model", verbose=FALSE, printstats=FALSE)
derived <- model$derived_quants
sprseries <- model$sprseries
timeseries <- model$timeseries

# Calculate reference points
Clatest <- sprseries$Dead_Catch_B[sprseries$Yr == 2023]
Flatest <- sprseries$"F=Z-M"[sprseries$Yr == 2022]
Fmsy <- derived$Value[derived$Label == "annF_MSY"]
Frecent <- mean(sprseries$"F=Z-M"[sprseries$Yr %in% 2019:2022])
MSY <- derived$Value[derived$Label == "Dead_Catch_MSY"]
SB0 <- derived$Value[derived$Label == "SSB_Virgin"]
SBlatest <- derived$Value[derived$Label == "SSB_2023"]
SBmsy <- derived$Value[derived$Label == "SSB_MSY"]
SBrecent <- mean(derived$Value[derived$Label %in% paste0("SSB_", 2020:2023)])
TBlatest <- timeseries$Bio_all[timeseries$Yr == 2023]
TBrecent <- mean(timeseries$Bio_all[timeseries$Yr %in% 2020:2023])
Flatest_Fmsy <- Flatest / Fmsy
Frecent_Fmsy <- Frecent / Fmsy
SBlatest_SB0 <- SBlatest / SB0
SBlatest_SBmsy <- SBlatest / SBmsy
SBrecent_SB0 <- SBrecent / SB0
SBrecent_SBmsy <- SBrecent / SBmsy

# Construct reference point table
refpts <- data.frame(Clatest, Flatest, Fmsy, Frecent, MSY, SB0, SBlatest, SBmsy,
                     SBrecent, TBlatest, TBrecent, Flatest_Fmsy, Frecent_Fmsy,
                     SBlatest_SB0, SBlatest_SBmsy, SBrecent_SB0, SBrecent_SBmsy)
refpts <- data.frame(Metric=names(refpts), Value=unlist(refpts), row.names=NULL)

# Write table
write.taf(refpts, dir="output")
