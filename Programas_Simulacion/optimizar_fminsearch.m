function x_opt = optimizar_fminsearch(x0, index_proyecto, salida, funcion_salida, tipo_opt)


    load('proyectos.mat');
    config = configuracion();
    config = simTools.actualizacion_config(config);


    % INICIAMOS EL ARCHIVOS DE GUARDADO

    if config.windows   
        ruta_archivo_opt = simTools.unix_to_win_Path(config.ruta_Carpeta_Proyectos+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt");
    else
        ruta_archivo_opt = config.ruta_Carpeta_Proyectos+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt";
    end

    doc = fopen(ruta_archivo_opt, 'w');
    fclose(doc);

    texto = fileread(ruta_archivo_opt);
    nuevaFila = sprintf("%s\t%s\t%s\n", "Iteraciones", "x", "funcion_f(x)");
    textoMod = texto + nuevaFila;

    doc = fopen(ruta_archivo_opt, 'w');
    fprintf(doc, '%s', textoMod);
    fclose(doc);

    options = optimset(Display="iter", PlotFcns=@optimplotfval, OutputFcn = @(x, optimValues, state) optTools.guardar_results_fminsearch(x, optimValues, state, index_proyecto, salida, funcion_salida, tipo_opt));
  
    if strcmp(tipo_opt, 'min')
        funcion_optimizar = @(x) simulation(x,index_proyecto, salida, funcion_salida, false, false);
    end

    if strcmp(tipo_opt, 'max')
        funcion_optimizar = @(x) -simulation(x,index_proyecto, salida, funcion_salida, false, false);
    end
    
    % Hacemos la optimizacion fminsearch
    % [x,fval,exitflag,output] = fminsearch(funcion_optimizar, x0, options);
    historial_sucio = evalc('[x,fval,exitflag,output] = fminsearch(funcion_optimizar, x0, options);');
    x_opt = x;
    
    patron = ['(?s)' regexptranslate('escape', '[Inicio_Simulacion...]') '.*?' regexptranslate('escape', '[Fin_Simulacion...]') '\n?'];
    historial = regexprep(historial_sucio, patron, '');
    

    if config.windows
        ruta_archivo_opt = simTools.unix_to_matlab_win_wsl(config.ruta_Carpeta_Proyectos_wsl+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_display_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt");
    else
        ruta_archivo_opt = config.ruta_Carpeta_Proyectos_wsl+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_display_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt";
    end
    
    archivo_opt = fopen(ruta_archivo_opt,"w");
    fprintf(ruta_archivo_opt, '%s', historial);
    fprintf(archivo_opt, '\n \n x = \n %.7f', x);
    fprintf(archivo_opt, '\n \n fval = \n %.7f', fval);
    fprintf(archivo_opt, '\n \n exitflag = \n %d', exitflag);
    fprintf(archivo_opt, '\n \n output = \n %s', output.message)
    
    fclose(archivo_opt);

end
