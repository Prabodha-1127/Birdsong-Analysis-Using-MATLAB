%2022e116
%EC5011
%task01
% Load the .wav file
[x, Fs] = audioread('bird_singing.wav'); 

% Plot in time domain
L = length(x);
t = (0:L-1)/Fs*1000; 
figure;
plot(t, x);
xlabel('Time (ms)');
ylabel('Amplitude');
title('Time Domain Signal of Birdsong');

% Plot in frequency domain
Y = abs(fft(x));
Ly = length(Y);
f = (0:Ly/2-1)*Fs/Ly;
figure;
plot(f, Y(1:Ly/2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Birdsong');

% Extract MFCCs (Requires Audio Toolbox)
% Convert stereo to mono if needed
if size(x,2) > 1
    x = mean(x, 2); 
end

% Use mfcc function from Audio Toolbox
[coeffs, delta, deltaDelta, loc] = mfcc(x, Fs);

% Plot MFCCs
figure;
imagesc(loc, 1:size(coeffs,2), coeffs');
axis xy;
xlabel('Time (s)');
ylabel('MFCC Coefficient Index');
title('MFCCs of Birdsong');
colorbar;

