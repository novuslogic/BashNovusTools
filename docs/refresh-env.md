# `refresh-env.sh`

Replaces the current script process with a login shell for the user named by
`$USER`.

## Usage

```bash
./bin/refresh-env.sh
```

Equivalent operation:

```bash
exec su -l "$USER"
```

## Requirements and behavior

- Requires `bash`, `su`, and a valid, non-empty `USER` environment variable.
- May prompt for the user's password, depending on the caller and PAM policy.
- `exec` means the script does not return to its caller; exiting the login shell
  returns to the process that originally launched the script's caller.

## Limitations

The current implementation does not quote `$USER`. It also starts a new login
session rather than reloading environment values into the existing shell. For
group membership changes, logging out and back in is generally clearer.
