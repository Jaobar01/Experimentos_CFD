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
RUTA_PROYECTO = '/home/jaobar/P3_Ellipse_12_03_Alargada_Giro/Archivos_OpenFOAM/Mesh.unv'

O = geompy.MakeVertex(0, 0, 0)
OX = geompy.MakeVectorDXDYDZ(1, 0, 0)
OY = geompy.MakeVectorDXDYDZ(0, 1, 0)
OZ = geompy.MakeVectorDXDYDZ(0, 0, 1)
P_Ellipse1 = geompy.MakeVertex(0.8, 0, 0)
P_Ellipse2 = geompy.MakeVertex(-0.8, 0, 0)

Ellipse1 = geompy.MakeEllipse(P_Ellipse1, OZ, 1.2, 0.3, OX)
EllipseRellena1 = geompy.MakeFaceWires([Ellipse1], 1)

Ellipse2 = geompy.MakeEllipse(P_Ellipse2, OZ, 1.2, 0.3, OX)
EllipseRellena2 = geompy.MakeFaceWires([Ellipse2], 1)

Union = geompy.MakeFaceHW(1.6, 0.6, 1)
EllipseAlargada = geompy.MakeFuseList([EllipseRellena1, EllipseRellena2, Union], True, True)

geompy.Rotate(EllipseAlargada, OZ, -PARAMETRO_ESTUDIO*math.pi/180.0)
Domain = geompy.MakeFaceHW(20, 10, 1)
Base = geompy.MakeCutList(Domain, [EllipseAlargada], True)
inlet = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(inlet, [3])
outlet = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(outlet, [10])
curve = geompy.CreateGroup(Base, geompy.ShapeType["EDGE"])
geompy.UnionIDs(curve, [19, 21, 12, 15, 17])
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
geompy.addToStudy( P_Ellipse1, 'P_Ellipse1' )
geompy.addToStudy( P_Ellipse2, 'P_Ellipse2' )
geompy.addToStudy( Ellipse1, 'Ellipse1' )
geompy.addToStudy( EllipseRellena1, 'EllipseRellena1' )
geompy.addToStudy( Ellipse2, 'Ellipse2' )
geompy.addToStudy( EllipseRellena2, 'EllipseRellena2' )
geompy.addToStudy( Union, 'Union' )
geompy.addToStudy( EllipseAlargada, 'EllipseAlargada' )

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
