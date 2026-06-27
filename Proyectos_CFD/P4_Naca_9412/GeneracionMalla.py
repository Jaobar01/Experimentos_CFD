#!/usr/bin/env python

###
### This file is generated automatically by SALOME v9.15.0 with dump python functionality
###

import sys
import salome

salome.salome_init()
import salome_notebook
notebook = salome_notebook.NoteBook()

###
### GEOM component
###

import GEOM
from salome.geom import geomBuilder
import math
import SALOMEDS


geompy = geomBuilder.New()

PARAMETRO_ESTUDIO = 12
RUTA_PROYECTO = '/home/jaobar/P4_Naca_9412/Archivos_OpenFOAM/Mesh.unv'

O = geompy.MakeVertex(0, 0, 0)
OX = geompy.MakeVectorDXDYDZ(1, 0, 0)
OY = geompy.MakeVectorDXDYDZ(0, 1, 0)
OZ = geompy.MakeVectorDXDYDZ(0, 0, 1)

P0 = geompy.MakeVertex(2, 0, 0)
P1 = geompy.MakeVertex(2.00152, -0.0048, 0)
P2 = geompy.MakeVertex(1.99102, -0.009730000000000001, 0)
P3 = geompy.MakeVertex(1.9596, -0.02434, 0)
P4 = geompy.MakeVertex(1.90751, -0.04813, 0)
P5 = geompy.MakeVertex(1.83518, -0.08029, 0)
P6 = geompy.MakeVertex(1.74319, -0.11972, 0)
P7 = geompy.MakeVertex(1.63236, -0.16512, 0)
P8 = geompy.MakeVertex(1.50364, -0.21498, 0)
P9 = geompy.MakeVertex(1.35822, -0.26769, 0)
P10 = geompy.MakeVertex(1.19748, -0.3216, 0)
P11 = geompy.MakeVertex(1.02296, -0.375, 0)
P12 = geompy.MakeVertex(0.83644, -0.42627, 0)
P13 = geompy.MakeVertex(0.6398200000000001, -0.47384, 0)
P14 = geompy.MakeVertex(0.43522, -0.51628, 0)
P15 = geompy.MakeVertex(0.22487, -0.55232, 0)
P16 = geompy.MakeVertex(0.01116, -0.58091, 0)
P17 = geompy.MakeVertex(-0.20342, -0.60122, 0)
P18 = geompy.MakeVertex(-0.41692, -0.61266, 0)
P19 = geompy.MakeVertex(-0.63343, -0.6107399999999999, 0)
P20 = geompy.MakeVertex(-0.84272, -0.5929, 0)
P21 = geompy.MakeVertex(-1.04168, -0.56053, 0)
P22 = geompy.MakeVertex(-1.22737, -0.51568, 0)
P23 = geompy.MakeVertex(-1.39719, -0.46088, 0)
P24 = geompy.MakeVertex(-1.5489, -0.39898, 0)
P25 = geompy.MakeVertex(-1.68067, -0.333, 0)
P26 = geompy.MakeVertex(-1.7911, -0.26595, 0)
P27 = geompy.MakeVertex(-1.87919, -0.20067, 0)
P28 = geompy.MakeVertex(-1.9443, -0.13967, 0)
P29 = geompy.MakeVertex(-1.98611, -0.08500000000000001, 0)
P30 = geompy.MakeVertex(-2.0046, -0.03816, 0)
P31 = geompy.MakeVertex(-2, -0, 0)
P32 = geompy.MakeVertex(-1.97349, 0.02779, 0)
P33 = geompy.MakeVertex(-1.92648, 0.04405, 0)
P34 = geompy.MakeVertex(-1.85993, 0.04952, 0)
P35 = geompy.MakeVertex(-1.77499, 0.04528, 0)
P36 = geompy.MakeVertex(-1.673, 0.03271, 0)
P37 = geompy.MakeVertex(-1.5554, 0.01344, 0)
P38 = geompy.MakeVertex(-1.42368, -0.0107, 0)
P39 = geompy.MakeVertex(-1.27933, -0.03777, 0)
P40 = geompy.MakeVertex(-1.12377, -0.06574000000000001, 0)
P41 = geompy.MakeVertex(-0.9583199999999999, -0.0926, 0)
P42 = geompy.MakeVertex(-0.78422, -0.11635, 0)
P43 = geompy.MakeVertex(-0.60264, -0.13514, 0)
P44 = geompy.MakeVertex(-0.41473, -0.14726, 0)
P45 = geompy.MakeVertex(-0.21469, -0.15398, 0)
P46 = geompy.MakeVertex(-0.01116, -0.15798, 0)
P47 = geompy.MakeVertex(0.19324, -0.15873, 0)
P48 = geompy.MakeVertex(0.39643, -0.1559, 0)
P49 = geompy.MakeVertex(0.59624, -0.14942, 0)
P50 = geompy.MakeVertex(0.79051, -0.13944, 0)
P51 = geompy.MakeVertex(0.97704, -0.12638, 0)
P52 = geompy.MakeVertex(1.15366, -0.11086, 0)
P53 = geompy.MakeVertex(1.3183, -0.09363, 0)
P54 = geompy.MakeVertex(1.46894, -0.07556, 0)
P55 = geompy.MakeVertex(1.60371, -0.05755, 0)
P56 = geompy.MakeVertex(1.72091, -0.04051, 0)
P57 = geompy.MakeVertex(1.81901, -0.02528, 0)
P58 = geompy.MakeVertex(1.89672, -0.0126, 0)
P59 = geompy.MakeVertex(1.95299, -0.00308, 0)
P60 = geompy.MakeVertex(1.98707, 0.00281, 0)
P61 = geompy.MakeVertex(1.99848, 0.0048, 0)
P62 = geompy.MakeVertex(2, 0, 0)




NACA9412 = geompy.MakeInterpol([P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, P44, P45, P46, P47, P48, P49, P50, P51, P52, P53, P54, P55, P56, P57, P58, P59, P60, P61, P62], True, False)
NACA9412_Rellena = geompy.MakeFaceWires([NACA9412], 1)



geompy.Rotate(NACA9412_Rellena, OZ, PARAMETRO_ESTUDIO*math.pi/180.0)
Domain = geompy.MakeFaceHW(20, 10, 1)
Base = geompy.MakeCutList(Domain, [NACA9412_Rellena], True)
inlet = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(inlet, [3])
outlet = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(outlet, [10])
curve = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(curve, [12])
walls = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(walls, [6, 8])
frontAndBack = geompy.CreateGroup(Base, geompy.ShapeType["FACE"])
geompy.UnionIDs(frontAndBack, [1])
[inlet, outlet, curve, walls, frontAndBack] = geompy.GetExistingSubObjects(Base, False)
[inlet, outlet, curve, walls, frontAndBack] = geompy.GetExistingSubObjects(Base, False)
[inlet, outlet, curve, walls, frontAndBack] = geompy.GetExistingSubObjects(Base, False)


geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )

geompy.addToStudy( O, 'O' )
geompy.addToStudy( OX, 'OX' )
geompy.addToStudy( OY, 'OY' )
geompy.addToStudy( OZ, 'OZ' )
geompy.addToStudy( P0, "P0" )
geompy.addToStudy( P1, "P1" )
geompy.addToStudy( P2, "P2" )
geompy.addToStudy( P3, "P3" )
geompy.addToStudy( P4, "P4" )
geompy.addToStudy( P5, "P5" )
geompy.addToStudy( P6, "P6" )
geompy.addToStudy( P7, "P7" )
geompy.addToStudy( P8, "P8" )
geompy.addToStudy( P9, "P9" )
geompy.addToStudy( P10, "P10" )
geompy.addToStudy( P11, "P11" )
geompy.addToStudy( P12, "P12" )
geompy.addToStudy( P13, "P13" )
geompy.addToStudy( P14, "P14" )
geompy.addToStudy( P15, "P15" )
geompy.addToStudy( P16, "P16" )
geompy.addToStudy( P17, "P17" )
geompy.addToStudy( P18, "P18" )
geompy.addToStudy( P19, "P19" )
geompy.addToStudy( P20, "P20" )
geompy.addToStudy( P21, "P21" )
geompy.addToStudy( P22, "P22" )
geompy.addToStudy( P23, "P23" )
geompy.addToStudy( P24, "P24" )
geompy.addToStudy( P25, "P25" )
geompy.addToStudy( P26, "P26" )
geompy.addToStudy( P27, "P27" )
geompy.addToStudy( P28, "P28" )
geompy.addToStudy( P29, "P29" )
geompy.addToStudy( P30, "P30" )
geompy.addToStudy( P31, "P31" )
geompy.addToStudy( P32, "P32" )
geompy.addToStudy( P33, "P33" )
geompy.addToStudy( P34, "P34" )
geompy.addToStudy( P35, "P35" )
geompy.addToStudy( P36, "P36" )
geompy.addToStudy( P37, "P37" )
geompy.addToStudy( P38, "P38" )
geompy.addToStudy( P39, "P39" )
geompy.addToStudy( P40, "P40" )
geompy.addToStudy( P41, "P41" )
geompy.addToStudy( P42, "P42" )
geompy.addToStudy( P43, "P43" )
geompy.addToStudy( P44, "P44" )
geompy.addToStudy( P45, "P45" )
geompy.addToStudy( P46, "P46" )
geompy.addToStudy( P47, "P47" )
geompy.addToStudy( P48, "P48" )
geompy.addToStudy( P49, "P49" )
geompy.addToStudy( P50, "P50" )
geompy.addToStudy( P51, "P51" )
geompy.addToStudy( P52, "P52" )
geompy.addToStudy( P53, "P53" )
geompy.addToStudy( P54, "P54" )
geompy.addToStudy( P55, "P55" )
geompy.addToStudy( P56, "P56" )
geompy.addToStudy( P57, "P57" )
geompy.addToStudy( P58, "P58" )
geompy.addToStudy( P59, "P59" )
geompy.addToStudy( P60, "P60" )
geompy.addToStudy( P61, "P61" )
geompy.addToStudy( P62, "P62" )
geompy.addToStudy( NACA9412, 'NACA9412' )
geompy.addToStudy( NACA9412_Rellena, 'NACA9412_Rellena' )

geompy.addToStudy( Domain, 'Domain' )
geompy.addToStudy( Base, 'Base' )
geompy.addToStudyInFather( Base, inlet, 'inlet' )
geompy.addToStudyInFather( Base, outlet, 'outlet' )
geompy.addToStudyInFather( Base, curve, 'curve' )
geompy.addToStudyInFather( Base, walls, 'walls' )
geompy.addToStudyInFather( Base, frontAndBack, 'frontAndBack' )

###
### SMESH component
###

import  SMESH, SALOMEDS
from salome.smesh import smeshBuilder

smesh = smeshBuilder.New()
#smesh.SetEnablePublish( False ) # Set to False to avoid publish in study if not needed or in some particular situations:
                                 # multiples meshes built in parallel, complex and numerous mesh edition (performance)

try:
  pass
except:
  print('ExportUNV() failed. Invalid file name?')

Mesh_1 = smesh.Mesh(Base,'Mesh_1')
NETGEN_1D_2D = Mesh_1.Triangle(algo=smeshBuilder.NETGEN_1D2D)
NETGEN_2D_Parameters_1 = NETGEN_1D_2D.Parameters()
NETGEN_2D_Parameters_1.SetMaxSize( 0.1 )
NETGEN_2D_Parameters_1.SetMinSize( 0.0919118 )
NETGEN_2D_Parameters_1.SetSecondOrder( 0 )
NETGEN_2D_Parameters_1.SetOptimize( 1 )
NETGEN_2D_Parameters_1.SetFineness( 2 )
NETGEN_2D_Parameters_1.SetChordalError( -1 )
NETGEN_2D_Parameters_1.SetChordalErrorEnabled( 0 )
NETGEN_2D_Parameters_1.SetUseSurfaceCurvature( 1 )
NETGEN_2D_Parameters_1.SetFuseEdges( 1 )
NETGEN_2D_Parameters_1.SetUseDelauney( 0 )
NETGEN_2D_Parameters_1.SetQuadAllowed( 0 )
NETGEN_2D_Parameters_1.SetWorstElemMeasure( 78 )
NETGEN_2D_Parameters_1.SetCheckChartBoundary( 112 )
inlet_1 = Mesh_1.GroupOnGeom(inlet,'inlet',SMESH.EDGE)
outlet_1 = Mesh_1.GroupOnGeom(outlet,'outlet',SMESH.EDGE)
curve_1 = Mesh_1.GroupOnGeom(curve,'curve',SMESH.EDGE)
walls_1 = Mesh_1.GroupOnGeom(walls,'walls',SMESH.EDGE)
frontAndBack_1 = Mesh_1.GroupOnGeom(frontAndBack,'frontAndBack',SMESH.FACE)
Regular_1D = Mesh_1.Segment(geom=curve)
Local_Length_1 = Regular_1D.LocalLength(0.01,None,1e-07)
isDone = Mesh_1.Compute()
Mesh_1.CheckCompute()
[ inlet_1, outlet_1, curve_1, walls_1, frontAndBack_1 ] = Mesh_1.GetGroups()
[ inlet_extruded, outlet_extruded, curve_extruded, walls_extruded, frontAndBack_extruded, inlet_top, outlet_top, curve_top, walls_top, frontAndBack_top ] = Mesh_1.ExtrusionByNormal( [ Mesh_1 ], 0.25, 1, 0, 1, 1, 2 )
Sub_mesh_1 = Regular_1D.GetSubMesh()

Mesh_1.RemoveGroup( inlet_1 )
Mesh_1.RemoveGroup( outlet_1 )
Mesh_1.RemoveGroup( walls_1 )
Mesh_1.RemoveGroup( curve_1 )
Mesh_1.RemoveGroup( frontAndBack_extruded )
Mesh_1.RemoveGroup( inlet_top )
Mesh_1.RemoveGroup( outlet_top )
Mesh_1.RemoveGroup( walls_top )
Mesh_1.RemoveGroup( curve_top )

try:
  Mesh_1.ExportUNV(RUTA_PROYECTO)
  pass
except:
  print('ExportUNV() failed. Invalid file name?')


## Set names of Mesh objects
smesh.SetName(outlet_1, 'outlet')
smesh.SetName(curve_extruded, 'curve_extruded')
smesh.SetName(walls_1, 'walls')
smesh.SetName(inlet_top, 'inlet_top')
smesh.SetName(walls_extruded, 'walls_extruded')
smesh.SetName(NETGEN_2D_Parameters_1, 'NETGEN 2D Parameters_1')
smesh.SetName(walls_top, 'walls_top')
smesh.SetName(frontAndBack_1, 'frontAndBack')
smesh.SetName(outlet_extruded, 'outlet_extruded')
smesh.SetName(outlet_top, 'outlet_top')
smesh.SetName(inlet_1, 'inlet')
smesh.SetName(curve_top, 'curve_top')
smesh.SetName(inlet_extruded, 'inlet_extruded')
smesh.SetName(curve_1, 'curve')
smesh.SetName(frontAndBack_top, 'frontAndBack_top')
smesh.SetName(frontAndBack_extruded, 'frontAndBack_extruded')
smesh.SetName(NETGEN_1D_2D.GetAlgorithm(), 'NETGEN 1D-2D')
smesh.SetName(Mesh_1.GetMesh(), 'Mesh_1')


if salome.sg.hasDesktop():
  salome.sg.updateObjBrowser()
