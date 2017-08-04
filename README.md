# Maratona Firewall

Este repositório trata dos pacote maratona-firewall do Maratona Linux.

O Maratona Linux é constituído por um conjunto de pacotes que modificam uma
instalação padrão do ubuntu em Maratona Linux.

Esta modificação do Ubuntu é utilizada como ambiente de programação oficial
dos competidores da Maratona de Programação no Brasil.

Este pacote isola o competidor da rede evitando que pacotes de rede entrem e
saiam do maratona-linux, exceto pelo acesso ao servidor BOCA.

# Instalação

Todos os pacotes estão disponíveis no PPA:
https://launchpad.net/~brunoribas/+archive/ubuntu/ppa-maratona

Para instalar em um ubuntu basta:

```
sudo add-apt-repository ppa:brunoribas/ppa-maratona
sudo apt-get update
sudo apt-get install maratona-firewall
```

# Comandos

Durante a instalação deste pacote aparecerá um quadro pedindo para informar
o IP do servidor BOCA, nesta interface o usuário deverá colocar o endereço
IP do BOCA utilizado.

> No caso da Maratona de Programação o IP do BOCA é: 50.116.19.221

Caso o IP não seja informado ou se desejar trocar o IP do servidor boca
basta executar o comando:

```
sudo dpkg-reconfigure maratona-firewall
```

## desabilita-firewall

Caso o administrador da máquina precisa desabilitar o firewall
temporariamente basta executar o comando:

```
sudo desabilita-firewall
```

Com isso o administrador poderá utilizar os comandos de atualização, apt-get,
ou acessar a internet.

Reiniciando a máquina o firewall será habilitado novamente e apenas o endereço
do BOCA será permito acesso.

## habilita-firewall

Este comando irá habilitar o firewall, desde que exista um IP configurado
para o BOCA.
