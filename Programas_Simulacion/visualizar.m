function visualizar()
    
    config = configuracion();
    config = simTools.actualizacion_config(config);
    
    visualizar = config.ruta_Carpeta_Programas+'/Bash/visualizar.sh';
    comando_wsl = sprintf('wsl %s', visualizar);
    system(comando_wsl);
end