#!/bin/bash

LOG_FILE2="DIRECTORIO_1"

. DIRECTORIO_2

cd DIRECTORIO_3

#Reemplazamos la carpeta 0 por la correcta
rm -rf 0
cp -r Cero_Org 0

echo
echo "-EJECUTANDO LA SIMULACIÓN DE OPENFOAM..."
#foamRun # Para analizar errores
(foamRun) > $LOG_FILE2 2>&1
echo

# Guardamos las condiciones iniciales por si utilizamos la tecnica en cadena
cd ..
rm -rf ArchivosMapFields
cp -r ArchivosMapFields_vacio ArchivosMapFields
cp -r Archivos_OpenFOAM/constant/polyMesh ArchivosMapFields/constant/
cp Archivos_OpenFOAM/system/controlDict ArchivosMapFields/system

cd Archivos_OpenFOAM
ls -d [0-9]* | sort -n | tail -n 1 | xargs -I {} cp -r {} ../ArchivosMapFields
rm -rf 0
cp -r Cero_Org 0