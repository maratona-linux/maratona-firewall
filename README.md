# Maratona Firewall

This repository contains all files regarding the maratona-firewall package.
This package is responsible to block all network traffic but the approved
ICPC LATAM hosts, which are related to BOCA.

# Installing

Please follow instructions detailed here:
  https://github.com/maratona-linux/maratona-linux/blob/master/README.md

# Enabling my own BOCA

After installing `maratona-firewall` package it will enable the global boca
used within the ACM ICPC LATAM. Every network traffic is blocked unless its
destination is LATAM BOCA.

To enable your own boca you need to edit the following file:
```
/etc/maratona-firewall/hosts/boca.localdomain
```

This file must contain only one IP address that points to your boca
instance.

Also, if you desire, you may allow network traffic for other machines, this
is useful if you have multiple boca instances. To do this you have to create
a file in `/etc/maratona-firewall/hosts/`. The filename is recommended to be
the FQDN of the host, and inside the file you must set the IP to this host.

After that you must run:
```
sudo dpkg-reconfigure maratona-firewall
```

Now your config will me loaded.

## Disable some host

To disable some host you added earlier, you should remove the file that
point to that file and reconfigure the package.

WARNING: Do not remove the boca.localdomain file. This file should always
exist.
