#!/bin/bash

# Reset no ufw - apaga tudo e volta para o padrao
ufw -f reset

# Por padrao, o firewall vem desligado
ufw enable

# Atribuindo o comportamento padrao
# Deve servir tanto para os pacotes ipv4 como o ipv6 que nao se encaixam nas
# regras descritas a seguir.
ufw default deny incoming
ufw default deny outgoing
ufw default deny routed

# Permitindo pacotes na interface loopback - Valido para IPv4 e v6.
ufw allow in on lo
ufw allow out on lo

# Para o $BOCAIP vale tudo
for LATAMHOST in /usr/share/maratona-firewall/hosts/* /etc/maratona-firewall/hosts/*; do
  if [[ ! -e "$LATAMHOST" ]]; then
    continue;
  fi
  HOSTNAME="$(basename "$LATAMHOST")"
  echo "Enabling $HOSTNAME"
  for IP in $(< "$LATAMHOST"); do
    ufw allow out proto udp to "$IP"
    ufw allow out proto tcp to "$IP"
  done

  # Only the first IP in the file will have an entry in /etc/hosts
  IP="$(head -n1 "$LATAMHOST")"
  TMPFILE=$(mktemp)
  grep --extended-regexp --invert-match \
    "(${IP}|${HOSTNAME})" /etc/hosts > "$TMPFILE"
  printf '%s\t%s\n' "$IP" "$HOSTNAME" | cat "$TMPFILE" - > /etc/hosts
  rm "$TMPFILE"
done

# configurações para UFW específicas

for MLUFW in /etc/maratona-firewall/ufwrules/*; do
  [[ ! -e "$MLUFW" ]] && continue
  . "$MLUFW"
done

# Rejeitando os pacotes udp e tcp para qualquer ip
ufw reject out proto udp to any
ufw reject out proto tcp to any

exit 0
