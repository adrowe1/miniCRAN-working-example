# miniCRAN working example

Example code to create miniCRAN repos and install from the repo on a closed system

It is a challenge to keep your R packages and dependencies up to date (or version specific) on systems such as 
the University of Oslo's [TSD](http://www.uio.no/tjenester/it/forskning/sensitiv/mer-om/index.html) without constantly
harassing systems administrators.

The miniCRAN solution is simple and straightforward. The only downside is the possibility that lots of users have
duplicate packages in their private repos. With large Bioconductor genomics packages this could consume a reasonable
amount of space.

TO DO:
 - Add Bioconductor packages
 - Generate the package list code to install packages automatically, rather than pasting in a long character vector of package names
