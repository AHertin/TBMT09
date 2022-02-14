freq = 159.5676; %frquency in [1/s]
t = [0:0.01:16]';
i = zeros(length(t),1);
for j=1:length(t)
        i(j)= sin(t(j)*(freq*2*pi));
end
time = milliseconds(t/1000);
sinus = timeseries(i,t);
save('sinus.mat','sinus', '-v7.3')