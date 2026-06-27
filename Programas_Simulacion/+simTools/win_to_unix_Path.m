function unixPath = win_to_unix_Path(winPath)
    % Reemplaza las barras invertidas por barras normales
    unixPath = strrep(winPath, '\', '/');
    
    % Convierte la letra de la unidad (C:, D:, etc.) en formato /c, /d, ...
    unixPath = regexprep(unixPath, '^([A-Za-z]):', '/mnt/${lower($1)}');
end