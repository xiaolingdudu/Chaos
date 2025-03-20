
% 生成ASCII '0'和'1'的混沌序列并保存到文件
uValue = 1;
kValue = 1;
iterationsValue = 500000;
filename = 'chaos_sequence3.pi';
saveASCIIBinarySequenceToFile(uValue, kValue, iterationsValue, filename);
fprintf('ASCII 二进制序列已保存至 %s\n', filename);



% 生成ASCII '0'和'1'的混沌序列并保存到文件
uValue = 1;
kValue = 1;
iterationsValue = 1300000; % 更新迭代次数以确保至少1,000,000位输出
filename = 'chaos_sequence3.pi';
saveASCIIBinarySequenceToFile(uValue, kValue, iterationsValue, filename);
fprintf('ASCII 二进制序列已保存至 %s\n', filename);

function saveASCIIBinarySequenceToFile(u, k, iterations, filename)
    x = 0.1;
    y = 0.1;
    z = 0.1;
    
    binarySequence = char(zeros(iterations, 8));  % 仍然保留每次迭代生成8位

    for i = 1:iterations
        % 计算 t(n)
        tn = 0.4 - 6 / (1 + x^2 + y^2);
        
        % 更新 x(n+1), y(n+1), z(n+1)
        xn_next = k * sin(z) + u * (x * cos(tn) - y * sin(tn));
        yn_next = u * (x * sin(tn) + y * cos(tn));
        zn_next = z + x;

        % 将 y(n) 转换为ASCII '0'和'1'，只选择最低的8位
        binaryY = dec2bin(typecast(single(yn_next), 'uint32'), 32);
        binarySequence(i, :) = binaryY(end-7:end);  % 只保存最低8位

        % 更新 x(n), y(n), z(n)
        x = xn_next;
        y = yn_next; 
        z = zn_next; 
    end
    
    % 将ASCII二进制序列保存到文件
    fid = fopen(filename, 'w');
    fwrite(fid, binarySequence', 'char');
    fclose(fid);
end


