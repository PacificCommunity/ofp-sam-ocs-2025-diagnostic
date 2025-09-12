# OCS 2025 Diagnostic Model

Download OCS 2025 assessment report:

- **Stock assessment of oceanic whitetip shark in the Western and Central Pacific Ocean: 2025**\
  **[WCPFC-SC21-2025/SA-WP-08](https://meetings.wcpfc.int/node/26650)**

Download OCS 2025 diagnostic model:

- Clone the **[ocs-2025-diagnostic](https://github.com/PacificCommunity/ofp-sam-ocs-2025-diagnostic)** repository or download as **[main.zip](https://github.com/PacificCommunity/ofp-sam-ocs-2025-diagnostic/archive/refs/heads/main.zip)** file

Download OCS 2025 ensemble results:

- Clone the **[ocs-2025-ensemble](https://github.com/PacificCommunity/ofp-sam-ocs-2025-ensemble)** repository or download as **[main.zip](https://github.com/PacificCommunity/ofp-sam-ocs-2025-ensemble/archive/refs/heads/main.zip)** file

## Reference model

In SPC assessment jargon, the *diagnostic model* is the reference model that is the basis of several sections and figures in the stock assessment report.

The diagnostic model is also the entry point when configuring and running the ensemble models that form the basis of scientific advice. When the ensemble includes specific factor levels (for steepness, likelihood weights, etc.) the diagnostic model has intermediate levels, while other grid members explore higher and lower levels.

Finally, the diagnostic model is also the starting point for the the next OCS stock assessment model development. One purpose of this repository is to give the stock assessor a good starting point that is organized and documented.

## Explore data, model settings, and results

The [ss3](ss3) folder includes all the Stock Synthesis (SS3) input files and model settings.

The **TAF** folder extracts the data and results from SS3 format to CSV format that can be examined using Excel, R, or other statistical software. [TAF](https://cran.r-project.org/package=TAF) is a standard reproducible format for stock assessments that is practical for making the SS3 **[data](TAF/data)** and **[output](TAF/output)** tables available in a format that is easy to examine. The **[report](TAF/report)** folder contains formatted tables and example plots.

## Run the assessment model

The OCS 2025 model takes around 1 minute to run. Executables are provided for Windows and Linux.

### Run in TAF format

Anyone can run the assessment analysis in TAF format. First install TAF and r4ss if they are not already installed.

```
install.packages("TAF")
install_github("r4ss/r4ss")
```

The full assessment model can be run as a TAF analysis. Start R, make sure the TAF folder is the working directory, and then run:

```
library(TAF)
taf.boot()
source.all()
```

This runs the assessment model and also extracts the data and output from the SS3 files and makes the results available as CSV files, which can be examined and analyzed further.
