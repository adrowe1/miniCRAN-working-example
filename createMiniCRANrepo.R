# ref material https://cran.r-project.org/web/packages/miniCRAN/vignettes/miniCRAN-introduction.html
# and for Bioconductor https://cran.r-project.org/web/packages/miniCRAN/vignettes/miniCRAN-non-CRAN-repos.html
library(miniCRAN)
library(lubridate)

# use Rstudio CRAN mirror
CRANmirror <- c(CRAN="https://cran.rstudio.com/")

# Specify a list of packages to download
pkgs <- c("broom", "car", "d3heatmap", "d3Network", "DiagrammeR", "dplyr",
	"DT", "genoPlotR", "GGally", "ggplot2", "ggthemes", "gplots",
	"htmlwidgets", "leaflet", "lubridate", "magrittr", "moments",
	"plot3D", "plot3Drgl", "plotly", "purrr", "R.utils", "RColorBrewer",
	"RcppRoll", "readr", "readxl", "reshape2", "rmarkdown", "RSQLite",
	"rvest", "shinyAce", "shinyBS", "shinydashboard", "shinyFiles",
	"stringr", "svglite", "threejs", "tidyr", "tm", "viridis", "wordcloud",
	"zoo")

pkgList <- pkgDep(pkgs, repos=CRANmirror, type="source")

# Define a directory to contain the local miniCRAN repo
dir.create(pth <- file.path("../miniCRANrepos/", today()))

# Make repo for source and win.binary containing packages and dependencies
makeRepo(pkgList, path=pth, repos=CRANmirror, type="source")
makeRepo(pkgList, path=pth, repos=CRANmirror, type="win.binary")


# Add new packages (from CRAN) to the miniCRAN repo
addPkgs <- c("lme4")
addPackage(addPkgs, path=pth, repos=CRANmirror, type="source")

# Update available packages
updatePackages(path=pth, repos=CRANmirror, type="source", ask=FALSE) # should need update
updatePackages(path=pth, repos=CRANmirror, type="win.binary", ask=FALSE) # should be current as lme4 not added here


###### RUN THE FOLLOWING CODE INSIDE YOUR CLOSED SYSTEM AFTER UPLOADING THE miniCRAN MIRROR
# This list is the same as above, but here to keep things clear.
pkgs <- c("broom", "car", "d3heatmap", "d3Network", "DiagrammeR", "dplyr",
	"DT", "genoPlotR", "GGally", "ggplot2", "ggthemes", "gplots",
	"htmlwidgets", "leaflet", "lubridate", "magrittr", "moments",
	"plot3D", "plot3Drgl", "plotly", "purrr", "R.utils", "RColorBrewer",
	"RcppRoll", "readr", "readxl", "reshape2", "rmarkdown", "RSQLite",
	"rvest", "shinyAce", "shinyBS", "shinydashboard", "shinyFiles",
	"stringr", "svglite", "threejs", "tidyr", "tm", "viridis", "wordcloud",
	"zoo")


# This needs to match the path to your copied miniCRAN directory on the closed system
miniCRANrepoPath <- "FIXME"

# List all files in your copied miniCRAN directory
list.files(miniCRANrepoPath, recursive=TRUE, full.names=FALSE)

# Install packages for R on windows.
# To install packages from a local repository, you need to use the URI convention file:/// to point to your file lcoation.
install.packages(pkgs,
	repos = paste0("file://", miniCRANrepoPath),
	type = "win.binary")


