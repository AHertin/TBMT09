%% load parameters
load('heart_parameters.mat')
%% show flow curves
figure
plot(t,AVflow)
hold on
plot(t,MVflow)
xlabel('Time (s)')
ylabel('Flow (ml/s)')
legend('Aortic Valve Flow','Mitral Valve Flow')

%% calculate volume curve
% Integrate the flow curves over time
LVvol = zeros(length(t),1)'; %preallocate the variable
dt=t(2); % dt is the step size
for i = 1:length(t)
    if i == 1
        LVvol(i)= EDV; % Enter the ventricular volume at time step 1
    else
        LVvol(i)= MVflow(i) * dt - AVflow(i) * dt + LVvol(i-1); % Enter the formula to calculate the volume
    end
end

%% plot volume curve

figure
plot(t,LVvol)
xlabel('Time (s)')
ylabel('Volume (ml)')
title('Left Venticular Volume')

%% plot Elastance curve

figure
plot(t,E)
xlabel('Time (s)')
ylabel('Elastance (mmHG/ml)')
title('Left Venticular Elastance')

%% calculate pressure curve
LVpressure = E.*LVvol;
figure
plot(t,LVpressure)
xlabel('Time (s)')
ylabel('Pressure (mmHG)')
title('Left Venticular Pressure')

%% plot PV loop
figure
plot(LVvol,LVpressure)
xlabel('Volume (ml)')
ylabel('Pressure (mmHG)')
title('Pressure Volume Loop')
xlim([0,round(EDV+10,2)])
ylim([0,round(max(LVpressure)+10,2)]);
