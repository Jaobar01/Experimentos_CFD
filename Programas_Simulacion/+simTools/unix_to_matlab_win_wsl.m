function matlab_win_wsl = unix_to_matlab_win_wsl(unix_path)
    % Reemplaza las barras invertidas por barras normales
    matlab_win_wsl = strrep(unix_path, '/', '\');

    matlab_win_wsl = "\\wsl$\Ubuntu" + matlab_win_wsl;
    
end