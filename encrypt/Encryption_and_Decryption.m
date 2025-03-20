


function C = Encryption_and_Decryption(P, k, x0)
    % ��ȡͼ���RGBͨ��
    P_R = P(:,:,1);
    P_G = P(:,:,2);
    P_B = P(:,:,3);
    
    % ͼ��ߴ�
    [M, N] = size(P_R);
    
    % ��������Ļ������г���
    n = 2 * M * N;  % ����Ϊ�������㹻�Ļ�������
    
    % ��ʼ��״̬����
    x = zeros(1, n+1);
    y = zeros(1, n+1);
    z = zeros(1, n+1);
    
    % ��ʼ����
    x(1) = x0(1);
    y(1) = x0(2);
    z(1) = x0(3);
    
    % ϵͳ��������������ṩ
    k_param = k; 
    u = 0.9;
    
    % ���ɻ�������
    for i = 1:n
%         t = 0.4 - 6 / (1 + x(i)^2 + y(i)^2);
%         x(i+1) = k_param * sin(z(i)) + u * (x(i) * cos(t) - y(i) * sin(t));
%         y(i+1) = u * (x(i) * sin(t) + y(i) * cos(t));
%         z(i+1) = z(i) + x(i);
        t = 0.4 - 6 / (1 + x(i)^2 + y(i)^2);
        x(i+1) = k_param  + u * (x(i) * cos(t) - y(i) * sin(t));
        y(i+1) = u * (x(i) * sin(t) + y(i) * cos(t));
  
    end
    
    % ����������ӳ�䵽[0, 255]��Χ������ͼ�����
    S = mod(floor(x(2:end) * 10^10), 256);
    a = mod(floor(x(2:end) * 10^10), M*N) + 1;
    b = mod(floor(y(2:end) * 10^10), M*N) + 1;

    % ���ܻ�����߼�
    if k == 1  % ����
        A_R = P_R(:); A_G = P_G(:); A_B = P_B(:); %��ͼ���������Ի�
        for i = 1:M*N  %����
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q�Ǳ任�������

            % ����RGB��ͨ��������ֵ
            A_R([i, q]) = A_R([q, i]);
            A_G([i, q]) = A_G([q, i]);
            A_B([i, q]) = A_B([q, i]);
        end
        
        % ��ɢ
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
    else  % ����
        % ������ɢ
        A_R = P_R(:); A_G = P_G(:); A_B = P_B(:);
        for i = M*N:-1:2
            A_R(i) = bitxor(S(i), bitxor(A_R(i), A_R(i-1)));
            A_G(i) = bitxor(S(i), bitxor(A_G(i), A_G(i-1)));
            A_B(i) = bitxor(S(i), bitxor(A_B(i), A_B(i-1)));
        end
        A_R(1) = bitxor(S(1), A_R(1));
        A_G(1) = bitxor(S(1), A_G(1));
        A_B(1) = bitxor(S(1), A_B(1));

        % ��������
        for i = M*N:-1:1
            q = mod(b(i)*i + a(i)*i, M*N) + 1;  % q�Ǳ任�������
            % ������RGB��ͨ��������ֵ
            A_R([i, q]) = A_R([q, i]);
            A_G([i, q]) = A_G([q, i]);
            A_B([i, q]) = A_B([q, i]);
        end
        
        C = cat(3, reshape(A_R, M, N), reshape(A_G, M, N), reshape(A_B, M, N));
    end
end
