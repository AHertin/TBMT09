%{
Calculates gas volumes from a pneumotachograph signal.
Complete with your code in the marked places

INPUTS 

    flow :  measured pneumotachograph flow signal. 
            Signals are sampled at 100 Hz, thus make sure to take care of the
            conversion to seconds later on.

            N.B. path to the .txt file may change based on where you saved your files

STEPS

1 - load the flow signal;
2 - calibrate the signal based on the calibration factor given by the lab
    instructor;
3 - remove drift from the signal;
4 - compute tidal and vital capacity volumes in the signal
%}

%% 1 - Import flow file and make it usable 

flow = readmatrix('Students/Exercise_2_pneum_flow.txt', 'NumHeaderLines', 1);
flow = flow';
flow = flow(:);  % concatenate all the rows of the matrix to obtain the signal

%% 2 - Calibrate the signal

cal = 1; % calibration factor obtained using a 3L calibration volume
flow_calibrated = flow*cal;

%% 3.a - Select a no-flow portion of the signal for drift removal

figure(1)
plot(flow_calibrated);
ylabel('Total gas flow [L/s]','FontWeight','Bold');
xlabel('Sample number (fs = 100Hz)','FontWeight','Bold','Fontsize',12);
title('Your measured flow signal','FontWeight','Bold','Fontsize',12);
axis tight;

%% 3.b - Remove drift from the signal.
%{
Ones a portion of no-signal is found, compute mean value and subtract or
add it to original flow signal to set it to 0 in case there is no flow.
All this helps with the calculation of the volume.
%}

driftValue = mean(flow_calibrated(1:100));
flow_calibrated = flow_calibrated - driftValue;

% check if drift is removed
figure(2)
hold all;
plot(flow_calibrated);
yline(0,'-.k');
ylabel('Total gas flow [L/s]','FontWeight','Bold');
xlabel('Sample number (fs = 100Hz)','FontWeight','Bold','Fontsize',12);
title('Your measured flow signal','FontWeight','Bold','Fontsize',12);
axis tight;

%% 4 - Complete here for the calculation of Tidal volume and Vital capacity

TV = 0;
VC = 0;

fprintf('Computed tidal volume: %4.3f [L] \n', TV)
fprintf('Computed vital capacity: %4.3f [L] \n', VC)

%% Lets take a look at the derived volume graph

% create the time vector
t = linspace(0, size(flow_calibrated, 1), size(flow_calibrated, 1))/100;
% compute the integral of the flow graph
Y = cumtrapz(t, flow_calibrated);

figure(3)
subplot(211)
plot(t,flow_calibrated); % waveform
yline(0,'-.k');
title('Flow graph')
ylabel('Total gas flow [L/s]','FontWeight','Bold');
xlabel('Seconds [s]','FontWeight','Bold','Fontsize',12);
axis([0 max(t) min(flow_calibrated) max(flow_calibrated)]);

subplot(212)
plot(t,Y); % integral
% yline(3,'-.k');
title('Derived volume graph')
ylabel('Volume [L]','FontWeight','Bold');
xlabel('Seconds [s]','FontWeight','Bold','Fontsize',12);
axis([0 max(t) min(Y) max(Y)]);
