prefix=/usr

all:
	:

install: install-systemd-hook
	install -D hosts/nutellaboot.naquadah.com.br $(DESTDIR)$(prefix)/share/maratona-firewall/hosts/nutellaboot.naquadah.com.br
	install -d $(DESTDIR)/etc/maratona-firewall/hosts
	install -m 755 -D maratona-firewall-configuration.sh $(DESTDIR)$(prefix)/share/maratona-firewall/maratona-firewall-configuration.sh

install-systemd-hook:
	install -m 644 -D service/maratona-firewall.service $(DESTDIR)/lib/systemd/system/maratona-firewall.service

.PHONY: all install install-systemd-hook
