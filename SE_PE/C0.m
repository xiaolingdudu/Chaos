
% clear all
% 
% % 参数设置
% r = 5;
% k = 1;
% u_range = -1:0.01:1;
% dot = 5000;
% 
% % 初始化用于保存C0复杂度的向量
% c_values = zeros(1, length(u_range));
% 
% % 模拟系统演化并计算C0复杂度
% for i = 1:length(u_range)
%     u = u_range(i);
%     X = simulate_chaotic_system(k, u, dot);
%     c_values(i) = C_zero(r, X);
% end
% 
% % 计算C0复杂度的平均值
% average_c = mean(c_values);
% 
% disp(['C0复杂度的平均值：', num2str(average_c)]);
% 
% % 绘制C0复杂度随参数u的变化图像
% figure;
% plot(u_range, c_values);
% xlabel('Parameter u');
% ylabel('C0 Complexity');
% title('C0 Complexity vs. Parameter u');
% 
% function c = C_zero(r, x1)
%     N = size(x1, 2);
%     X1 = fft(x1);
%     gn = r * sum(abs(X1) .* abs(X1), 2) / N;
%     
%     for i = 1:N
%         if abs(X1(i))^2 > gn
%             X2(i) = X1(i);
%         else
%             X2(i) = 0;
%         end
%     end
%     
%     x2 = ifft(X2);
%     x3 = x1 - x2;
%     c = sum(abs(x3) .* abs(x3)) / sum(abs(x1) .* abs(x1));
% end
% 
% function x = simulate_chaotic_system(k, u, dot)
%     x(1) = 0.1;
%     y(1) = 0.1;
%     z(1) = 0.1;
% 
%     for n = 1:dot
%         t(n) = 0.4 - 6 / (1 + x(n)^2 + y(n)^2);
%         x(n+1) = k+ u * (x(n) * cos(t(n)) - y(n) * sin(t(n)));
%         y(n+1) = u * (x(n) * sin(t(n)) + y(n) * cos(t(n)));
% %         z(n+1) = z(n) + x(n);
%     end
%     
%     x = x; % 使用z序列，您可以根据需要选择其他序列
% end
clear clc;

% 参数设置
r = 5;
k = 100;
u_range = -1:0.01:1;
dot = 5000;

% 初始化用于保存C0复杂度的向量
c_values = zeros(1, length(u_range));

% 模拟系统演化并计算C0复杂度
for i = 1:length(u_range)
    u = u_range(i);
    X = simulate_chaotic_system(k, u, dot);
    c_values(i) = C_zero(r, X);
end

% 找到C0复杂度的最大值及其对应的u值
[max_c, idx_max] = max(c_values);
u_max_c = u_range(idx_max);

disp(['C0复杂度的最大值：', num2str(max_c)]);
disp(['对应的u值：', num2str(u_max_c)]);

% 绘制C0复杂度随参数u的变化图像
figure;
plot(u_range, c_values);
hold on;
scatter(u_max_c, max_c, 'r', 'filled');
xlabel('Parameter u');
ylabel('C0 Complexity');
title('C0 Complexity vs. Parameter u with Max Value');

function c = C_zero(r, x1)
    N = size(x1, 2);
    X1 = fft(x1);
    gn = r * sum(abs(X1) .* abs(X1), 2) / N;
    
    for i = 1:N
        if abs(X1(i))^2 > gn
            X2(i) = X1(i);
        else
            X2(i) = 0;
        end
    end
    
    x2 = ifft(X2);
    x3 = x1 - x2;
    c = sum(abs(x3) .* abs(x3)) / sum(abs(x1) .* abs(x1));
end

function x = simulate_chaotic_system(k, u, dot)
    x(1) = 0.1;
    y(1) = 0.1;
    z(1) = 0.1;

    for n = 1:dot
        t(n) = 0.4 - 6 / (1 + x(n)^2 + y(n)^2);
        x(n+1) = k*sin(z(n)) + u * (x(n) * cos(t(n)) - y(n) * sin(t(n)));
        y(n+1) = u * (x(n) * sin(t(n)) + y(n) * cos(t(n)));
        z(n+1) = z(n) + x(n);
    end
    
    x = x; % 使用z序列，您可以根据需要选择其他序列
end


% clear all
% 
% % 参数设置
% r = 5;
% k = 100;
% u_range = -1:0.01:1;
% dot = 5000;
% 
% % 初始化用于保存C0复杂度的向量
% c_values = zeros(1, length(u_range));
% 
% % 模拟系统演化并计算C0复杂度
% for i = 1:length(u_range)
%     u = u_range(i);
%     X = simulate_chaotic_system(k, u, dot);
%     c_values(i) = C_zero(r, X);
% end
% 
% % 找到C0复杂度的最大值及其对应的u值
% [max_c, idx_max] = max(c_values);
% u_max_c = u_range(idx_max);
% 
% disp(['C0复杂度的最大值：', num2str(max_c)]);
% disp(['对应的u值：', num2str(u_max_c)]);
% 
% % 绘制C0复杂度随参数u的变化图像
% figure;
% plot(u_range, c_values);
% hold on;
% scatter(u_max_c, max_c, 'r', 'filled');
% xlabel('Parameter u');
% ylabel('C0 Complexity');
% title('C0 Complexity vs. Parameter u with Max Value');
% 
% function c = C_zero(r, x1)
%     N = size(x1, 2);
%     X1 = fft(x1);
%     gn = r * sum(abs(X1) .* abs(X1), 2) / N;
%     
%     for i = 1:N
%         if abs(X1(i))^2 > gn
%             X2(i) = X1(i);
%         else
%             X2(i) = 0;
%         end
%     end
%     
%     x2 = ifft(X2);
%     x3 = x1 - x2;
%     c = sum(abs(x3) .* abs(x3)) / sum(abs(x1) .* abs(x1));
% end
% 
% function x = simulate_chaotic_system(k, u, dot)
%     x(1) = 0.1;
%     y(1) = 0.1;
%     z(1) = 0.1;
% 
%     for n = 1:dot
%         t(n) = 0.4 - 6 / (1 + x(n)^2 + y(n)^2);
%         x(n+1) = k + u * (x(n) * cos(t(n)) - y(n) * sin(t(n)));
%         y(n+1) = u * (x(n) * sin(t(n)) + y(n) * cos(t(n)));
%     end
%     
%     x = x; 
% end
