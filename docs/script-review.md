# Script review

Review scope: the six shell scripts in `bin`. This is a static code review; the
system-changing operations were not executed.

## Findings

| Severity | Script | Finding |
| --- | --- | --- |
| High | `install-docker-engine.sh` | The user-group command after `do_install` is unreachable because every successful installation branch exits from the function. |
| High | `update-docker-user-group.sh` | Docker group membership grants root-equivalent host control and the target is taken directly from an unvalidated `$USER`. |
| Medium | `install-docker-compose.sh` | Latest tags normally contain `v`, while the installed version parser returns only digits, causing unnecessary reinstall attempts. |
| Medium | `install-docker-compose.sh` | The downloaded executable is not verified with a checksum or signature. |
| Medium | `install-docker-engine.sh` | The embedded upstream installer snapshot can age out of compatibility with distributions and Docker repositories. |
| Medium | `install-docker-engine.sh` | Any existing `docker` executable causes exit status 1, preventing upgrades and repairs. |
| Medium | `update-ubuntu.sh` | Failures do not stop execution because the script does not enable fail-fast handling. |
| Low | Multiple scripts | Variables such as `$USER` and destination paths are not consistently quoted. |
| Low | `restart-docker.sh` | Separate stop/start commands can leave Docker stopped when the start step fails. |

## Recommended remediation order

1. Move group setup outside the installer's exiting control flow, resolve its
   path relative to the script, and make the target user explicit.
2. Decide whether Compose should be the modern CLI plugin or the legacy
   standalone executable; normalize version strings and verify downloads.
3. Refresh or replace the vendored Docker installer with maintained,
   distribution-specific installation logic.
4. Add strict error handling, input validation, quoting, and automated
   `shellcheck` plus syntax checks for the smaller scripts.
5. Add integration tests in disposable Linux containers or virtual machines;
   do not exercise these administrative scripts directly on CI hosts.

## Validation status

Documentation was derived from the checked-in scripts. Runtime installation,
package upgrades, group changes, and Docker service restarts were intentionally
not performed during review.
