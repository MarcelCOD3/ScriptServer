#!/bin/bash
opc=10

function menu_redes(){
    clear
    echo "MENÚ DE GESTIÓN DE REDES"
    echo "1 - Ver interfaces de red"
    echo "2 - Ver configuración IP"
    echo "3 - Configurar IP temporal"
    echo "4 - Ver tabla de rutas"
    echo "5 - Hacer ping a un host"
    echo "0 - Volver al menú principal"
    echo -n "Ingrese una opción: "
}

function ver_interfaces(){
    echo "Interfaces de red disponibles:"
    ip link show
    read -p "Presione Enter para continuar..."
}

function ver_ip(){
    echo "Configuración IP actual:"
    ip addr show
    read -p "Presione Enter para continuar..."
}

function configurar_ip(){
    read -p "Ingrese el nombre de la interfaz (ej: eth0, enp0s3): " iface
    read -p "Ingrese la IP temporal (ej: 192.168.1.100/24): " ipaddr
    sudo ip addr add $ipaddr dev $iface
    echo "IP $ipaddr asignada temporalmente a $iface"
    read -p "Presione Enter para continuar..."
}

function ver_rutas(){
    echo "Tabla de rutas actual:"
    ip route show
    read -p "Presione Enter para continuar..."
}

function hacer_ping(){
    read -p "Ingrese el host o IP a hacer ping: " host
    ping -c 4 $host
    read -p "Presione Enter para continuar..."
}

# Bucle principal del menú de redes
while [ $opc -ne 0 ]; do
    menu_redes
    read opc
    case $opc in
        1) ver_interfaces ;;
        2) ver_ip ;;
        3) configurar_ip ;;
        4) ver_rutas ;;
        5) hacer_ping ;;
        0) echo "Volviendo al menú principal"; break ;;
        *) echo "Opción no válida"; read -p "Presione Enter para continuar..." ;;
    esac
done
