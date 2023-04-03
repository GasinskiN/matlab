fp=200;
f1=10;
f2 = 20;
f3=15;
fi1=0;
A1=2;
A2=6;
A3=4;
k0 = 2;
  N = 1000; 
  t=0:1/fp:(N-1)/fp;
  t1=1:1/fp:3;
  z = (A1*sin(2*pi*f1*t+fi1));
  
  y = (A2*sin(2*pi*f2*t+fi1));
  l = zeros(1,1000);
  for i=200:600
    l(i) = A2*sin(2*pi*f3*(i/100)+fi1);
  end
  
  interference = rand(1,1000)*0.04 + 0.01;
  interferencen = 0.05*randn(1,1000)+0.01;
  x=z+y+l;

  xinterference = x+interference;
  xinterferencen = x + interferencen;
figure();
xlabel ('czas [s]');
ylabel ('sygnal');
title ('wykres sinusoidy');

subplot(3,1,1)

plot(t,x)

subplot(3,1,2)

plot(t,interferencen)

subplot(3,1,3)


plot(t, xinterferencen)


