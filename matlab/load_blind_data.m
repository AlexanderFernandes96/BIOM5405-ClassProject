function [blind] = load_blind_data(trainFolder)
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
blind = load_data('blind');
end

