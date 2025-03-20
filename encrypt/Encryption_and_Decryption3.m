function C = Encryption_and_Decryption3(P, k, x0)
    % 图像尺寸
    [M, N] = size(P);
    
    % 计算所需的混沌序列长度
    n = 2 * M * N;  % 为生成足够的混沌序列
    
    % 初始化状态变量
    x = zeros(1, n+1);
    y = zeros(1, n+1);
   
    
    % 初始条件
    x(1) = x0(1);
    y(1) = x0(2);
    
    
    % 系统参数，根据你的提供
    k_param = 1; 
    u = 0.9;
    
    % 生成混沌序列
    for i = 1:n
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
        A = P(:); % 将图像数据线性化
        for i = 1:M*N  % 置乱
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q是变换后的坐标

            % 交换像素值
            A([i, q]) = A([q, i]);
        end
        
        % 扩散
        for i = 1:M*N
            if i == 1
                A(i) = bitxor(S(1), A(i));
            else
                A(i) = bitxor(S(i), bitxor(A(i), A(i-1)));
            end
        end

        C = reshape(A, M, N);
    else  % 解密
        % 逆向扩散
        A = P(:);
        for i = M*N:-1:2
            A(i) = bitxor(S(i), bitxor(A(i), A(i-1)));
        end
        A(1) = bitxor(S(1), A(1));

        % 逆向置乱
        for i = M*N:-1:1
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q是变换后的坐标
            % 交换回像素值
            A([i, q]) = A([q, i]);
        end
        
        C = reshape(A, M, N);
    end
end
