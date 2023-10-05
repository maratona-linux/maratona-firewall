prefix=/usr

ntp_st1_servers := a.st1.ntp.br b.st1.ntp.br c.st1.ntp.br d.st1.ntp.br
ntp_common_servers := a.ntp.br b.ntp.br c.ntp.br
ntp_servers := $(ntp_st1_servers) $(ntp_common_servers) gps.ntp.br

installed_hosts := $(DESTDIR)$(prefix)/share/maratona-firewall/hosts

installed_ntp_servers := $(addprefix $(installed_hosts)/, $(ntp_servers))
ntp_servers_path := $(addprefix hosts/, $(ntp_servers))

all:
	:

$(installed_ntp_servers):$(installed_hosts)/%:hosts/%
	install -D $< $@

install-ntp-servers: $(installed_ntp_servers)

install: install-ntp-servers install-systemd-hook
	# main maratona-linux server
	install -D hosts/nutellaboot.naquadah.com.br $(DESTDIR)$(prefix)/share/maratona-firewall/hosts/nutellaboot.naquadah.com.br
	# create empty directories
	install -d $(DESTDIR)/etc/maratona-firewall/hosts
	install -d $(DESTDIR)/etc/maratona-firewall/ufwrules
	# copy firewall script used by the systemd service
	install -m 755 -D maratona-firewall-configuration.sh $(DESTDIR)$(prefix)/share/maratona-firewall/maratona-firewall-configuration.sh

install-systemd-hook:
	# copy systemd service to call the firewall script
	install -m 644 -D service/maratona-firewall.service $(DESTDIR)/lib/systemd/system/maratona-firewall.service

.PHONY: all install install-systemd-hook install-ntp-servers
