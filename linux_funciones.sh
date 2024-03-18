#!/bin/bash
# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

function python_install(){
  echo -e "${AMARILLO}Instalando dependencias ${FIN}"
  sudo apt update && sudo apt install -y python3-venv python3-pip
}

function linux_massdns(){
  # https://github.com/blechschmidt/massdns.git
  echo -e "${AMARILLO}Instalando massdns ${FIN}"
  sudo apt update && sudo apt install -y make gcc
  git clone https://github.com/blechschmidt/massdns.git ~/massdns
  cd ~/massdns && make
}

function linux_sublist3r(){
  # https://github.com/aboul3la/Sublist3r
  echo -e "${AMARILLO}Instalando sublist3r ${FIN}"
  git clone https://github.com/aboul3la/Sublist3r.git ~/sublist3r
  cd ~/sublist3r && pip install -r requirements.txt
}

function linux_linkfinder(){
  # https://github.com/GerbenJavado/LinkFinder
  echo -e "${AMARILLO}Instalando linkfinder ${FIN}"
  git clone https://github.com/GerbenJavado/LinkFinder.git ~/linkfinder
  cd ~/linkfinder && pip3 install -r requirements.txt
}

function linux_secretfinder(){
  # https://github.com/m4ll0k/SecretFinder
  echo -e "${AMARILLO}Instalando secretfinder ${FIN}"
  git clone https://github.com/m4ll0k/SecretFinder.git ~/secretfinder
  cd ~/secretfinder && pip install -r requirements.txt
}

function linux_slurp(){
  # https://github.com/0xbharath/slurp + permutations.json
  echo -e "${AMARILLO}Instalando slurp ${FIN}"
  mkdir ~/slurp && wget -q https://github.com/0xbharath/slurp/releases/download/1.1.0/slurp-1.1.0-linux-amd64 -O ~/slurp/slurp-1.1.0-linux-amd64
  wget -q https://raw.githubusercontent.com/0xbharath/slurp/master/permutations.json -O ~/slurp/permutations.json
  chmod +x ~/slurp/slurp-1.1.0-linux-amd64
}

function linux_knock(){
  # https://github.com/guelfoweb/knock
  echo -e "${AMARILLO}Instalando knockpy ${FIN}"
  git clone https://github.com/guelfoweb/knock.git ~/knockpy
  cd ~/knocky && pip install -r requirements.txt
}

function salir(){
  echo "Saliendo!!"
  exit 0
}