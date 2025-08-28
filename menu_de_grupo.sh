#!/bin/bash
#VARIABLES**************
opc=10
year=$(date +%Y-%m-%d)
#***********************

#FUNCIONES******************************************************************************************************
function menu(){
	clear
	echo "MENÚ DE GESTIÓN DE GRUPOS"
	echo "1 - Agregar grupo"
	echo "2 - Borrar grupo"
	echo "3 - Listar grupos del sistema"
	echo "4 - Buscar un grupo en el sistema"
	echo "0 - Salir"
}

function listar_grupos(){
	clear
    echo "GRUPOS DEL SISTEMA"
    cut -d ":" -f 1 /etc/group | sort | more
    read -p "Presione Enter para volver al menú principal..."
}

function agregar_grupo(){
	clear
    read -p "Ingrese el nombre del nuevo grupo: " grupo
    if getent group "$grupo" >/dev/null; then
        echo "El grupo '$grupo' ya existe."
    else
        sudo groupadd "$grupo"
        echo "Grupo '$grupo' agregado correctamente."
    fi
    read -p "Presione Enter para continuar..."
}

function borrar_grupo(){
	clear
    read -p "Ingrese el nombre del grupo a borrar: " grupo
    if getent group "$grupo" >/dev/null; then
        sudo groupdel "$grupo"
        echo "Grupo '$grupo' eliminado correctamente."
    else
        echo "El grupo '$grupo' no existe."
    fi
    read -p "Presione Enter para continuar..."
}

function buscar_grupo(){
	clear
    read -p "Ingrese el nombre del grupo a buscar: " grupo
    if getent group "$grupo" >/dev/null; then
        echo "El grupo '$grupo' existe en el sistema."
    else
        echo "El grupo '$grupo' no se encontró."
    fi
    read -p "Presione Enter para continuar..."
}
#***************************************************************************************************************

#MAIN***********************************************************************************************************
while [ $opc -ne 0 ]
do
	clear
	menu
	read -p "Ingrese la opción correspondiente: " opc
	case $opc in
	1)
		agregar_grupo;;
	2)
		borrar_grupo;;
	3)
		listar_grupos;;
	4)
		buscar_grupo;;
	0)
		echo "Saliendo del programa..."; break ;; 
	*)
		echo "Seleccionó una opción incorrecta"
		read -p "Presione Enter para continuar...";;
	esac
done
#***************************************************************************************************************
