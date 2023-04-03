tc = 0:1/20:5;
ch = chirp(tc, 1, 5, 5,"logarithmic");
figure()
pspectrum(ch,20,"spectrogram")
