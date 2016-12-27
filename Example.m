%This is an example about how to use the function of adding noise .
wavLoadPath = '';
noisePath = '';
wavSavePath = '';
[N,fsN] = wavread(noisePath);
wavFiles = dir(fullfile(wavLoadPath,'*.wav'));
for n = 1:length(wavFiles)
    wavPath = wavFiles(n).name;
	[X,fsX] = wavread(fullfile(wavLoadPath,wavPath));
	[Y,N] = addnoise(X,N,10);
	Y = real(Y);
	wavwrite(Y,fsX,fullfile(wavSavePath,wavPath));
    snr = SNR_singlech(X,Y)
end
