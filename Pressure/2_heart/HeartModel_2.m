%%  preload

load('LoadChanges.mat')
figure
subplot(2,2,1) %Volume plot
plot(t,lowPL_LVvol)
hold on
plot(t,LVvol)
hold on
plot(t,highPL_LVvol)
xlabel('Time (s)')
ylabel('Volume (ml)')
title('Left Venticular Volume')
legend('low preload','normal preload','high preload')

subplot(2,2,2) %Pressure plot
plot(t,lowPL_LVpres)
hold on
plot(t,LVpressure)
hold on
plot(t,highPL_LVpres)
xlabel('Time (s)')
ylabel('Pressure (mmHG)')
title('Left Venticular Pressure')
legend('low preload','normal preload','high preload')

subplot(2,2,4)
plot(lowPL_LVvol,lowPL_LVpres)
hold on
plot(LVvol,LVpressure)
hold on
plot(highPL_LVvol,highPL_LVpres)
xlabel('Volume (ml)')
ylabel('Pressure (mmHG)')
title('Pressure Volume Loop')
legend('low preload','normal preload','high preload')
xlim([0,round(EDV+50,2)])
ylim([0,round(max(LVpressure)+50,2)]);


%% Part 2: afterload (AL) 

figure
subplot(2,2,1) %Volume plot
plot(t,lowAL_LVvol)
hold on
plot(t,LVvol)
hold on
plot(t,highAL_LVvol)
xlabel('Time (s)')
ylabel('Volume (ml)')
title('Left Venticular Volume')
legend('low afterload','normal afterload','high afterload')

subplot(2,2,2) %Pressure plot
plot(t,lowAL_LVpres)
hold on
plot(t,LVpressure)
hold on
plot(t,highAL_LVpres)
xlabel('Time (s)')
ylabel('Pressure (mmHG)')
title('Left Venticular Pressure')
legend('low afterload','normal afterload','high afterload')

subplot(2,2,4)
plot(lowAL_LVvol,lowAL_LVpres)
hold on
plot(LVvol,LVpressure)
hold on
plot(highAL_LVvol,highAL_LVpres)
xlabel('Volume (ml)')
ylabel('Pressure (mmHG)')
title('Pressure Volume Loop')
legend('low afterload','normal afterload','high afterload')
xlim([0,round(EDV+50,2)])
ylim([0,round(max(LVpressure)+50,2)]);