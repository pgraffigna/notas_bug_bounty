#!/bin/bash
source go_funciones.sh # llamada a funciones externas

# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

#Ctrl-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${ROJO}Programa Terminado por el usuario ${FIN}"
        exit 0
}

# Menú principal
while true; do
  clear
  echo "[+] Go-Tools"
  echo "-------------------------------------"
  echo "1.Instalar GO"
  echo "2.Instalar HTTPROBE "
  echo "3.Instalar SUBFINDER"
  echo "4.Instalar HTTPX"
  echo "5.Instalar AMASS"
  echo "6.Instalar SUBZY"
  echo "7.Instalar NUCLEI"
  echo "8.Instalar KATANA"
  echo "9.Instalar FFUF"
  echo "10.Instalar JSFINDER"
  echo "11.Salir"
  echo "-------------------------------------"

  # Input Usuario
  echo -n "Seleccione una opción (1-11): "
  read OPCION

  # Validación
  case $OPCION in
    1) go_install ;;
    2) go_httprobe ;;
    3) go_subfinder ;;
    4) go_httpx ;;
    5) go_amass ;;
    6) go_subzy ;;
    7) go_nuclei ;;
    8) go_katana ;;
    9) go_ffuf ;;
    10) go_jsfinder ;;
    11) salir ;;
    *) echo "Opción incorrecta. Intenta de nuevo."; sleep 2 ;;
  esac
done
