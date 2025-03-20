function fractal_dimension = calculate_fractal_dimension(data)
    % 获取数据维度和数据点数
    [data_size, data_dim] = size(data);

    % 确定盒子的尺寸范围
    min_box_size = min(min(data));
    max_box_size = max(max(data));
    box_sizes = logspace(log10(min_box_size), log10(max_box_size), 30);

    % 初始化每个盒子中点的计数
    box_counts = zeros(size(box_sizes));

    % 遍历每个盒子尺寸
    for i = 1:numel(box_sizes)
        box_size = box_sizes(i);
        
        % 在每个维度上计算盒子中点的数量
        num_points_in_box = floor((max(data) - min(data)) ./ box_size) + 1;

        % 初始化盒子中点的位置矩阵
        box_points = zeros(num_points_in_box);

        % 将数据点映射到对应的盒子
        data_indices = ceil((data - min(data)) ./ box_size);
        linear_indices = sub2ind(num_points_in_box, data_indices(:,1), data_indices(:,2));
        box_points(linear_indices) = 1;

        % 统计盒子中点的数量
        box_counts(i) = sum(box_points(:));
    end

    % 计算盒维数
    box_dimension = log(box_counts) ./ log(1./box_sizes);
    fractal_dimension = -diff(box_dimension) ./ diff(log(box_sizes));
    fractal_dimension = mean(fractal_dimension);
end
