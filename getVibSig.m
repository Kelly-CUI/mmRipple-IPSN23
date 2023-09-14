function  [vibSig]=getVibSig(signal,ang,sigFre)

fontsize = 16;
fig_width = 15;
fig_height = 12;
linewidth = 2.5;

[Nsample,NRx] = size(signal);
Nchirp = 130;
fs=10000;
fft_x  =fs/(Nsample-1)*(0:1:Nsample-1);

% filter
filter_fft = zeros(1,Nsample);
sig_st = find(fft_x>=sigFre(1),1);
sig_end = find(fft_x>sigFre(2),1);
sigIdx = sig_st:1:sig_end;
filter_fft(sigIdx)=1;
filter_fft = filter_fft';


% beamforming
w = pi* sin(ang/180*pi);
signal_beam = signal(:,1)+ signal(:,2)*exp(-1i*w)+signal(:,3)*exp(-1i*2*w)+signal(:,4)*exp(-1i*3*w);

%outliter
loc_0  = find(signal_beam==complex(0));
signal_beam(loc_0)=  nan;

signal_beam = fillmissing(signal_beam,'linear');



freBand = abs(fft(signal_beam));
% freBand(3585:-256:0,:) = freBand(3585+1:-256:0,:) ;


figure;
set(gcf,'unit', 'centimeters', 'position', [15,10,fig_width,fig_height],'DefaultTextFontName','times new roman','Color',[1 1 1]);
% plot(fft_x,abs(fft(rawSig)));
plot(fft_x,freBand);
xlim([100,2000]);
set(gca, 'fontsize', fontsize);
set(gca,'YDir','normal');
xlabel('Frequency(Hz)','FontSize',fontsize); ylabel('|FFT|','FontSize',fontsize);
title('FFT on Phase ','FontSize',fontsize);


vibSig = getPhase(signal_beam,filter_fft);

figure;
set(gcf,'unit', 'centimeters', 'position', [15,10,fig_width,fig_height],'DefaultTextFontName','times new roman','Color',[1 1 1]);
plot(vibSig);
xlim([100,30000+100]);
set(gca, 'fontsize', fontsize);
set(gca,'YDir','normal');
xlabel('#Sample','FontSize',fontsize); ylabel('Phase(rad)','FontSize',fontsize);
title('Phase','FontSize',fontsize);


windows = 128*3;

f_len = windows/2 + 1;
f = linspace(0, 5000, f_len);
noverlap = windows/2;

[s,f,t,p] = spectrogram(vibSig, windows,noverlap,f,fs);

s = (abs(s));



figure;
set(gcf,'unit', 'centimeters', 'position', [15,10,fig_width,fig_height],'DefaultTextFontName','times new roman','Color',[1 1 1]);
imagesc(t, f, s);
set(gca, 'fontsize', fontsize);
set(gca,'YDir','normal');
xlabel('Time(s)','FontSize',fontsize); ylabel('Freqency','FontSize',fontsize);
title('Spectrum','FontSize',fontsize);
% imagesc(t, f, s);xlabel('Samples'); ylabel('Freqency');
% colorbar;



end

function phase = getPhase(signal,filter_fft)

rawPhase = angle(signal);

rawPhase = unwrap(rawPhase);
rawPhase = unwrap(rawPhase,pi);

baseline = rawPhase(1)+pi;

rawPhase(rawPhase>=baseline) = rawPhase(rawPhase>=baseline)-2*pi;


rawPhase = detrend(rawPhase);
%% filter
phase_fft =  fft(rawPhase);


phase_fft = phase_fft.*filter_fft;


phase = ifft(phase_fft,'symmetric');
phase = unwrap(phase);



phase = filloutliers(phase,'previous','mean');

phase = fillmissing(phase,'linear');


end


