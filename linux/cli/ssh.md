## docs

### [connect-with-ssh](https://ubuntu.com/core/docs/connect-with-ssh)

----
# [ssh](https://help.ubuntu.com/community/SSH?_ga=2.229119445.831229570.1668829950-721891094.1667176278)
> Secure SHell
> A protocol for securely accessing one computer from another. Despite the name, SSH allows you to run command line and graphical programs, transfer files, and even create secure virtual private networks over the Internet.

```
ssh
```

## usage (default port 22)

```
ssh User_Name@IP_Address
```

## with certificate

```
ssh -i path\to\FiLe.pem User_Name@IP_Address
```

## Check ssh access

```
ssh -T git@bitbucket.org
```