function [als, control, hunt, park, train_name, train_age, train_height, train_weight, train_gender, train_GS] = load_train_data(trainFolder)
%Load training data
%
%Data is loaded as left and right leg signals for als, control, hunt and
%park while variable train is loaded as:
%
%
%If you are using default project structure use:
%[als, control, hunt, park, train_name, train_age, train_height, train_weight, train_gender, train_GS] = load_train_data('./train/');
    function [data] = load_data(type)
        j = 1;
        for i = 1:20
            try %#ok<TRYNC>
                data(j, :,  :) = importdata(strcat(trainFolder, type, num2str(i), '.tsv'));
                j = j+1;
            end
        end
    end
als = load_data('als');
control = load_data('control');
hunt = load_data('hunt');
park = load_data('park');
fid = fopen(strcat(trainFolder, 'train.txt'));
train = textscan(fid, '%s%d8%f32%d8%[fm]%s', 'headerLines', 1);
train_name = train(1); train_name = train_name{1};
train_age = train(2); train_age = train_age{1};
train_height = train(3); train_height = train_height{1};
train_weight = train(4); train_weight = train_weight{1};
train_gender = train(5); train_gender = train_gender{1};
train_GS = train(6); train_GS = train_GS{1};
fid = fclose(fid);
end

