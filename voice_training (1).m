fs=8000;                      % Sampling rate

nbits=16;
1
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

%————Performing autocorrelation————

ms2 = fs/500;

ms20 = fs/50;

r = xcorr(y, ms20);

d = (-ms20:ms20)/fs;

plot(d, r);

title('Autocorrelation');

xlabel('Delay (s)');

ylabel('Correlation coeff.');

r = r(ms20 + 1 : 2*ms20+1);


[rmax, tx] = max(r(ms2:ms20));

 Fx = fs/(ms2+tx-1);

 %%—-recognizing voice—

Fth= 160; 
%% threshold frequency is 160 Hz, you can change this frequency too

if Fx> Fth

    disp('It is a female voice!')
     gender = 'female';
else

    disp('It is a male voice!')
      gender = 'male'
end
%% Save users data
idno = input("Enter the user's Id no.:");
try
    load database
    F=[F;f];
    C=[C;idno];
    G=[G;gender]
    save database22
catch
    F = f;
    C = idno;
    G = gender;
    save database F C G;
    
    
end
msgbox('your voice is registered')

