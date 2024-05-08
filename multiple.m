clear all
clc
 
%parameters
% 
% a=.09602;
%  b=.01691;
% p=.00729;


a=30;
% k=10000;
b=25;

gamma=4;
lamda=3;
mu1=4;
mu2=4;
ro1=6;
ro2=4;

 
%Functions and Analysis
% Pdot=a*y(1)-b*y(2);
% Mdot=b*y(2)-gamma*y(3)-lamda*y(4);
% Hdot=gamma*y(3)-mu1*y(4)*y(3)+ mu2*y(4)*y(3);
% Cdot=lamda*y(4)+mu1*y(4)*y(3)-mu2*y(4)*y(3);
% Adot=Hdot-Cdot;


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Model
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% F=@(t,y)[a*y(1)-b*y(1)*y(2);b*y(1)*y(2)-p*y(2)*y(3);p*y(2)*y(3)];   *(1-(y(1)/k))

F=@(t,y)[a*y(1)+b*y(2);...
    b*y(2)+gamma*y(3)-lamda*y(4);...
    (gamma*y(3)+mu1*y(4)*y(3)+ro1*y(3)*y(5))*2- mu2*y(4)*y(3);...
    lamda*y(4)-mu1*y(4)*y(3)+ro2*y(4)*y(5)+ mu2*y(4)*y(3);...
    (ro1*y(3)*y(5))*2-ro2*y(4)*y(5)];
%     gamma*y(3)-mu1*y(4)*y(3)+ mu2*y(4)*y(3)-lamda*y(4)+mu1*y(4)*y(3)-mu2*y(4)*y(3)];

tspan = [0:.001:1];
initials = [100 80 60 10 30];
[tspan, yval] = ode45(F, tspan, initials);

%ploting
 
figure(1)
subplot(2,3,1)
plot(tspan,yval(:,1),' b','LineWidth',3)
xlabel('Time ','FontName', 'Times New Roman', 'fontsize', 12)
ylabel('Ppulation', 'FontName', 'Times New Roman', 'fontsize', 12)
% title('Integrity', 'FontName', 'Times New Roman', 'fontsize', 12)
subplot(2,3,2)
% figure(2)
plot(tspan,yval(:,2),'m','LineWidth',3)
xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
ylabel('Moral Education', 'FontName', 'Times New Roman', 'fontsize', 12)
% title('With absorber', 'FontName', 'Times New Roman', 'fontsize', 12)
% subplot(1,3,3)
% plot(tspan,yval(:,3),'b','LineWidth',3)
% xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
% ylabel('Honesty', 'FontName', 'Times New Roman', 'fontsize', 12)
% title('With absorber', 'FontName', 'Times New Roman', 'fontsize', 12)

% figure(2)
subplot(2,3,3)
plot(tspan,yval(:,3),'g','LineWidth',3)
xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
ylabel('Honesty', 'FontName', 'Times New Roman', 'fontsize', 12)
subplot(2,3,4)
% figure(4)
plot(tspan,yval(:,4),'r','LineWidth',3)
xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
ylabel('Corruption', 'FontName', 'Times New Roman', 'fontsize', 12)
% title('Energy production', 'FontName', 'Times New Roman', 'fontsize', 12)
% subplot(1,2,2)
% plot(tspan,yval(:,5),'g','LineWidth',3)
% xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
% ylabel('Internal Energy', 'FontName', 'Times New Roman', 'fontsize', 12)
% title('Internal energy', 'FontName', 'Times New Roman', 'fontsize', 12)
% figure(5)
subplot(2,3,5)
plot(tspan,yval(:,5),'k','LineWidth',3)
xlabel('Time','FontName', 'Times New Roman', 'fontsize', 12)
ylabel('Achivement', 'FontName', 'Times New Roman', 'fontsize', 12)
% figure(3)
% plot3(tspan,yval(:,2),yval(:,1),'c','LineWidth',3)
% grid on
% xlabel('Time (Hours)','FontName', 'Times New Roman', 'fontsize', 12)
% ylabel('Energy', 'FontName', 'Times New Roman', 'fontsize', 12)
% zlabel('Temprature','FontName', 'Times New Roman', 'fontsize', 12)



