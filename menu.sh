#!/bin/bash
#SCRIPT INICIAL DEL SERVIDOR
opc=0

function menu(){
    echo "MENÚ PRINCIPAL"
    echo "1 - Gestión de usuarios"
    echo "2 - Gestión de grupos"
    echo "3 - Gestión de redes"
    echo "4 - Gestión de firewall"
    echo "5 - Salir"
    echo -n "Ingrese una opción: "
}

while [ $opc -ne 5 ];
do
    menu
    read opc
    case $opc in
        1)
            echo "Gestión de Usuarios";;
        2)
            echo "Gestión de Grupos";;
        3)
            echo "Gestión de Redes";;
        4)
            echo "Gestión de Firewall";;
        5)
            echo "Hasta pronto!, buena jornada"; break;;
        *)
            echo "Opción no soportada por el sistema";;
    esac
done
