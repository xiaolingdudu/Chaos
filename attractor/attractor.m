clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)-0.9)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
figure()
plot(x(end-20000:end),z(end-20000:end),'k.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;

clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)-1.8)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
plot(x(end-20000:end),z(end-20000:end),'b.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;

clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)-2.7)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
plot(x(end-20000:end),z(end-20000:end),'y.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;



clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)+0.9)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
plot(x(end-20000:end),z(end-20000:end),'m.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;

clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)+1.8)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
plot(x(end-20000:end),z(end-20000:end),'g.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;

clear;clc;
dot=100000;
x(1)=0.1;%初值
y(1)=0.1;
z(1)=0.1;
u=1;
k=1;
for n=1:dot
%  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));

% x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

%  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% z(n+1)=z(n)+y(n);
% % 
 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=(k*sin(z(n)+2.7)*x(n)+u*x(n)*(x(n)*cos(t(n))-y(n)*sin(t(n))))/x(n);
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

% t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
end
plot(x(end-20000:end),z(end-20000:end),'c.');
% plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'g.')
% plot(x,y,'r.');
% plot((1:100000),x(1:100000),'b.')
xlabel('\itx','fontsize',18)
ylabel('\ity','fontsize',18)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
hold on;





% clear;clc;
% dot=100000;
% x(1)=0.1;%初值
% y(1)=0.1;
% z(1)=0.1;
% u=1;
% k=-0.1;
% for n=1:dot
% %  t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% % x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% % y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% 
% % x(n+1)=u*(x(n)*cos(n)-y(n)*sin(n))+k*sin(z(n));
% % y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% % z(n+1)=z(n)+x(n);
% 
% % x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n)+(R1-R2*z(n)));
% % y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% % z(n+1)=z(n)+x(n);
% 
% %  x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n));
% % y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n))+(sin(z(n)));
% % z(n+1)=z(n)+y(n);
% 
%  t(n)=k*sin(z(n))-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
% 
% 
% end
% plot(x(end-20000:end),y(end-20000:end),'r.')
% % plot3(x(end-30000:end),y(end-30000:end),z(end-30000:end),'r.')
% % plot(x,y,'r.');
% % plot((1:100000),x(1:100000),'b.')
% xlabel('\itx','fontsize',18)
% ylabel('\ity','fontsize',18)
% set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
% hold on;
