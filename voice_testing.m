fs=8000;                      % Sampling rate

nbits=16;

nChannels=1;

duration=3;                 % Recording duration

arObj=audiorecorder(fs, nbits, nChannels);

fprintf('Press any key to start %g seconds of recording…', duration); pause

fprintf('Recording…');

recordblocking(arObj, duration);

fprintf('Finished recording.\n');

fprintf('Press any key to play the recording…'); pause; fprintf('\n');

play(arObj);

fprintf('Plotting the waveform…\n');

y=getaudiodata(arObj);          % Get audio sample data

plot(y);             % Plot the waveform

figure;
%% Feature Extraction
f = Simplefft(y);
%% classify data
%% find the closest feature from database
load database
D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D,d];
end
%% Smallest Distance
sm =inf;
ind = -1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class= C(ind);
disp("The detected class is;");
detected_class
        
    