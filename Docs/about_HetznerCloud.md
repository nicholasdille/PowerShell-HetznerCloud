# HetznerCloud

## about_HetznerCloud

# SHORT DESCRIPTION

This module supports the entire API of the Hetzner Cloud

# LONG DESCRIPTION

This module supports the following aspects of the [Hetzner Cloud API](https://docs.hetzner.cloud/):

- SSH keys

- Servers

- Floating IPs

Each of those is detailed in a separate about page.

# EXAMPLES

The following demonstrates how to provision a server

```powershell
Import-Module -Name HetznerCloud
Set-HetznerCloud -Token '123'
Add-HetznerCloudSshKey -Name 'default' -PublicKey 'ssh-rsa ...'
Get-HetznerCloudDatacenter
Get-HetznerCloudServerType
New-HetznerCloudServer -Name 'test' -Type cx11 -Image ubuntu-16.04 -SshKey default -Datacenter fsn1-dc8
```

# TROUBLESHOOTING NOTE

Please refer to the official documentation of [errors](https://docs.hetzner.cloud/#header-errors-1).

# SEE ALSO

Hetzner maintains a list of [other integrations](https://github.com/hetznercloud/awesome-hcloud).