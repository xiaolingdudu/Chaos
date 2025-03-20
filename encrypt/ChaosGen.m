   clear all;clc
   P=imread('lena.jpg'); %加载原始图片
    P_R=P(:,:,1);P_G=P(:,:,2);P_B=P(:,:,3);%RGB三个通道的数据
    [M,N]=size(P_R);  %计算图片P尺寸大小
    
   x0 = 0.1;
   y0 = 0.1;
   z0 = 0;
    n=2*M*N;      %计算所需要的序列长度
    h=0.01;
    T=20000;
    [t,yy]=ode45(@SystemEqu,[0:h:T],[x0 y0 z0]);
s=yy(2001:2000+n,1);
    plot(t(2001:2000+n),s);
    plot3(yy(1001:1000+n,1),yy(1001:1000+n,2),yy(1001:1000+n,3));
    
    
    S_min = min(s);
    S = mod((s+abs(S_min))*10^7,256);
    plot(t(2001:2000+n),S);
    num = length(S);
    fid=fopen('D:\Users\HUI\Desktop\paper\多涡卷共存系统\多涡卷共存混沌系统\混沌加密方案\outdata.txt','w+');%输出
    for k = 1:1:num
        BCS = dec2bin(S(k));
        fprintf(fid,'%s',BCS);%fprintf按列输出dataOut的元素，所以需要将其转置
    end
    fclose('all');