#!/bin/bash

cd /home/jaobar/P5_Naca_9412_Doble/Archivos_OpenFOAM

# Borramos la anterior simulacion para que no haya conflictos
./Allclean

cd /mnt/c/Users/Javi/Desktop/PRUEBAS_PROGRAMA/Experimentos_CFD/Programas_Simulacion/Bash
# --- FASE 1: GENERACIÓN DE MALLA EN SALOME
bash ./generacionMalla.sh


# --- FASE 2: CONVERSIÓN EN OPENFOAM
bash ./conversionMalla.sh