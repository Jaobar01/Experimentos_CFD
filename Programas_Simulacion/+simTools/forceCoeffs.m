function coef = forceCoeffs(parametres, proyecto, salida, funcion_salida, grafica)
    
    config = configuracion();
    config = simTools.actualizacion_config(config);

    if config.windows
        archivo_coef = simTools.unix_to_matlab_win_wsl(config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/Archivos_OpenFOAM/postProcessing/forceCoeffs1/0/forceCoeffs.dat");
    else
        archivo_coef = config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + "/Archivos_OpenFOAM/postProcessing/forceCoeffs1/0/forceCoeffs.dat";
    end 


    % Cogemos el coeficiente que buscamos
    coeficientes = fopen(archivo_coef);
    lineasDocument = textscan(coeficientes, '%d %f %f %f %f %f', 'HeaderLines', 10);
    
    % Elegimos la variable de estudio
    
    if strcmp(salida, 'moment')
        columna_coef = lineasDocument{2};
    end

    if strcmp(salida, 'drag')
        columna_coef = lineasDocument{3};
    end
    
    if strcmp(salida, 'lift')
        columna_coef = lineasDocument{4};
    end

    if strcmp(salida, 'downforce')
        columna_coef = lineasDocument{4};
        columna_coef = -columna_coef;
    end

    if strcmp(salida, 'liftDdrag')
        columna_coef = lineasDocument{4}./lineasDocument{3};
    end

    if strcmp(salida, 'downforceDdrag')
        columna_coef = -lineasDocument{4}./lineasDocument{3};
    end

    
    l = length(lineasDocument{1});
    n_it = 200;

    % La salida array solo puede generar datos, no graficas ni optimizaciones
    if strcmp(salida, 'array')

        columna_coef = lineasDocument{2};
        coef1 = sum(columna_coef(l-n_it:end))/length(columna_coef(l-n_it:end));
        fprintf('moment = %.7f \n', coef1);

        columna_coef = lineasDocument{3};
        coef2 = sum(columna_coef(l-n_it:end))/length(columna_coef(l-n_it:end));
        fprintf('drag = %.7f \n', coef2);

        columna_coef = lineasDocument{4};
        coef3 = sum(columna_coef(l-n_it:end))/length(columna_coef(l-n_it:end));
        fprintf('lift = %.7f \n', coef3);

        columna_coef = lineasDocument{4};
        columna_coef = -columna_coef;
        coef4 = sum(columna_coef(l-n_it:end))/length(columna_coef(l-n_it:end));
        fprintf('downforce = %.7f \n', coef4);

        coef = [coef1 coef2 coef3 coef4];

    else
        coef = sum(columna_coef(l-n_it:end))/length(columna_coef(l-n_it:end));
    
        % CASO OPTIMIZACIÓN

        
        if ~strcmp(funcion_salida, 'coef')

            valor_objetivo = 0.7;
            porcetanje_valor_objetivo = 0.05;
            D = log(1+valor_objetivo)/porcetanje_valor_objetivo;
            CV = std(columna_coef(l-n_it:end))/mean(columna_coef(l-n_it:end));

            if strcmp(funcion_salida, 'penalizacion_oscilaciones_up')
                fprintf('Coeficiente = %f \n', coef)

                coef = coef + (exp(D*CV)-1);

                fprintf('Coeficiente_con_penalizacion = %f \n', coef)
            end
    
            if strcmp(funcion_salida, 'penalizacion_oscilaciones_down')
                fprintf('Coeficiente = %f \n', coef)
                
                coef = coef - (exp(D*CV)-1);    
                fprintf('Coeficiente_con_penalizacion = %f \n', coef)
            end
        end
     
        
        if (grafica)
            
            iteraciones = lineasDocument{1};
            plot(iteraciones,columna_coef)
            ylim([columna_coef(end)-0.5,columna_coef(end)+0.5])
            disp(proyecto{1})
            disp(parametres)
            disp(salida)
            title(sprintf('%s   |   p = %.1f   |   %s', proyecto{1}, parametres, salida),Interpreter="none")
            hold on
        
            plot([l-n_it,l],[coef,coef], LineStyle='--',Color='r', LineWidth=2)
            % f = gcf;
            % exportgraphics(f,sprintf('D:/MisProyectos/CFD/%s/Archivos_OpenFOAM/data/plots/%s%d_%s.png', proyecto, proyecto,parametres,salida))
        end

        fprintf('%s = %.7f \n',salida,coef);

    end



    % Copiamos los datos para observar resultados
    if config.windows
        cadena = "cp -r " + config.ruta_Carpeta_Proyectos_wsl + "/" + proyecto + " " + config.ruta_Carpeta_Proyectos; 
        comando_wsl = sprintf('wsl %s', cadena);
        system(comando_wsl);
    end

end