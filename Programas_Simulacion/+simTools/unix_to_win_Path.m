function winPath = unix_to_win_Path(winPath)
    % Reemplaza las barras invertidas por barras normales
    winPath = strrep(winPath, '/', '\');
    
    % Convierte la letra de la unidad (C:, D:, etc.) en formato /c, /d, ...
    winPath = regexprep(winPath, '^\\mnt\\([A-Za-z])', '${upper($1)}:');
end