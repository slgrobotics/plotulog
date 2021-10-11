
  %% Plot debug array data. nvalues_dbg_array is how many of the 58 max floats is passed in every sample.
 

function plotDebugArray(time, nvalues_dbg_array, dbg_array_values, folderName, fname)
  
  printf("plotDebugArray():  nvalues_dbg_array: %d\n", nvalues_dbg_array);
  printf("                   dbg_array_values: columns: %d   rows: %d\n", columns(dbg_array_values), rows(dbg_array_values));
  printf("                   folder: %s\n", folderName);
  printf("                   file: %s\n", fname);
  
  data_start_column = 1; % each plot starts here in the dbg_array_values
  x_pos = 100;
  y_pos = 400;
  n_figure = 22;
  
  h_dbg1 = figure(n_figure,'Position',[x_pos,y_pos,2300,800]);
  clf(h_dbg1);
  %subplot(111)
    plot(time, dbg_array_values(:,1));
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    % comment out line below for Y autorange:
    %ylim( [ -1 ceil(findMax(dbg_array_values(:,1),dbg_array_values(:,2),dbg_array_values(:,3)) / 3) ]);
    %ylim( [ -1 20 ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");  title("Debug Array Values - L1 controller");
    %set (gca, "Motion", "horizontal", "Enable", "on");
    %zoomHandle = zoom(h_dbg1);
    %setAxesZoomMotion(zoomHandle, AxesH, "horizontal");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++));  
    plot(time, dbg_array_values(:,data_start_column++));
    plot(time, dbg_array_values(:,data_start_column++));  
    plot(time, dbg_array_values(:,data_start_column++));
    plot(time, dbg_array_values(:,data_start_column++));  
    plot(time, dbg_array_values(:,data_start_column++));
    legend("target bearing", "nav bearing", "crosstrack error","crosstrack dist","L1 skipped to B","L1 nav state",'location','eastoutside');
    hold off;
  
  %data_start_column += 3;  % skip some, if needed
  x_pos += 10;
  y_pos -= 10;
  n_figure++;
  
  h_dbg2 = figure(n_figure,'Position',[x_pos,y_pos,2300,800]);
  newplot(h_dbg2);
  clf(h_dbg2);
  %subplot(111)
    plot(time, dbg_array_values(:,1));
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");  title("Debug Array Values - Mission Efforts and Actuator Controls");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++));  
    plot(time, dbg_array_values(:,data_start_column++));
    plot(time, dbg_array_values(:,data_start_column++));  
    plot(time, dbg_array_values(:,data_start_column++));
    legend("mission yaw effort", "mission throttle", "act controls yaw","act controls throttle",'location','eastoutside');
    hold off;
    
  % Saving to PDF and PNG formats:
  % saveName = sprintf("%sDebug_Array", folderName)
  % print(h_dbg1, saveName, "-dpdf","-color","-S600,800");
  % print(h_dbg1, saveName, "-dpng","-color", "-r200");
endfunction
