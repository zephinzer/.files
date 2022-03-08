# Keygens

This directory contains two files which is used to generate my own GPG keys on my machines.

> You can use them by replacing my public details with yours and modifying your own `.gitconfig` files accordingly

To generate the keys, run:

```sh
# for github key...
gpg --generate-key --batch ./github

# for gitlab key...
gpg --generate-key --batch ./gitlab
```

The output of the above should contain a key ID to use. Use the key ID in the `.gitconfig` file as shown:

```ini
[user]
  email = public-email@domain.com
  signingkey = ${KEY_ID}
```

## References

- [4.5.4 Unattended key generation](https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html)
