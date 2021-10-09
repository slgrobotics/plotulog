function plotSensorData(time, gyro_xyz, accel_xyz, path)
  h_sens = figure(3,'Position',[100,50,2300,800]);
  clf(h_sens);
  subplot(211)
    plot(time, gyro_xyz(:,1));
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Gyro (rad/s)");  title("Raw Angular speed");
    hold on;
    plot(time, gyro_xyz(:,2));  
    plot(time, gyro_xyz(:,3));
    legend("X", "Y", "Z",'location','eastoutside');
    hold off;
  subplot(212)
    plot(time, accel_xyz(:,1));  
    grid on;
    xlim( [ time(1) time(length(time)) ]);
    set (gca, "xminorgrid", "on"); xlabel("Time(sec)");  ylabel("Acceleration (m/s^2)");  title("Raw Acceleration");
    hold on;
    plot(time, accel_xyz(:,2));  
    plot(time, accel_xyz(:,3));
    legend("X", "Y", "Z",'location','eastoutside');
    hold off;
  saveName = sprintf("%sSensor_Data", path)
  print(h_sens, saveName, "-dpdf","-color","-S600,800");
  print(h_sens, saveName, "-dpng","-color", "-r200");
endfunction
