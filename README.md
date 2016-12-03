# europhytR: interrogate EU biosecurity notifications

## Java installation (macOS)

In order to install `tabulizer` you need Java. I had a heap of trouble trying to get it to install, as it looked like I already had Java installed (by my university). Instead, I ended installing from `brew`. Here's what I did:

```bash
$ brew cask install java
$ sudo R CMD javareconf
$ R -e "install.packages('rJava')"
```
