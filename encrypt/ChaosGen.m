   clear all;clc
   P=imread('lena.jpg'); %����ԭʼͼƬ
    P_R=P(:,:,1);P_G=P(:,:,2);P_B=P(:,:,3);%RGB����ͨ��������
    [M,N]=size(P_R);  %����ͼƬP�ߴ��С
    
   x0 = 0.1;
   y0 = 0.1;
   z0 = 0;
    n=2*M*N;      %��������Ҫ�����г���
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
    fid=fopen('D:\Users\HUI\Desktop\paper\���о���ϵͳ\���о������ϵͳ\������ܷ���\outdata.txt','w+');%���
    for k = 1:1:num
        BCS = dec2bin(S(k));
        fprintf(fid,'%s',BCS);%fprintf�������dataOut��Ԫ�أ�������Ҫ����ת��
    end
    fclose('all');