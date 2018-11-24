%rms value of all trials normalized and filtered
rms_1 = zeros(1,length(control(:,1,1)));
rms_2 = zeros(1,length(hunt(:,1,1)));
rms_3 = zeros(1,length(park(:,1,1)));
rms_4 = zeros(1,length(als(:,1,1)));
rms_5 = zeros(1,length(control(:,1,1)));
rms_6 = zeros(1,length(hunt(:,1,1)));
rms_7 = zeros(1,length(park(:,1,1)));
rms_8 = zeros(1,length(als(:,1,1)));
%foot one rms
for i = 1: length(control(:,1,1))
    rms_1(i) = rms((medfilt1(control(i,:,1))-min(medfilt1(control(i,:,1))))/((max(medfilt1(control(i,:,1)))-min(medfilt1(control(i,:,1))))));
end
for i = 1: length(hunt(:,1,1))
    rms_2(i) = rms((medfilt1(hunt(i,:,2))-min(medfilt1(hunt(i,:,2))))/((max(medfilt1(hunt(i,:,2)))-min(medfilt1(hunt(i,:,2))))));
end
for i = 1: length(park(:,1,1))
    rms_3(i) = rms((medfilt1(park(i,:,2))-min(medfilt1(park(i,:,2))))/((max(medfilt1(park(i,:,2)))-min(medfilt1(park(i,:,2))))));
end
for i = 1: length(medfilt1(als(:,1,1)))
    rms_4(i) = rms((medfilt1(als(i,:,2))-min(medfilt1(als(i,:,2))))/((max(medfilt1(als(i,:,2)))-min(medfilt1(als(i,:,2))))));
end 
rms1 = [rms_1,rms_2,rms_3,rms_4];

%foot 2 rms
for i = 1: length(control(:,1,1))
    rms_5(i) = rms((medfilt1(control(i,:,2))-min(medfilt1(control(i,:,2))))/((max(medfilt1(control(i,:,2)))-min(medfilt1(control(i,:,2))))));
end
for i = 1: length(hunt(:,1,1))
    rms_6(i) = rms((medfilt1(hunt(i,:,2))-min(medfilt1(hunt(i,:,2))))/((max(medfilt1(hunt(i,:,2)))-min(medfilt1(hunt(i,:,2))))));
end
for i = 1: length(park(:,1,1))
    rms_7(i) = rms((medfilt1(park(i,:,2))-min(medfilt1(park(i,:,2))))/((max(medfilt1(park(i,:,2)))-min(medfilt1(park(i,:,2))))));
end
for i = 1: length(als(:,1,1))
    rms_8(i) = rms((medfilt1(als(i,:,2))-min(medfilt1(als(i,:,2))))/((max(medfilt1(als(i,:,2)))-min(medfilt1(als(i,:,2))))));
end 
rms2 = [rms_5,rms_6,rms_7,rms_8]