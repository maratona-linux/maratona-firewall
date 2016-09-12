#Maratona Firewall

Este repositório trata dos pacote maratona-firewall do Maratona Linux.

O Maratona Linux é constituído por um conjunto de pacotes que modificam uma
instalação padrão do ubuntu em Maratona Linux.

Esta modificação do Ubuntu é utilizada como ambiente de programação oficial
dos competidores da Maratona de Programação no Brasil.

Este pacote isola o competidor da rede evitando que pacotes de rede entrem e
saiam do maratona-linux, exceto pelo acesso ao servidor BOCA.

#Instalação

Todos os pacotes estão disponíveis no PPA:
https://launchpad.net/~brunoribas/+archive/ubuntu/ppa-maratona

Para instalar em um ubuntu basta:

```
sudo add-apt-repository ppa:brunoribas/ppa-maratona
sudo apt-get update
sudo apt-get install maratona-firewall
```
