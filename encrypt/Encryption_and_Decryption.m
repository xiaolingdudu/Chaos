


function C = Encryption_and_Decryption(P, k, x0)
    % 提取图像的RGB通道
    P_R = P(:,:,1);
    P_G = P(:,:,2);
    P_B = P(:,:,3);
    
    % 图像尺寸
    [M, N] = size(P_R);
    
    % 计算所需的混沌序列长度
    n = 2 * M * N;  % 这是为了生成足够的混沌序列
    
    % 初始化状态变量
    x = zeros(1, n+1);
    y = zeros(1, n+1);
    z = zeros(1, n+1);
    
    % 初始条件
    x(1) = x0(1);
    y(1) = x0(2);
    z(1) = x0(3);
    
    % 系统参数，根据你的提供
    k_param = k; 
    u = 0.9;
    
    % 生成混沌序列
    for i = 1:n
%         t = 0.4 - 6 / (1 + x(i)^2 + y(i)^2);
%         x(i+1) = k_param * sin(z(i)) + u * (x(i) * cos(t) - y(i) * sin(t));
%         y(i+1) = u * (x(i) * sin(t) + y(i) * cos(t));
%         z(i+1) = z(i) + x(i);
        t = 0.4 - 6 / (1 + x(i)^2 + y(i)^2);
        x(i+1) = k_param  + u * (x(i) * cos(t) - y(i) * sin(t));
        y(i+1) = u * (x(i) * sin(t) + y(i) * cos(t));
  
    end
    
    % 将混沌序列映射到[0, 255]范围内用于图像加密
    S = mod(floor(x(2:end) * 10^10), 256);
    a = mod(floor(x(2:end) * 10^10), M*N) + 1;
    b = mod(floor(y(2:end) * 10^10), M*N) + 1;

    % 加密或解密逻辑
    if k == 1  % 加密
        A_R = P_R(:); A_G = P_G(:); A_B = P_B(:); %将图像数据线性化
        for i = 1:M*N  %置乱
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q是变换后的坐标

            % 交换RGB各通道的像素值
            A_R([i, q]) = A_R([q, i]);
            A_G([i, q]) = A_G([q, i]);
            A_B([i, q]) = A_B([q, i]);
        end
        
        % 扩散
        for i = 1:M*N
            if i == 1
                A_R(i) = bitxor(S(1), A_R(i));
                A_G(i) = bitxor(S(1), A_G(i));
                A_B(i) = bitxor(S(1), A_B(i));
            else
                A_R(i) = bitxor(S(i), bitxor(A_R(i), A_R(i-1)));
                A_G(i) = bitxor(S(i), bitxor(A_G(i), A_G(i-1)));
                A_B(i) = bitxor(S(i), bitxor(A_B(i), A_B(i-1)));
            end
        end

        C = cat(3, reshape(A_R, M, N), reshape(A_G, M, N), reshape(A_B, M, N));
    else  % 解密
        % 逆向扩散
        A_R = P_R(:); A_G = P_G(:); A_B = P_B(:);
        for i = M*N:-1:2
            A_R(i) = bitxor(S(i), bitxor(A_R(i), A_R(i-1)));
            A_G(i) = bitxor(S(i), bitxor(A_G(i), A_G(i-1)));
            A_B(i) = bitxor(S(i), bitxor(A_B(i), A_B(i-1)));
        end
        A_R(1) = bitxor(S(1), A_R(1));
        A_G(1) = bitxor(S(1), A_G(1));
        A_B(1) = bitxor(S(1), A_B(1));

        % 逆向置乱
        for i = M*N:-1:1
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q是变换后的坐标
            % 交换回RGB各通道的像素值
            A_R([i, q]) = A_R([q, i]);
            A_G([i, q]) = A_G([q, i]);
            A_B([i, q]) = A_B([q, i]);
        end
        
        C = cat(3, reshape(A_R, M, N), reshape(A_G, M, N), reshape(A_B, M, N));
    end
end
