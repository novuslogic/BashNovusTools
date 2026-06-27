# `install-docker-compose.sh`

Installs or updates Docker Compose as the legacy standalone
`/usr/local/bin/docker-compose` executable.

## Usage

```bash
./bin/install-docker-compose.sh
```

The script accepts no arguments.

## Requirements

- Linux or another Unix-like host supported by Docker Compose release binaries
- `bash`, `curl`, `grep` with PCRE (`grep -P`), `uname`, and `sudo`
- Internet access to the GitHub API and GitHub release assets
- Permission to write `/usr/local/bin/docker-compose` through `sudo`

## Behavior

1. Queries the latest Docker Compose GitHub release.
2. Reads the installed standalone Compose version, if present.
3. Downloads the release binary matching `uname -s` and `uname -m`.
4. Installs it at `/usr/local/bin/docker-compose` and makes it executable.
5. Runs `docker-compose --version` as verification.

The script exits when a command fails because it uses `set -e`. A failure to
extract the latest release tag also produces exit status 1.

## Important limitations

- This installs the standalone `docker-compose` command, not the modern
  `docker compose` CLI plugin.
- GitHub release tags normally include a leading `v`, while the installed
  version extraction removes it. The current equality check can therefore
  reinstall an already-current version.
- The GitHub API request is unauthenticated and may be affected by API rate
  limits.
- There is no checksum or signature verification of the downloaded executable.
