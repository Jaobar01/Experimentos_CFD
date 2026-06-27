#!/bin/bash

cd DIRECTORIO_1

# Borramos la anterior simulacion para que no haya conflictos
./Allclean

cd DIRECTORIO_2
# --- FASE 1: GENERACIÓN DE MALLA EN SALOME
bash ./generacionMalla.sh


# --- FASE 2: CONVERSIÓN EN OPENFOAM
bash ./conversionMalla.sh