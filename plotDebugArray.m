
  %% Plot debug array data. nvalues_dbg_array is how many of the 58 max floats is passed in every sample.
 

function plotDebugArray(time, nvalues_dbg_array, dbg_array_values, folderName, fname)
  
  printf("plotDebugArray():  nvalues_dbg_array: %d\n", nvalues_dbg_array);
  printf("                   dbg_array_values: columns: %d   rows: %d\n", columns(dbg_array_values), rows(dbg_array_values));
  printf("                   folder: %s\n", folderName);
  printf("                   file: %s\n", fname);
  
  linewidth = 3;
  plot_width = 2300;
  plot_height = 300;
  x_pos = 250;
  y_pos_start = 950;
  y_pos = y_pos_start;
  n_figure = 22;

  x_pos_shift = -15;
  y_pos_shift = -180;
  vis_shift = 0.03;

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
    plot(time, dbg_array_values(:,data_start_column++)+vis_shift, "linewidth", linewidth);
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
    title("Debug Array Values - Heading Error and Torque effort");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)-vis_shift, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)-2.0, "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)-2.0 - vis_shift, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    legend("current heading", "heading error", "torque - mission effort", "torque - act controls", "machine state",'location','eastoutside');
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
    title("Debug Array Values - Heading/Yaw Rate Controller");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)+2.0, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)+1.0, "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)-2.0, "linewidth", linewidth);  
    legend("current heading", "mission turning setpoint", "yaw rate setpoint", "mission torque effort", "z yaw rate",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg5 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg5);
  clf(h_dbg5);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++)-2.0, "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Ground Speed and Thrust");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)-vis_shift, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    plot(time, dbg_array_values(:,data_start_column++)-vis_shift, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("thrust - mission effort", "thrust - act controls","ground speed abs","x vel", "ground speed ns",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg6 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg6);
  clf(h_dbg6);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++)+vis_shift, "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Ground Speed PID");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)+vis_shift, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("mission velocity setpoint", "x vel", "x vel ema", "speed proximity factor","thrust - act controls",'location','eastoutside');
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
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - L1 Control Values");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("nav lateral accel demand","mission turning setpoint","wp close enough rad","acceptance rad",'location','eastoutside');
    hold off;
    
  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbg9 = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbg9);
  clf(h_dbg9);
  %subplot(111)
    %data_start_column += 1;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - GPS Performance - Comparing to EKF2.");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, wrap_pi(dbg_array_values(:,data_start_column++))+vis_shift, "linewidth", linewidth);
    legend("EKF heading", "Mag heading", "GPS heading", "GPS course ovr gnd", 'location','eastoutside');
    hold off;

  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbgA = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbgA);
  clf(h_dbgA);
  %subplot(111)
    %data_start_column += 1;
    plot(time, dbg_array_values(:,data_start_column++)+vis_shift, "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - GPS Performance - Speed.");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("GPS speed", "EKF speed", "vel-ms", "vel-N", "vel-E", "vel-ned-valid", 'location','eastoutside');
    hold off;

  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbgB = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbgB);
  clf(h_dbgB);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - GPS Performance Metrics.");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++)/10, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)/10, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)/10, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    legend("fix type", "N sat/10", "noise/10", "jamming/10", "jamming state", 'location','eastoutside');
    hold off;

  %data_start_column += 3;  % skip some, if needed
  x_pos += x_pos_shift;
  y_pos -= plot_height + y_pos_shift; if(y_pos < 0) y_pos = y_pos_start; endif
  n_figure++;
  
  h_dbgB = figure(n_figure,'Position',[x_pos,y_pos,plot_width,plot_height]);
  newplot(h_dbgB);
  clf(h_dbgB);
  %subplot(111)
    plot(time, dbg_array_values(:,data_start_column++)+5, "linewidth", linewidth);  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Value");
    title("Debug Array Values - Servo Positions.");
    zoom off;
    zoom xon;
    hold on;
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)+5, "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++), "linewidth", linewidth);
    plot(time, dbg_array_values(:,data_start_column++)+5, "linewidth", linewidth);
    legend("Gas Engine Throttle", "Tool - Blades", "Second Tool", "Left Wheel", "Right Wheel", 'location','eastoutside');
    hold off;

  % Saving to PDF and PNG formats:
  % saveName = sprintf("%sDebug_Array", folderName)
  % print(h_dbg1, saveName, "-dpdf","-color","-S600,800");
  % print(h_dbg1, saveName, "-dpng","-color", "-r200");
endfunction

function ret = wrap_pi(x)
  %M_PI_PRECISE =	3.141592653589793238462643383279502884;
  high = 180;   % M_PI_PRECISE
  low = -180;   % -M_PI_PRECISE
	range = high - low;

	if (x < low)
		x += range * ((low - x) / range + 1);
  endif
  
	ret = low + rem(x - low, range);
endfunction

