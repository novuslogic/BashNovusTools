## Compile

bashnovustools/snapcraft pack


## Devmode Install

sudo snap install ./bashnovustools_0.1_amd64.snap --dangerous --devmode



## After install, confirm what landed in prime:
ls -l /snap/bashnovustools/current/bin/


## Uninstall

sudo snap remove --purge bashnovustools


## publishing

https://documentation.ubuntu.com/snapcraft/stable/how-to/publishing/

### Regitser

https://snapcraft.io/register-snap

snapcraft register --private bashnovustools


### GitHub Actions

https://github.com/snapcore

