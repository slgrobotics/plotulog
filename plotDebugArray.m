function plotDebugArray(time, dbg_array_xyz, path)
  h_dbg = figure(22,'Position',[100,400,2300,800]);
  clf(h_dbg);
  %subplot(111)
    plot(time, dbg_array_xyz(:,1));
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    % comment out line below for Y autorange:
    %ylim( [ -1 ceil(findMax(dbg_array_xyz(:,1),dbg_array_xyz(:,2),dbg_array_xyz(:,3)) / 3) ]);
    %ylim( [ -1 20 ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");  title("Debug Array Values");
    %set (gca, "Motion", "horizontal", "Enable", "on");
    %zoomHandle = zoom(h_dbg);
    %setAxesZoomMotion(zoomHandle, AxesH, "horizontal");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_xyz(:,2));  
    plot(time, dbg_array_xyz(:,3));
    legend("X", "Y", "Z",'location','eastoutside');
    hold off;
  saveName = sprintf("%sDebug_Array", path)
  print(h_dbg, saveName, "-dpdf","-color","-S600,800");
  print(h_dbg, saveName, "-dpng","-color", "-r200");
endfunction
