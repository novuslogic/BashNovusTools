# `update-docker-user-group.sh`

Adds the user named by `$USER` to the `docker` group, then starts a shell with
that group as the primary group.

## Usage

Run as the account that should receive Docker access:

```bash
./bin/update-docker-user-group.sh
```

## Requirements

- Linux with `sudo`, `usermod`, and `newgrp`
- An existing `docker` group
- A valid `USER` environment variable

## Behavior

```bash
sudo usermod -aG docker "$USER"
newgrp docker
```

`newgrp docker` starts a subshell and normally does not return until that shell
is exited. Logging out and back in applies the supplementary group membership
to a normal fresh session.

## Security and limitations

Membership in the `docker` group effectively grants root-level control of the
host through the Docker daemon. Grant it only to trusted users.

The current script does not use `set -e`, quote `$USER`, or explicitly validate
the target user and group. Running the entire script through `sudo` may also
change which value `USER` contains; invoke the script as the target user and let
its internal `sudo` request elevation.
