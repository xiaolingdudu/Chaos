 clc
clear all
Q=eye(3);
dot=50000;
k0=-10:0.1:10;
u=0.2;
for k1=1:length(k0)
   k=k0(k1);%分叉参数
   x(1)=0.1;
   y(1)=0.1;
   z(1)=0.1;
for n=1:dot
% x(n+1)=k+u*(x(n)*cos(n)-y(n)*sin(n))*(R1-R2*z(n));
% y(n+1)=u*(x(n)*sin(n)+y(n)*cos(n));
% z(n+1)=z(n)+x(n);

% t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% % 
t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=k*sin(z(n))+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

        Xx=u*cos(t(n)) - (2*u*x(n)*x(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2;
        Xy=-u*sin(t(n)) - (2*u*x(n)*y(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2;
        xz=k*cos(z(n));
        Yx=u*sin(t(n)) + (2*u*x(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2;
        Yy=u*cos(t(n)) - (2*u*y(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2;
        yz=0;
        zx=1;
        zy=0;
        zz=1;
% J = [u*cos(t(n)) - (2*u*x(n)*x(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2,     -u*sin(t(n)) - (2*u*x(n)*y(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2,     k*cos(z(n));
%      u*sin(t(n)) + (2*u*x(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2,      u*cos(t(n)) - (2*u*y(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2,      0;
%      1,                                                                0,                                                                1];

        J=[Xx Xy xz ;Yx Yy yz ;zx zy zz;];
        B=J*Q;
  

        [Q,R]=qr(B);
        L1(n+1)=log(abs(R(1,1)));
        L2(n+1)=log(abs(R(2,2)));
        L3(n+1)=log(abs(R(3,3)));


%         Xx=u*(cos(t(n)) + (6*x(n)^2*sin(t(n)))/(1+x(n)^2+y(n)^2)^2);
%         Xy=-u*(sin(t(n)) - (6*x(n)*y(n)*sin(t(n)))/(1+x(n)^2+y(n)^2)^2);
%         Yx=u*(sin(t(n)) + (6*x(n)*y(n)*cos(t(n)))/(1+x(n)^2+y(n)^2)^2);
%         Yy=u*(cos(t(n)) - (6*y(n)^2*sin(t(n)))/(1+x(n)^2+y(n)^2)^2);

%         Xx=u*cos(t(n)) - (2*u*x(n)*x(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2;
%         Xy=-u*sin(t(n)) - (2*u*x(n)*y(n)*x(n))/(1 + x(n)^2 + y(n)^2)^2;
%         Yx=u*sin(t(n)) + (2*u*x(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2;
%         Yy=u*cos(t(n)) - (2*u*y(n)*y(n)*y(n))/(1 + x(n)^2 + y(n)^2)^2;
%         J=[Xx Xy;Yx Yy ];
%         B=J*Q;
%         [Q,R]=qr(B);
%         L1(n+1)=log(abs(R(1,1)));
%         L2(n+1)=log(abs(R(2,2)));
end
    B1(k1,:)=z(end-10000:end);
    
    L11(k1)=sum(L1(1000:end))/30000;
    L22(k1)=sum(L2(1000:end))/30000;
    L33(k1)=sum(L3(1000:end))/30000; 
end

figure%分岔图
plot(k0,B1,'b.','Markersize',4)
% xlim([0.2 1.25])
% ylim([-1.5 2.5])
xlabel('\itk','fontsize',16)
ylabel('\itX','fontsize',16)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);

figure%李指图
plot(k0,L11,'r','linewidth',2);
grid on
hold on
plot(k0,L22,'b','linewidth',2);
hold on
plot(k0,L33,'y','linewidth',2);
xlabel('\itk','fontsize',16)
ylabel('LEs','fontsize',16)
legend('\lambda_1','\lambda_2','fontsize',16)
set(gca,'FontName','Times New Roman','linewidth',1,'fontsize',16);
