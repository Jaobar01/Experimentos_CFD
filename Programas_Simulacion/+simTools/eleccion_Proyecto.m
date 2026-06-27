function eleccion_Proyecto(proyecto)
    

    config = configuracion();
    config = simTools.actualizacion_config(config);


    fprintf('Eligiendo el proyecto \n');
    
    if config.windows
        cadena = "cp -r " + config.ruta_Carpeta_Proyectos + "/" + proyecto + " " + config.ruta_Carpeta_Proyectos_wsl; 
        comando_wsl = sprintf('wsl %s', cadena);
        system(comando_wsl);
    end

    cadena = "cp -rT " + config.ruta_Carpeta_Programas + "/Bash_Plantilla " + config.ruta_Carpeta_Programas + "/Bash"; 
    comando = sprintf('wsl %s', cadena);
    system(comando);

    
    % REALIZAMOS EL CAMBIO EN TODOS LOS ARCHIVOS .SH
    
    runOrdersShort1 = 'Bash\runOrdersShort1.sh';
    runOrdersShort2 = 'Bash\runOrdersShort2.sh';
    runOrdersShort2B = 'Bash\runOrdersShort2B.sh';
    generacionMalla = 'Bash\generacionMalla.sh';
    conversionMalla = 'Bash\conversionMalla.sh';
    visualizar = 'Bash\visualizar.sh';
    

    % Archivo runOrdersShort1
    texto = fileread(runOrdersShort1);
    
    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "Archivos_OpenFOAM";
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_Carpeta_Programas + "/Bash";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    doc = fopen(runOrdersShort1, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);
    

    % Archivo runOrdersShort2
    texto = fileread(runOrdersShort2);
    
    ruta = config.ruta_Carpeta_Proyectos + "/" + proyecto + "/" + "Archivos_OpenFOAM/data/data_simulacion.txt";
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_OpenFOAM + "/etc/bashrc";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "Archivos_OpenFOAM";
    texto = regexprep(texto, "DIRECTORIO_3", ruta);

    doc = fopen(runOrdersShort2, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);


    % Archivo runOrdersShort2B
    texto = fileread(runOrdersShort2);
    
    ruta = config.ruta_Carpeta_Proyectos + "/" + proyecto + "/" + "Archivos_OpenFOAM/data/data_simulacion.txt";
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_OpenFOAM + "/etc/bashrc";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "Archivos_OpenFOAM";
    texto = regexprep(texto, "DIRECTORIO_3", ruta);

    ruta = config.ruta_Carpeta_Proyectos + "/" + proyecto + "/" + "Archivos_OpenFOAM/data/data_interpolacion.txt";
    texto = regexprep(texto, "DIRECTORIO_4", ruta);

    doc = fopen(runOrdersShort2B, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);


    % Archivo conversionMalla
    texto = fileread(conversionMalla);
    
    ruta = config.ruta_Carpeta_Proyectos + "/" + proyecto + "/" + "Archivos_OpenFOAM/data/malla_conversion.txt";
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_OpenFOAM + "/etc/bashrc";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "Archivos_OpenFOAM";
    texto = regexprep(texto, "DIRECTORIO_3", ruta);

    doc = fopen(conversionMalla, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);


    % Archivo generacionMalla
    texto = fileread(generacionMalla);
    
    ruta = config.ruta_SALOME;
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "GeneracionMalla.py";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    doc = fopen(generacionMalla, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);


    % Archivo visualizar
    texto = fileread(visualizar);
    
    ruta = config.ruta_OpenFOAM + "/etc/bashrc";
    texto = regexprep(texto, "DIRECTORIO_1", ruta);

    ruta = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/" + "Archivos_OpenFOAM";
    texto = regexprep(texto, "DIRECTORIO_2", ruta);

    doc = fopen(visualizar, 'w');
    fprintf(doc, '%s', texto);
    fclose(doc);
    

    
        
end