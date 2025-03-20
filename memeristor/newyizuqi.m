clc
clear all
T=1:10000;
A=0.1;
q(1)=0.5;

w=0.2;

for n=1:length(T)
    

    i(n+1)=A*sin(w*T(n));
    V(n+1)=(sin(q(n)))*A*sin(w*T(n));
    q(n+1)=q(n)+i(n);%压控
end
figure()
% plot((1:200),V(1:200),'r','linewidth',1);
% hold on
% plot((1:200),i(1:200),'k','linewidth',1);
plot(i,V,'r','linewidth',1);

grid on
xlabel('{\itI\rm(\itn\rm)/ A}');
ylabel('{\itV\rm(\itn\rm)/ V}');
set(gca,'linewidth',1,'fontsize',16,'fontname','Times');
hold on

clc
clear all
T=1:10000;
A=0.1;
q(1)=1.5;

w=0.2;

for n=1:length(T)
    

    i(n+1)=A*sin(w*T(n));
    V(n+1)=(sin(q(n)))*A*sin(w*T(n));
    q(n+1)=q(n)+i(n);%压控
end
plot(i,V,'k','linewidth',1);

grid on
xlabel('{\itI\rm(\itn\rm)/ A}');
ylabel('{\itV\rm(\itn\rm)/ V}');
set(gca,'linewidth',1,'fontsize',16,'fontname','Times');
hold on

clc
clear all
T=1:10000;
A=0.1;
q(1)=2.5;

w=0.2;

for n=1:length(T)
    

    i(n+1)=A*sin(w*T(n));
    V(n+1)=(sin(q(n)))*A*sin(w*T(n));
    q(n+1)=q(n)+i(n);%压控
end
plot(i,V,'b','linewidth',1);

grid on
xlabel('{\itI\rm(\itn\rm)/ A}');
ylabel('{\itV\rm(\itn\rm)/ V}');
set(gca,'linewidth',1,'fontsize',16,'fontname','Times');
hold on

