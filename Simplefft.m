function [xPitch]= Simplefft(y);
F = fft(y(:,1));
plot(real(F));
m = max(real(F));
xPitch= find(real(F)==m,1);