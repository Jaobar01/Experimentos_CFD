function config = actualizacion_config(config) 

    if ~config.windows
        % Si el entorno es linux ejecutamos directamente en la carpeta
        config.ruta_Carpeta_Proyectos_wsl = config.ruta_Carpeta_Proyectos;
    else
        config.ruta_Carpeta_Proyectos = simTools.win_to_unix_Path(config.ruta_Carpeta_Proyectos);
        config.ruta_Carpeta_Programas = simTools.win_to_unix_Path(config.ruta_Carpeta_Programas);
    end
    
end