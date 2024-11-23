## docs

### [connect-with-ssh](https://ubuntu.com/core/docs/connect-with-ssh)

----
# [ssh](https://help.ubuntu.com/community/SSH?_ga=2.229119445.831229570.1668829950-721891094.1667176278)
> Secure SHell
> A protocol for securely accessing one computer from another. Despite the name, SSH allows you to run command line and graphical programs, transfer files, and even create secure virtual private networks over the Internet.

```bash
ssh
```

## usage (default port 22)

```bash
ssh User_Name@IP_Address
```

## with certificate

```bash
ssh -i path\to\FiLe.pem User_Name@IP_Address
```

## Check ssh access

```bash
ssh -T git@bitbucket.org
```

## Generate ssh key

```bash
ssh-keygen -t ed25519 -b 4096 -C "{username@emaildomain.com}" -f {ssh-key-name}
```

> Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

```bash
ssh-keygen -t rsa -b 4096 -C "{username@emaildomain.com}"
```

## Add ssh key

```bash
eval "$(ssh-agent)"
ssh-add {ssh-key-name}
```

## Cat ssh key

```bash
cat {ssh-key-name}.pub
```
