# Run analysis, write model results

# Before: ss3, ss3.exe (boot/software/ss3),
#         forecast.ss, OCS.ctl, OCS.dat, starter.ss (boot/data)
# After:  CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)

library(TAF)

mkdir("model")

# Get model executable
exefile <- if(os.linux()) "ss3" else "ss3.exe"
cp(file.path("boot/software/ss3", exefile), "model")

# Get model input files
cp("boot/data/starter.ss", "model")
cp("boot/data/forecast.ss", "model")
cp("boot/data/OCS.ctl", "model")
cp("boot/data/OCS.dat", "model")

# Run model
setwd("model")
system("./ss3")
setwd("..")
