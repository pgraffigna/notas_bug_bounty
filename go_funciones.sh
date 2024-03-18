#!/bin/bash
# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# variables
GO_TARGZ="go1.22.1.linux-amd64.tar.gz"

function go_install(){
  echo -e "${AMARILLO}Descargando binarios ${FIN}"
  curl -s -L https://golang.org/dl/$GO_TARGZ --output /tmp/$GO_TARGZ

  echo -e "${AMARILLO}Descomprimiendo binario ${FIN}"
  sudo tar -xzf "/tmp/${GO_TARGZ}" -C /usr/local/

  echo -e "${AMARILLO}Configurando PATH ${FIN}"
  echo -e "PATH=/usr/local/go/bin:$HOME/go/bin:$PATH" >> ~/.profile 
  
function go_httprobe(){
  # https://github.com/tomnomnom/httprobe
  go install github.com/tomnomnom/httprobe@latest
  exit 0
}

function go_subfinder(){
  # https://github.com/projectdiscovery/subfinder
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  exit 0
}

function go_httpx(){
  # https://github.com/projectdiscovery/httpx
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  exit 0
}

function go_amass(){
  # https://github.com/owasp-amass/amass
  go install -v github.com/owasp-amass/amass/v4/...@master
  exit 0
}

function go_subzy(){
  # https://github.com/PentestPad/subzy
  go install -v github.com/LukaSikic/subzy@latest
  exit 0
}

function go_nuclei(){
  # https://github.com/projectdiscovery/nuclei
  go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
  exit 0
}

function go_katana(){
  # https://github.com/projectdiscovery/katana
  go install github.com/projectdiscovery/katana/cmd/katana@latest
  exit 0
}

function go_ffuf(){
  # https://github.com/ffuf/ffuf
  go install github.com/ffuf/ffuf/v2@latest
  exit 0
}

function go_jsfinder(){
  # https://github.com/kacakb/jsfinder
  go install -v github.com/kacakb/jsfinder@latest
  exit 0
}

function salir(){
  echo "Saliendo!!"
  exit 0
}