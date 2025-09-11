# Extract population results, write CSV output tables

# Before: model.rds (model)
# After:  batage.csv, fatage.csv, natage.csv, summary.csv (output)

library(TAF)
library(r4ss)

mkdir("output")

# Read model results
model <- SS_output("model", verbose=FALSE, printstats=FALSE)
batage <- model$batage[model$batage$Era == "TIME",]
derived <- model$derived_quants
m.area <- model$M_by_area[model$M_by_area$Era == "TIME",]
natage <- model$natage[model$natage$Era == "TIME",]
sprseries <- model$sprseries[model$sprseries$Yr <= model$endyr,]
timeseries <- model$timeseries[model$timeseries$Era == "TIME",]
z.area <- model$Z_by_area[model$Z_by_area$Era == "TIME",]

# B at age
batage <- batage[batage$"Beg/Mid" == "B",]
batage <- batage[c("Sex", "Yr", grepv("[0-9]", names(batage)))]
batage <- wide2long(batage, names=c("Age", "B"))

# F at age
exclude <- c("Area", "Bio_Pattern", "BirthSeas", "Settlement", "Platoon",
             "Morph", "Time", "Beg/Mid", "Era")
m.area <- m.area[!names(m.area) %in% exclude]
z.area <- z.area[!names(z.area) %in% exclude]
m.area <- wide2long(m.area)
z.area <- wide2long(z.area)
m.area <- aggregate(Value~Sex+Yr+Age, m.area, mean)
z.area <- aggregate(Value~Sex+Yr+Age, z.area, mean)
fatage <- z.area
fatage$Value <- z.area$Value - m.area$Value
names(fatage)[names(fatage) == "Value"] <- "F"

# N at age
natage <- natage[natage$"Beg/Mid" == "B",]
natage <- natage[c("Sex", "Yr", grepv("[0-9]", names(natage)))]
natage <- wide2long(natage, names=c("Age", "N"))

# Summary
Year <- timeseries$Yr
Rec <- timeseries$Recruit_0
Catch <- sprseries$Dead_Catch_B
TB <- timeseries$Bio_all
SB <- timeseries$SpawnBio
Fmort <- sprseries$"F=Z-M"
SB_SB0 <- SB / derived$Value[derived$Label == "SSB_Virgin"]
SB_SBmsy <- SB / derived$Value[derived$Label == "SSB_MSY"]
F_Fmsy <- Fmort / derived$Value[derived$Label == "annF_MSY"]
summary <- data.frame(Year, Rec, Catch, TB, SB, F=Fmort, SB_SB0, SB_SBmsy,
                      F_Fmsy)

# Write tables
write.taf(batage, dir="output")
write.taf(fatage, dir="output")
write.taf(natage, dir="output")
write.taf(summary, dir="output")
