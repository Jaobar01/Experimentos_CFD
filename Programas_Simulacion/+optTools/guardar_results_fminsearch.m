function stop = guardar_results_fminsearch(x, optimValues, state, index_proyecto, salida, funcion_salida, tipo_opt)
    stop = false;
    
    load('proyectos.mat');
    config = configuracion();
    config = simTools.actualizacion_config(config);

    if strcmp(state, 'iter')
        
        if config.windows   
            ruta_archivo_opt = simTools.unix_to_win_Path(config.ruta_Carpeta_Proyectos+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt");
        else
            ruta_archivo_opt = config.ruta_Carpeta_Proyectos+"/"+proyectos(index_proyecto)+"/Optimizaciones/optimizacion_"+salida+"_"+funcion_salida+"_"+tipo_opt+".txt";
        end
        
        iter = optimValues.iteration;
        
        fx = optimValues.fval;

        if strcmp(tipo_opt, 'max')
            fx = -optimValues.fval;
        end
        
        texto = fileread(ruta_archivo_opt);
        nuevaFila = sprintf("%d\t%.7f\t%.7f\n", iter, x, fx);
        textoMod = texto + nuevaFila;
    
        doc = fopen(ruta_archivo_opt, 'w');
        fprintf(doc, '%s', textoMod);
        fclose(doc);
        
    end

end