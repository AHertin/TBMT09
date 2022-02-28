%{
Plots signals from VTG-experiment and computes the volume of N2 during the 
wash-out and maximul ventilation phases.
Complete with your code in the marked places

INPUTS
    flow : Pneumotachograph flow signal (ml/s).
           N.B. path to the .txt file may change based on where you saved your files
           
    FN2 : Nitrogen fraction (%).
          N.B. path to the .txt file may change based on where you saved your files

Signals are sampled at 100 Hz, thus make sure to take care of the conversion 
to seconds later on. Maximum ventilation phase starts at 280.8 seconds and
ends at end of registration (samples 28080 - 31340). 

STEPS
1 - import recodings 
2 - compute the N2 flow and dispaly recorded values
3 - compute the N2 volume for the wash-out and the maximum ventilation phases. 
%}
close all; clear variables;

%% 1 - Import recordings
flow = dlmread('Students/Exercise_2_flow.txt');
FN2 = dlmread('Students/Exercise_2_FN2.txt');

%% 2 - Compute N2 flow and display singal

subplot(3,1,1),plot(flow);
line([28080 28080],[-1000 1000],'Color','r')
ylabel('Total gas flow [mL/s]','FontWeight','Bold');
title('Signals from VTG washout test','FontWeight','Bold','Fontsize',12);
axis([0 31340 -1000 1000]);

subplot(3,1,2),plot(FN2);
line([28080 28080],[0 80],'Color','r')
ylabel('Nitrogen fraction [%]','FontWeight','Bold');
axis([0 31340 0 80]);

% ####### Complete here with your calculation of the N2 flow #######
% ###### START

flow_N2 = flow .* (FN2 ./ 100);

% uncomment subplot after your flow_N2 implementation
subplot(3,1,3),plot(flow_N2);

% ###### END
subplot(3,1,3),ylabel('Nitrogen flow [mL/s]','FontWeight','Bold');
xlabel('Sample number (fs = 100Hz)','FontWeight','Bold','Fontsize',12);
axis([0 31340 -300 300]);

%% 3 - Compute the N2 volume for the wash-out and the maximum ventilation phases.

% ####### Complete here with your calculation of VN2_wo and VN2_mv #######
% ###### START

VN2_wo = -sum(flow_N2(1:28080))./100;
VN2_mv = -sum(flow_N2(28080:end))./100;

% ###### END

fprintf('Volume of nitrogen during the wash-out phase: %4.3f [mL] \n', VN2_wo)
fprintf('Volume of nitrogen during the maximum-ventilation phase: %4.3f [mL] \n', VN2_mv)

%% Lets take a look at the derived volume graph 

% create the time vector
t = linspace(0, size(flow, 1), size(flow, 1))/100;
% compute the integral of the flow graph
Y = cumtrapz(t, flow);

figure(3) 
subplot(211)
plot(t,flow); % waveform
% yline(0,'-.k');
xline(28080/100, 'r');
title('Flow graph')
ylabel('Total gas flow [mL/s]','FontWeight','Bold');
xlabel('Seconds [s]','FontWeight','Bold','Fontsize',12);
axis([0 max(t) min(flow) max(flow)]);
subplot(212)
plot(t,Y); % integral
xline(28080/100, 'r');
% yline(3,'-.k');
title('Derived volume graph')
ylabel('Volume [mL]','FontWeight','Bold');
xlabel('Seconds [s]','FontWeight','Bold','Fontsize',12);
axis([0 max(t) min(Y)-100 max(Y)+100]);
