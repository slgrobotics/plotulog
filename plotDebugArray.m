
  %% Plot debug array data. nvalues_dbg_array is how many of the 58 max floats is passed in every sample.
 

function plotDebugArray(time, nvalues_dbg_array, dbg_array_values, folderName, fname)
  
  printf("plotDebugArray():  nvalues_dbg_array: %d\n", nvalues_dbg_array);
  printf("                   dbg_array_values: columns: %d   rows: %d\n", columns(dbg_array_values), rows(dbg_array_values));
  printf("                   folder: %s\n", folderName);
  printf("                   file: %s\n", fname);
  
  linewidth = 3;
  plot_width = 2300;
  plot_height = 300;
  x_pos = 200;
  y_pos_start = 900;
  y_pos = y_pos_start;
  n_figure = 22;

  x_pos_shift = -15;
  y_pos_shift = -180;

  data_start_column = 1; % each plot starts here in the dbg_array_values
  
  h_dbg1 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  clf(h_dbg1);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    % comment out line below for Y autorange:
    %ylim( [ -1 ceil(findMax(dbg_array_values(:,1),dbg_array_values(:,2),dbg_array_values(:,3)) / 3) ]);
    %ylim( [ -1 20 ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - L1 controller");
    %set (gca, "Motion", "horizontal", "Enable", "on");
    %zoomHandle = zoom(h_dbg1);
    %setAxesZoomMotion(zoomHandle, AxesH, "horizontal");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)-0.1, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)-4.0, "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("target bearing", "nav bearing", "crosstrack error","crosstrack dist","L1 skipped to B","L1 nav state",'location','eastoutside');
    hold off;
  
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift;
  n_figure++;
  
  h_dbg2 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg2);
  clf(h_dbg2);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Mission Efforts and Actuator Controls");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)-0.015, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)-0.015, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    legend("yaw - mission effort", "yaw - act controls", "throttle - mission", "throttle - act controls","_pos_ctrl_state",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg3 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg3);
  clf(h_dbg3);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Ground Speed and Direction");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)+0.1, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("current heading", "heading error", "ground speed abs","ground speed abs prev", "ground speed ns",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg4 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg4);
  clf(h_dbg4);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Ground Speed PID");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, min(max(dbg_array_values(:,data_start_column++),-3),3), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("mission target speed", "x vel", "x acc","speed_proximity_factor",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg5 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg5);
  clf(h_dbg5);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Heading PID");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    legend("mission target heading err", "z heading err", "heading yaw effort",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg6 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg6);
  clf(h_dbg6);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Yaw Rate PID");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)+0.1, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    legend("mission target yaw rate", "z yaw", "z yaw prev", "z yaw rate",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg7 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg7);
  clf(h_dbg7);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Distances etc.");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)+0.3, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    legend("distance target", "wp current dist", "wp previous dist", "wp next dist",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg8 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg8);
  clf(h_dbg8);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++)*0.5+2.0, "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Other Values");
    zoom off;
    zoom xon;
    hold on;
    plot(time, min(max(dbg_array_values(:,data_start_column++)/1000,-3),3), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    %plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth); % "wp close enough rad",
    %plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth); % "acceptance rad",
    legend("isSharpTurn", "desired r", "nav lateral acceleration demand", "desired theta","control effort",'location','eastoutside');
    hold off;
    
  % Saving to PDF and PNG formats:
  % saveName = sprintf("%sDebug_Array", folderName)
  % print(h_dbg1, saveName, "-dpdf","-color","-S600,800");
  % print(h_dbg1, saveName, "-dpng","-color", "-r200");
endfunction
