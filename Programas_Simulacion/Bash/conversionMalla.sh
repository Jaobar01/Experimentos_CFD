#!/bin/bash

LOG_FILE="/mnt/c/Users/Javi/Desktop/PRUEBAS_PROGRAMA/Experimentos_CFD/Proyectos_CFD/P5_Naca_9412_Doble/Archivos_OpenFOAM/data/malla_conversion.txt"


#CONVERSION MALLA
. /opt/openfoam13/etc/bashrc

cd /home/jaobar/P5_Naca_9412_Doble/Archivos_OpenFOAM

echo
echo "-CONVIERTIENDO MALLA PARA OPENFOAM..."
#ideasUnvToFoam Mesh.unv # Para analizar errores
(ideasUnvToFoam Mesh.unv) > $LOG_FILE 2>&1
echo

