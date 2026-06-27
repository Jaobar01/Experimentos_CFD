#!/bin/bash

LOG_FILE="DIRECTORIO_1"


#CONVERSION MALLA
. DIRECTORIO_2

cd DIRECTORIO_3

echo
echo "-CONVIERTIENDO MALLA PARA OPENFOAM..."
#ideasUnvToFoam Mesh.unv # Para analizar errores
(ideasUnvToFoam Mesh.unv) > $LOG_FILE 2>&1
echo

