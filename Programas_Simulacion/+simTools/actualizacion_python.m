function actualizacion_python(parametres, proyecto)
    
    config = configuracion();
    config = simTools.actualizacion_config(config);

    if config.windows
        documento = simTools.unix_to_matlab_win_wsl(config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/GeneracionMalla.py");
    else
        documento = config.ruta_Carpeta_Proyectos + "/" + proyecto + "/GeneracionMalla.py";
    end
    
    % 3. Definir el Patrón (Expresión Regular)
    % Explicación del patrón '^\s*modelo\s*=.*'
    % ^       -> Busca el inicio de una línea
    % \s* -> Admite cualquier cantidad de espacios en blanco al principio (identación)
    % modelo  -> La palabra clave que buscas
    % .* -> "Comodín": Coincide con cualquier carácter hasta el final de esa línea
        
    
    busqueda = {'PARAMETRO_ESTUDIO','RUTA_PROYECTO'}; 
    reemplazo = {['PARAMETRO_ESTUDIO = ', num2str(parametres)],"RUTA_PROYECTO = "+ "'"+config.ruta_Carpeta_Proyectos_wsl+"/"+proyecto+"/Archivos_OpenFOAM/Mesh.unv'"};
    
    
    texto = fileread(documento);
    patron = ['^(\s*)', busqueda{1}, '.*'];
    replaceText = ['$1', reemplazo{1}];
    textoModificado1 = regexprep(texto, patron, replaceText, 'lineanchors', 'dotexceptnewline');

    patron = ['^(\s*)', busqueda{2}, '[^\r\n]*'];
    replaceText = ['$1', char(reemplazo{2})];
    textoModificado2 = regexprep(textoModificado1, patron, replaceText, 'lineanchors', 'dotexceptnewline');
   
    
    if strcmp(texto, textoModificado2)
            disp('Malla sin cambios');
        else
            doc = fopen(documento, 'w');
            fprintf(doc, '%s', textoModificado2);
            fclose(doc);
            disp('Malla Actualizada');
    end
    
    

end