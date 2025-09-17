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


### Create SNAPCRAFT_STORE_CREDENTIALS

```
snapcraft export-login --snaps bashnovustools --acls package_access,package_push,package_update,package_release --channels edge,candidate --expires 2026-12-31 snap.login
```


### Install edge version

```
sudo snap install bashnovustools --channel=edge --jailmode
```

## Release with tags



https://git-scm.com/book/en/v2/Git-Basics-Tagging

### Manual Install


```bash
export DEBIAN_FRONTEND=noninteractive\nsudo apt-get update -y && sudo apt-get install -y libarchive-tools && sudo mkdir -p /etc/bashnovustools && curl -L https://github.com/novuslogic/BashNovusTools/releases/download/v0.1.2/BashNovusTools.v0.1.2.zip -o /tmp/bashnovustools.zip && sudo bsdtar -xf /tmp/bashnovustools.zip -C /etc/bashnovustools && sudo chmod +x /etc/bashnovustools/bin/*.sh && echo 'export PATH=\"/etc/bashnovustools/bin:$PATH\"' | sudo tee /etc/profile.d/bashnovustools.sh
```

