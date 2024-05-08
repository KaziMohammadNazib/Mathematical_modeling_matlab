
clear all
clc


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%  mathematical model and the value of parameters 
% here the model is F = rx(1-x/k)- qex
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
r=1.6;
    k=500;
    q=0.8;
    E=.6;

 Fx=@(t,X)[r.*X(1).*(1-(X(1)/k))-q*E*X(1)];
 timespan= 1977:2011;
inital=10;

[t,X]=ode45(Fx,timespan,inital);
plot(t,X,'LineWidth',2)
title('Mice population')
xlabel('time')
ylabel('Number of Mice')
hold on;




