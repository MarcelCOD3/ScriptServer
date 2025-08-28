#!/bin/bash
opc=10

function menu_firewall(){
    clear
    echo "MENÚ DE GESTIÓN DE FIREWALL"
    echo "1 - Ver estado del firewall"
    echo "2 - Activar firewall"
    echo "3 - Desactivar firewall"
    echo "4 - Permitir un servicio"
    echo "5 - Denegar un servicio"
    echo "6 - Abrir un puerto TCP/UDP"
    echo "7 - Cerrar un puerto TCP/UDP"
    echo "8 - Reiniciar firewall a configuración por defecto"
    echo "0 - Volver al menú principal"
    echo -n "Ingrese una opción: "
}

function ver_estado(){
    sudo firewall-cmd --state
    sudo firewall-cmd --list-all
    read -p "Presione Enter para continuar..."
}

function activar_firewall(){
    sudo systemctl start firewalld
    sudo systemctl enable firewalld
    echo "Firewall activado"
    read -p "Presione Enter para continuar..."
}

function desactivar_firewall(){
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
    echo "Firewall desactivado"
    read -p "Presione Enter para continuar..."
}

function permitir_servicio(){
    read -p "Ingrese el nombre del servicio (ej: http, https, ssh): " servicio
    sudo firewall-cmd --permanent --add-service=$servicio
    sudo firewall-cmd --reload
    echo "Servicio $servicio permitido"
    read -p "Presione Enter para continuar..."
}

function denegar_servicio(){
    read -p "Ingrese el nombre del servicio (ej: http, https, ssh): " servicio
    sudo firewall-cmd --permanent --remove-service=$servicio
    sudo firewall-cmd --reload
    echo "Servicio $servicio denegado"
    read -p "Presione Enter para continuar..."
}

function abrir_puerto(){
    read -p "Ingrese el puerto y protocolo (ej: 8080/tcp): " puerto
    sudo firewall-cmd --permanent --add-port=$puerto
    sudo firewall-cmd --reload
    echo "Puerto $puerto abierto"
    read -p "Presione Enter para continuar..."
}

function cerrar_puerto(){
    read -p "Ingrese el puerto y protocolo (ej: 8080/tcp): " puerto
    sudo firewall-cmd --permanent --remove-port=$puerto
    sudo firewall-cmd --reload
    echo "Puerto $puerto cerrado"
    read -p "Presione Enter para continuar..."
}

function reiniciar_firewall(){
    sudo firewall-cmd --complete-reload
    echo "Firewall reiniciado con configuración por defecto"
    read -p "Presione Enter para continuar..."
}

# Bucle principal del menú de firewall
while [ $opc -ne 0 ]; do
    menu_firewall
    read opc
    case $opc in
        1) ver_estado ;;
        2) activar_firewall ;;
        3) desactivar_firewall ;;
        4) permitir_servicio ;;
        5) denegar_servicio ;;
        6) abrir_puerto ;;
        7) cerrar_puerto ;;
        8) reiniciar_firewall ;;
        0) echo "Volviendo al menú principal"; break ;;
        *) echo "Opción no válida"; read -p "Presione Enter para continuar..." ;;
    esac
done
