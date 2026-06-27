function boundaryCorrecion(proyecto)
    
    config = configuracion();
    config = simTools.actualizacion_config(config);

    if config.windows
        rutaBoundary = simTools.unix_to_matlab_win_wsl(config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/Archivos_OpenFOAM/constant/polyMesh/boundary");
    else
        rutaBoundary = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/Archivos_OpenFOAM/constant/polyMesh/boundary";
    end 

    
    texto = fileread(rutaBoundary);
    [matches, ~, starts, ends] = regexp(texto, 'patch', 'match','tokens', 'start', 'end', 'lineanchors', 'dotexceptnewline');
    
    textoModificado = texto;
    
    frontAndBack = strrep(matches{1}, 'patch', 'empty');
    walls = strrep(matches{4}, 'patch', 'wall');
    curve = strrep(matches{5}, 'patch', 'wall');
    frontAndBack_top = strrep(matches{6}, 'patch', 'empty');
    textoModificado = [
        textoModificado(1 : starts(1)-1), ...               % Texto desde el inicio hasta justo antes de la 4ª línea
        frontAndBack, ...                                   % Inserta la nueva línea (4ª)
        textoModificado(ends(1)+1 : starts(4)-1),...        % Texto desde justo después de la 4ª línea hasta el final
        walls,...
        textoModificado(ends(4)+1 : starts(5)-1),...
        curve,...
        textoModificado(ends(5)+1 : starts(6)-1),...
        frontAndBack_top,...
        textoModificado(ends(6)+1 : end)
    ];
    
    
    if strcmp(texto, textoModificado) 
        disp('Fallo corrección boundary');
    else
        doc = fopen(rutaBoundary, 'w');
        fprintf(doc, '%s', textoModificado);
        fclose(doc);
        disp('Correción Boundary');
    end

end