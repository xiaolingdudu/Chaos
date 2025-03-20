clear;clc;
L=100;
C=linspace(-1,1,L);%横坐标区间
C1=linspace(-1,1,L);%纵坐标区间
SE=zeros(L,L);
dot=50000;
for k1=1:L
    u=C1(k1);%纵坐标
for k2=1:L
    k=C(k2); %横坐标
x(1)=0.1;
y(1)=0.1;
z(1)=0.1;

    for n=1:dot        

 t(n)=0.4-6/(1+x(n)^2+y(n)^2);
x(n+1)=k*sin(z(n))+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
z(n+1)=z(n)+x(n);

       
    end
    SE(k1, k2)=SEShannon(x(10000:end));
    clear x y 
end
disp(k1)
end
figure
colormap(flipud(hot));
contourf(C,C1,SE, 'LineStyle','none');
xlabel('\ita')
ylabel('\itb')
set(gca,'FontName','Times New Roman','box','on','linewidth',1,'fontsize',16);

toc

% % tic
% % clc
% % clear
% L=100;
% C=linspace(-1,1,L);%横坐标区间
% C1=linspace(-10,10,L);%纵坐标区间
% SE=zeros(L,L);
% % c=0.56;u=0.8;m=0.99;d=-0.8;r=0.05;%参数
% dot=50000;
% for k1=1:L
%     k=C1(k1);%纵坐标
% for k2=1:L
%     u=C(k2); %横坐标
% x(1)=0.1;
% y(1)=0.1;
% z(1)=0.1;
% for n=1:dot        
% 
% %   x(n+1)=f*(d*(2*y(n)-1)^2*x(n)+u*sin(pi*x(n))+m*cos(z(n))*x(n));
% %     y(n+1)=y(n)+x(n);%基于忆阻的混沌映射
% %     z(n+1)=x(n)+z(n);
% %     t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% x(n+1)=k*sin(z(n))+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% z(n+1)=z(n)+x(n);
% % t(n)=0.4-6/(1+x(n)^2+y(n)^2);
% % x(n+1)=k+u*(x(n)*cos(t(n))-y(n)*sin(t(n)));
% % y(n+1)=u*(x(n)*sin(t(n))+y(n)*cos(t(n)));
% % z(n+1)=z(n)+x(n);
%     end
%     SE(k1,k2)=SEShannon(x(10000:end));
%     clear x y z
% end
% disp(k1)
% end
% figure
% colormap(flipud(hot));
% contourf(C,C1,SE,'LineStyle','none');
% xlabel('\itu')
% ylabel('\itk')
% set(gca,'FontName','Times New Roman','box','on','linewidth',1,'fontsize',16);
% toc

% clear; clc;
% L = 100;
% C = linspace(-1,1,L); % 横坐标区间
% C1 = linspace(-1,1,L); % 纵坐标区间
% SE = zeros(L,L);
% dot = 50000;
% u = 1; % 设置 u 的值
% k = 1; % 设置 k 的值
% x0_values = linspace(-2, 2, L); % x0 的范围
% y0_values = linspace(-2, 2, L); % y0 的范围
% 
% for k1 = 1:L
%     x0 = x0_values(k1); % x0 取范围内的值
%     for k2 = 1:L
%         y0 = y0_values(k2); % y0 取范围内的值
%         x(1) = x0;
%         y(1) = y0;
%         z(1) = 0.1;
%         for n = 1:dot
%             t(n) = 0.4 - 6/(1 + x(n)^2 + y(n)^2);
%             x(n+1) = k*sin(z(n)) + u*(x(n)*cos(t(n)) - y(n)*sin(t(n)));
%             y(n+1) = u*(x(n)*sin(t(n)) + y(n)*cos(t(n)));
%             z(n+1) = z(n) + x(n);
%         end
%         SE(k1, k2) = SEShannon(x(10000:end));
%         clear x y
%     end
%     disp(k1)
% end
% figure
% colormap(parula);
% contourf(C, C1, SE, 'LineStyle', 'none');
% xlabel('\itx_0')
% ylabel('\ity_0')
% set(gca,'FontName','Times New Roman','box','on','linewidth',1,'fontsize',16);
