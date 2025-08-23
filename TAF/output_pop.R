# Extract results of interest, write CSV output tables

# After:  CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)
# After:  refpts.csv, summary.csv (output)

library(TAF)
library(r4ss)

mkdir("output")

# Read model results
model <- SS_output("model", verbose=FALSE, printstats=FALSE)
biology <- model$biology
derived <- model$derived_quants
dynamic <- model$Dynamic_Bzero[model$Dynamic_Bzero$Era == "TIME",]
exploitation <- model$exploitation[model$exploitation$Yr %in% 1995:2023,]
Natural_Mortality <- model$Natural_Mortality
recruit <- model$recruit[model$recruit$era == "Main",]
timeseries <- model$timeseries[model$timeseries$Era == "TIME",]

# Biology
biology <- biology[c("Len_mean", "Wt_F", "Wt_M", "Mat")]
Natural_Mortality

# Recruitment
Rec <- timeseries$Recruit_0
RecDev <- recruit$dev

# Biomass
TotalB <- timeseries$Bio_all
SB <- timeseries$SpawnBio
SB0 <- model$SBzero
SBF0 <- dynamic$SSB_nofishing
SBmsy <- derived$Value[derived$Label == "SSB_MSY"]
SB_SB0 <- SB / SB0
SB_SBF0 <- SB / SBF0
SB_SBmsy <- SB / SBmsy

# Fishing mortality
Fmort <- exploitation$annual_F
Fmsy <- derived$Value[derived$Label == "annF_MSY"]
F_Fmsy <- Fmort / Fmsy

# Catch
catch <- model$catch
catch <- catch[catch$Yr %in% 1995:2023,]
catch <- catch[c("Fleet", "Fleet_Name", "Yr", "dead_bio", "dead_num")]
Catch <- aggregate(dead_bio~Yr, catch, sum)$dead_bio
CatchNum <- aggregate(dead_num~Yr, catch, sum)$dead_num

# Summary
Year <- timeseries$Yr
summary <- data.frame(Year, Rec, RecDev, TotalB, SB, F=Fmort, Catch, CatchNum,
                      SBF0, SB_SB0, SB_SBF0, SB_SBmsy, F_Fmsy)

# Refpts
refpts <- data.frame(SB0, SBmsy, Fmsy)

# Write tables
write.taf(refpts, dir="output")
write.taf(summary, dir="output")
