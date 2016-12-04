[![Build Status](https://travis-ci.org/SteveLane/europhytR.svg?branch=master)](https://travis-ci.org/SteveLane/europhytR)

# europhytR: interrogate EU biosecurity notifications

`europhytR` is a package to download and extract monthly interceptions data from [europhyt](http://ec.europa.eu/food/plant/plant_health_biosecurity/europhyt_en). This package is currently under active development.

## Java installation (macOS)

This package uses `tabulizer`. In order to install `tabulizer` you need Java. I had a heap of trouble trying to get it to install, as it looked like I already had Java installed (by my university). Instead, I ended installing from `brew`. Here's what I did:

```bash
$ brew cask install java
$ sudo R CMD javareconf
$ R -e "install.packages('rJava')"
```
