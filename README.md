# General Configuration

```
apt install fish
./install.sh
```

## NVIM

```
:PlugInstall
:Copilot
```

## Secrets
- Make sure to copy over any public versions of private ssh keys we want to select.
- Get copies of OpenAI and Anthropic API keys.

## EC2

In order to get a hibernatable EC2 instance, you need to install the following packages:

1. Choose an instance type that supports it - t3a.medium
1. Choose an Ubuntu based AMI (ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301)

You can change the size of the instance when it's not hibernated.

TODO: Is it possible to install tailscale via cloud-init?
