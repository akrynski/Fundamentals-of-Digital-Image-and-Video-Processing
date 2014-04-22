clear;
f1=10;F1=100;f2=90;F2=100;
% for n=1:50,
%     x1(n)=10*sin(2*pi*n*f1/F1);
%     fr1(n)=n/25*F1/2;
% end
n = 0:49;
x1 = 10*sin(2*pi*n*f1/F1);
 fr1=n/25*F1/2;
 
y1=fft(x1,50);
plot(fr1,abs(y1),'rx');
xlabel('frequency in Hz');
ylabel('Amplitude');
%figure;
hold on;
% for n=1:50,
%     x2(n)=10*sin(2*pi*n*f2/F1);
%     fr2(n)=n/25*F1/2;
% end
x2 = 10*sin(2*pi*n*f2/F1);
fr2=n/25*F1/2;

y2=fft(x2,50);
plot(fr2,abs(y2));
%xlabel('frequency in Hz');
