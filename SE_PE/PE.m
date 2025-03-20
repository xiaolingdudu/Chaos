clear; clc;

dot = 10000;
x(1) = 0.1; % 初值
y(1) = 0.1;
z(1) = 0.1;
u = 1;
k = 1;


for n = 1:dot
    t(n) = 0.4 - 6 / (1 + x(n)^2 + y(n)^2);
    x(n + 1) = k *sin(z(n)) + u * (x(n) * cos(t(n)) - y(n) * sin(t(n)));
    y(n + 1) = u * (x(n) * sin(t(n)) + y(n) * cos(t(n)));
    z(n + 1) = z(n) + x(n);
end



% 使用排列熵算法计算 x 序列的排列熵
M = 2;  % 嵌入维数
T = 1;  % 延迟时间
[pe, hist] = PermutationEntropy(x, M, T);

disp(['Permutation Entropy (PE) for the generated x sequence: ' num2str(pe)]);
% 排列熵算法
function [pe, hist] = PermutationEntropy(y, m, t)
    ly = length(y);
    permlist = perms(1:m);
    [h, ~] = size(permlist);
    c(1:length(permlist)) = 0;

    for j = 1:ly - t * (m - 1)
        [~, iv] = sort(y(j:t:j + t * (m - 1)));
        for jj = 1:h
            if isequal(permlist(jj, :), iv)
                c(jj) = c(jj) + 1;
            end
        end
    end

    hist = c;
    c = c(c ~= 0);
    p = c / sum(c);
    pe = -sum(p .* log(p));
    pe = pe / log(factorial(m));  % 归一化
end