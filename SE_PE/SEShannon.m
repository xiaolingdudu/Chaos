function SE=SEShannon(x)%不需要修改这个程序
%函数名称：SEShannon
%函数功能：计算序列的谱熵复杂度
%输入参数x；x为混沌序列
%输出参数： SE；SE为输出的混沌序列复杂度
N=length(x);
flag=0;
x=x-mean(x);
for i=1:N
    if x(i)~=0
        flag=1;
    end
end
if flag==0
    SE=0;
    return;
end
Y=fft(x);
% if Y(1)==0
%     Y(1)=1e-30;
% end
Xk=(abs(Y).^2)./N;
Xk=Xk(1:(floor(N/2)));
ptot=sum(Xk);
PK=Xk./ptot;
P=0;
for i=1:N/2
    if PK(i)~=0
        P=P-PK(i)*log(PK(i));
    end
end
se2=sum(P);
SE=se2/log(N/2);
end

