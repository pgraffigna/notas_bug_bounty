#!/bin/bash
source linux_funciones.sh # llamada a funciones externas

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
  echo "[+] Linux-Tools"
  echo "-------------------------------------"
  echo "1.Instalar PYTHON"
  echo "2.Instalar MASSDNS "
  echo "3.Instalar SUBLIST3R"
  echo "4.Instalar LINKFINDER"
  echo "5.Instalar SECRETFINDER"
  echo "6.Instalar SLURP"
  echo "7.Instalar KNOCKPY"
  echo "8.Salir"
  echo "-------------------------------------"

  # Input Usuario
  echo -n "Seleccione una opción (1-8): "
  read OPCION

  # Validación
  case $OPCION in
    1) python_install ;;
    2) linux_massdns ;;
    3) linux_sublist3r ;;
    4) linux_linkfinder ;;
    5) linux_secretfinder ;;
    6) linux_slurp ;;
    7) linux_knock ;;
    8) salir ;;   
    *) echo "Opción incorrecta. Intenta de nuevo."; sleep 2 ;;
  esac
done
