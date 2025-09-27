# Run analysis, write model results

# After:  model_results (boot/data)
# After:  CompReport.sso, covar.sso, Forecast-report.sso, Report.sso, ss3.par,
#         warning.sso, wtatage.ss_new (model)

library(TAF)

mkdir("model")

# Model results, based on args(SS_output)
cp("boot/data/model_results/Report.sso", "model")
cp("boot/data/model_results/CompReport.sso", "model")
cp("boot/data/model_results/covar.sso", "model")
cp("boot/data/model_results/Forecast-report.sso", "model")
cp("boot/data/model_results/wtatage.ss_new", "model")
cp("boot/data/model_results/warning.sso", "model")
cp("boot/data/model_results/ss3.par", "model")
