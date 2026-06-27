# `restart-docker.sh`

Stops and then starts the Docker systemd service.

## Usage

```bash
./bin/restart-docker.sh
```

The script accepts no arguments.

## Requirements

- Linux using systemd
- Docker registered as `docker.service`
- `sudo` access to control the service

## Behavior

The script runs `sudo systemctl stop docker`, checks its status, and then runs
`sudo systemctl start docker`. It exits with status 1 and a message when either
operation fails. On success it prints `Docker service restarted successfully.`

## Operational impact

Stopping Docker interrupts running containers unless another mechanism manages
their availability. This script is not the same as `systemctl restart docker`:
if the stop succeeds but the start fails, Docker remains stopped.
