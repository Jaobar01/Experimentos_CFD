classdef configuracion

    properties
        
        % Eleccion de sistema operativo (Linux o windows)
        windows = true; 
        
        % Ruta en el formato de su sistema operativo
        ruta_Carpeta_Programas = "Ruta_Windows_o_Linux_carpeta_Programas_Simulacion" ;
        ruta_Carpeta_Proyectos = "Ruta_Windows_o_Linux_carpeta_Proyectos_CFD" ;
        
        % Rutas en el formato Linux (o wsl en su defecto) 
        % Ejemplo: ruta = "/opt/openfoam13"
        ruta_OpenFOAM = "ruta_OpenFOAM" ;
        ruta_SALOME = "ruta_SALOME" ;
        


        % SOLO USUARIOS WINDOWS. Carpeta donde se ejecuta la simulacion en
        % wsl. Por defecto se ejecuta en la carpeta del usuario. Cambie por su nombre de usuario de WSL 
        ruta_Carpeta_Proyectos_wsl = "/home/usuario";
      
    end

end

