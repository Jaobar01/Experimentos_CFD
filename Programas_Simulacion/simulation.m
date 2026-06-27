% La salida array solo puede generar datos, no graficas ni optimizaciones
% salida: 'array','moment', 'drag', 'lift', 'liftDdrag', 'downforceDdrag'
% grafica: true, false
% funcion_salida: 'coef', 'penalizacion_oscilaciones_up', 'penalizacion_oscilaciones_down'

function coef = simulation(parametres, index_proyecto, salida, funcion_salida, grafica, inicio_en_sim_anterior)
    
    arguments
        parametres (1,1) double
        index_proyecto (1,1) int32
        salida (1,:) char = 'array'
        funcion_salida (1,:) char = 'coef'
        grafica logical = true
        inicio_en_sim_anterior logical = false
    end

    disp('[Inicio_Simulacion...]')

    var_salida = any(strcmp(salida, {'array','moment', 'drag', 'lift', 'downforce' ,'liftDdrag', 'downforceDdrag'}));
    var_funcion_salida = any(strcmp(funcion_salida, {'coef', 'penalizacion_oscilaciones_up', 'penalizacion_oscilaciones_down'}));
    

    if var_salida && var_funcion_salida
        fprintf("Las variables son CORRECTAS \n")
    elseif (~var_salida)
        error("ERROR: LA VARIABLE SALIDA NO ES CORRECTA \n")
    elseif (~var_funcion_salida)
        error("ERROR: LA VARIABLE FUNCION_SALIDA NO ES CORRECTA \n")
    end
    
    % Cargamos proyectos y configuraciones
    load('proyectos.mat');
    config = configuracion();
    config = simTools.actualizacion_config(config);

    % Cambiamos el proyecto si es necesario
    simTools.eleccion_Proyecto(proyectos(index_proyecto));

    % GENERACION DE LA MALLA Actualizamos la malla de Salome (Phyton)
    simTools.actualizacion_python(parametres, proyectos(index_proyecto));

    
    %Generamos y convertimos la malla para que OpenFoam la entienda
    runOrders1 = config.ruta_Carpeta_Programas + "/Bash/runOrdersShort1.sh";
    comando_wsl = sprintf('wsl %s', runOrders1);
    system(comando_wsl);
  

    % Correciones de la boundary
    simTools.boundaryCorrecion(proyectos(index_proyecto))
    
    % SIMULACION
    if (inicio_en_sim_anterior)
        runOrders2 = config.ruta_Carpeta_Programas + "/Bash/runOrdersShort2B.sh";
    else
        runOrders2 = config.ruta_Carpeta_Programas + "/Bash/runOrdersShort2.sh";
    end
    comando_wsl = sprintf('wsl %s', runOrders2);
    system(comando_wsl);

    % PLOTEAMOS LOS RESULTADOS
    fprintf('\n---------------RESULTADOS---------------\n'); 
    coef = simTools.forceCoeffs(parametres, proyectos(index_proyecto), salida, funcion_salida, grafica);


    disp('[Fin_Simulacion...]')

end