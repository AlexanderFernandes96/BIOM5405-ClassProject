% Add this script to path from project directory and place all folders and
% files to add to path for MATLAB
clear all; clc;

addpath ./matlab/ ./train/
%load data
[als, control, hunt, park, train_name, train_age, train_height, train_weight, train_gender, train_GS] = load_train_data('./train/');
%foot 1 normalized and filtered
%naming - 'class'+'foot#'+'subject'
cntl11 = (medfilt1(control(1,:,1))-min(medfilt1(control(1,:,1))))/((max(medfilt1(control(1,:,1)))-min(medfilt1(control(1,:,1)))));
cntl12 = (medfilt1(control(2,:,1))-min(medfilt1(control(2,:,1))))/((max(medfilt1(control(2,:,1)))-min(medfilt1(control(2,:,1)))));
cntl13 = (medfilt1(control(3,:,1))-min(medfilt1(control(3,:,1))))/((max(medfilt1(control(3,:,1)))-min(medfilt1(control(3,:,1)))));
cntl14 = (medfilt1(control(4,:,1))-min(medfilt1(control(4,:,1))))/((max(medfilt1(control(4,:,1)))-min(medfilt1(control(4,:,1)))));
cntl15 = (medfilt1(control(5,:,1))-min(medfilt1(control(5,:,1))))/((max(medfilt1(control(5,:,1)))-min(medfilt1(control(5,:,1)))));
cntl16 = (medfilt1(control(6,:,1))-min(medfilt1(control(6,:,1))))/((max(medfilt1(control(6,:,1)))-min(medfilt1(control(6,:,1)))));
cntl17 = (medfilt1(control(7,:,1))-min(medfilt1(control(7,:,1))))/((max(medfilt1(control(7,:,1)))-min(medfilt1(control(7,:,1)))));
cntl18 = (medfilt1(control(8,:,1))-min(medfilt1(control(8,:,1))))/((max(medfilt1(control(8,:,1)))-min(medfilt1(control(8,:,1)))));
cntl114 = (medfilt1(control(9,:,1))-min(medfilt1(control(9,:,1))))/((max(medfilt1(control(9,:,1)))-min(medfilt1(control(9,:,1)))));
cntl115 = (medfilt1(control(10,:,1))-min(medfilt1(control(10,:,1))))/((max(medfilt1(control(10,:,1)))-min(medfilt1(control(10,:,1)))));
cntl116 = (medfilt1(control(11,:,1))-min(medfilt1(control(11,:,1))))/((max(medfilt1(control(11,:,1)))-min(medfilt1(control(11,:,1)))));

hunt11 = (medfilt1(hunt(1,:,1))-min(medfilt1(hunt(1,:,1))))/((max(medfilt1(hunt(1,:,1)))-min(medfilt1(hunt(1,:,1)))));
hunt12 = (medfilt1(hunt(2,:,1))-min(medfilt1(hunt(2,:,1))))/((max(medfilt1(hunt(2,:,1)))-min(medfilt1(hunt(2,:,1)))));
hunt13 = (medfilt1(hunt(3,:,1))-min(medfilt1(hunt(3,:,1))))/((max(medfilt1(hunt(3,:,1)))-min(medfilt1(hunt(3,:,1)))));
hunt14 = (medfilt1(hunt(4,:,1))-min(medfilt1(hunt(4,:,1))))/((max(medfilt1(hunt(4,:,1)))-min(medfilt1(hunt(4,:,1)))));
hunt15 = (medfilt1(hunt(5,:,1))-min(medfilt1(hunt(5,:,1))))/((max(medfilt1(hunt(5,:,1)))-min(medfilt1(hunt(5,:,1)))));
hunt16 = (medfilt1(hunt(6,:,1))-min(medfilt1(hunt(6,:,1))))/((max(medfilt1(hunt(6,:,1)))-min(medfilt1(hunt(6,:,1)))));
hunt17 = (medfilt1(hunt(7,:,1))-min(medfilt1(hunt(7,:,1))))/((max(medfilt1(hunt(7,:,1)))-min(medfilt1(hunt(7,:,1)))));
hunt18 = (medfilt1(hunt(8,:,1))-min(medfilt1(hunt(8,:,1))))/((max(medfilt1(hunt(8,:,1)))-min(medfilt1(hunt(8,:,1)))));
hunt114 = (medfilt1(hunt(9,:,1))-min(medfilt1(hunt(9,:,1))))/((max(medfilt1(hunt(9,:,1)))-min(medfilt1(hunt(9,:,1)))));
hunt115 = (medfilt1(hunt(10,:,1))-min(medfilt1(hunt(10,:,1))))/((max(medfilt1(hunt(10,:,1)))-min(medfilt1(hunt(10,:,1)))));
hunt116 = (medfilt1(hunt(11,:,1))-min(medfilt1(hunt(11,:,1))))/((max(medfilt1(hunt(11,:,1)))-min(medfilt1(hunt(11,:,1)))));
hunt117 = (medfilt1(hunt(12,:,1))-min(medfilt1(hunt(12,:,1))))/((max(medfilt1(hunt(12,:,1)))-min(medfilt1(hunt(12,:,1)))));
hunt118 = (medfilt1(hunt(13,:,1))-min(medfilt1(hunt(13,:,1))))/((max(medfilt1(hunt(13,:,1)))-min(medfilt1(hunt(13,:,1)))));
hunt119 = (medfilt1(hunt(14,:,1))-min(medfilt1(hunt(14,:,1))))/((max(medfilt1(hunt(14,:,1)))-min(medfilt1(hunt(14,:,1)))));
hunt120 = (medfilt1(hunt(15,:,1))-min(medfilt1(hunt(15,:,1))))/((max(medfilt1(hunt(15,:,1)))-min(medfilt1(hunt(15,:,1)))));

park11 = (medfilt1(park(1,:,1))-min(medfilt1(park(1,:,1))))/((max(medfilt1(park(1,:,1)))-min(medfilt1(park(1,:,1)))));
park12 = (medfilt1(park(2,:,1))-min(medfilt1(park(2,:,1))))/((max(medfilt1(park(2,:,1)))-min(medfilt1(park(2,:,1)))));
park13 = (medfilt1(park(3,:,1))-min(medfilt1(park(3,:,1))))/((max(medfilt1(park(3,:,1)))-min(medfilt1(park(3,:,1)))));
park14 = (medfilt1(park(4,:,1))-min(medfilt1(park(4,:,1))))/((max(medfilt1(park(4,:,1)))-min(medfilt1(park(4,:,1)))));
park15 = (medfilt1(park(5,:,1))-min(medfilt1(park(5,:,1))))/((max(medfilt1(park(5,:,1)))-min(medfilt1(park(5,:,1)))));
park16 = (medfilt1(park(6,:,1))-min(medfilt1(park(6,:,1))))/((max(medfilt1(park(6,:,1)))-min(medfilt1(park(6,:,1)))));
park17 = (medfilt1(park(7,:,1))-min(medfilt1(park(7,:,1))))/((max(medfilt1(park(7,:,1)))-min(medfilt1(park(7,:,1)))));
park18 = (medfilt1(park(8,:,1))-min(medfilt1(park(8,:,1))))/((max(medfilt1(park(8,:,1)))-min(medfilt1(park(8,:,1)))));
park114 = (medfilt1(park(9,:,1))-min(medfilt1(park(9,:,1))))/((max(medfilt1(park(9,:,1)))-min(medfilt1(park(9,:,1)))));
park115 = (medfilt1(park(10,:,1))-min(medfilt1(park(10,:,1))))/((max(medfilt1(park(10,:,1)))-min(medfilt1(park(10,:,1)))));

als11 = (medfilt1(als(1,:,1))-min(medfilt1(als(1,:,1))))/((max(medfilt1(als(1,:,1)))-min(medfilt1(als(1,:,1)))));
als12 = (medfilt1(als(2,:,1))-min(medfilt1(als(2,:,1))))/((max(medfilt1(als(2,:,1)))-min(medfilt1(als(2,:,1)))));
als13 = (medfilt1(als(3,:,1))-min(medfilt1(als(3,:,1))))/((max(medfilt1(als(3,:,1)))-min(medfilt1(als(3,:,1)))));
als14 = (medfilt1(als(4,:,1))-min(medfilt1(als(4,:,1))))/((max(medfilt1(als(4,:,1)))-min(medfilt1(als(4,:,1)))));
als15 = (medfilt1(als(5,:,1))-min(medfilt1(als(5,:,1))))/((max(medfilt1(als(5,:,1)))-min(medfilt1(als(5,:,1)))));
als16 = (medfilt1(als(6,:,1))-min(medfilt1(als(6,:,1))))/((max(medfilt1(als(6,:,1)))-min(medfilt1(als(6,:,1)))));
als17 = (medfilt1(als(7,:,1))-min(medfilt1(als(7,:,1))))/((max(medfilt1(als(7,:,1)))-min(medfilt1(als(7,:,1)))));
als18 = (medfilt1(als(8,:,1))-min(medfilt1(als(8,:,1))))/((max(medfilt1(als(8,:,1)))-min(medfilt1(als(8,:,1)))));

%foot 1 normalized and filtered
%naming - 'class'+'foot#'+'subject'

cntl21 = (medfilt1(control(1,:,2))-min(medfilt1(control(1,:,2))))/((max(medfilt1(control(1,:,2)))-min(medfilt1(control(1,:,2)))));
cntl22 = (medfilt1(control(2,:,2))-min(medfilt1(control(2,:,2))))/((max(medfilt1(control(2,:,2)))-min(medfilt1(control(2,:,2)))));
cntl23 = (medfilt1(control(3,:,2))-min(medfilt1(control(3,:,2))))/((max(medfilt1(control(3,:,2)))-min(medfilt1(control(3,:,2)))));
cntl24 = (medfilt1(control(4,:,2))-min(medfilt1(control(4,:,2))))/((max(medfilt1(control(4,:,2)))-min(medfilt1(control(4,:,2)))));
cntl25 = (medfilt1(control(5,:,2))-min(medfilt1(control(5,:,2))))/((max(medfilt1(control(5,:,2)))-min(medfilt1(control(5,:,2)))));
cntl26 = (medfilt1(control(6,:,2))-min(medfilt1(control(6,:,2))))/((max(medfilt1(control(6,:,2)))-min(medfilt1(control(6,:,2)))));
cntl27 = (medfilt1(control(7,:,2))-min(medfilt1(control(7,:,2))))/((max(medfilt1(control(7,:,2)))-min(medfilt1(control(7,:,2)))));
cntl28 = (medfilt1(control(8,:,2))-min(medfilt1(control(8,:,2))))/((max(medfilt1(control(8,:,2)))-min(medfilt1(control(8,:,2)))));
cntl214 = (medfilt1(control(9,:,2))-min(medfilt1(control(9,:,2))))/((max(medfilt1(control(9,:,2)))-min(medfilt1(control(9,:,2)))));
cntl215 = (medfilt1(control(10,:,2))-min(medfilt1(control(10,:,2))))/((max(medfilt1(control(10,:,2)))-min(medfilt1(control(10,:,2)))));
cntl216 = (medfilt1(control(11,:,2))-min(medfilt1(control(11,:,2))))/((max(medfilt1(control(11,:,2)))-min(medfilt1(control(11,:,2)))));

hunt21 = (medfilt1(hunt(1,:,2))-min(medfilt1(hunt(1,:,2))))/((max(medfilt1(hunt(1,:,2)))-min(medfilt1(hunt(1,:,2)))));
hunt22 = (medfilt1(hunt(2,:,2))-min(medfilt1(hunt(2,:,2))))/((max(medfilt1(hunt(2,:,2)))-min(medfilt1(hunt(2,:,2)))));
hunt23 = (medfilt1(hunt(3,:,2))-min(medfilt1(hunt(3,:,2))))/((max(medfilt1(hunt(3,:,2)))-min(medfilt1(hunt(3,:,2)))));
hunt24 = (medfilt1(hunt(4,:,2))-min(medfilt1(hunt(4,:,2))))/((max(medfilt1(hunt(4,:,2)))-min(medfilt1(hunt(4,:,2)))));
hunt25 = (medfilt1(hunt(5,:,2))-min(medfilt1(hunt(5,:,2))))/((max(medfilt1(hunt(5,:,2)))-min(medfilt1(hunt(5,:,2)))));
hunt26 = (medfilt1(hunt(6,:,2))-min(medfilt1(hunt(6,:,2))))/((max(medfilt1(hunt(6,:,2)))-min(medfilt1(hunt(6,:,2)))));
hunt27 = (medfilt1(hunt(7,:,2))-min(medfilt1(hunt(7,:,2))))/((max(medfilt1(hunt(7,:,2)))-min(medfilt1(hunt(7,:,2)))));
hunt28 = (medfilt1(hunt(8,:,2))-min(medfilt1(hunt(8,:,2))))/((max(medfilt1(hunt(8,:,2)))-min(medfilt1(hunt(8,:,2)))));
hunt214 = (medfilt1(hunt(9,:,2))-min(medfilt1(hunt(9,:,2))))/((max(medfilt1(hunt(9,:,2)))-min(medfilt1(hunt(9,:,2)))));
hunt215 = (medfilt1(hunt(10,:,2))-min(medfilt1(hunt(10,:,2))))/((max(medfilt1(hunt(10,:,2)))-min(medfilt1(hunt(10,:,2)))));
hunt216 = (medfilt1(hunt(11,:,2))-min(medfilt1(hunt(11,:,2))))/((max(medfilt1(hunt(11,:,2)))-min(medfilt1(hunt(11,:,2)))));
hunt217 = (medfilt1(hunt(12,:,2))-min(medfilt1(hunt(12,:,2))))/((max(medfilt1(hunt(12,:,2)))-min(medfilt1(hunt(12,:,2)))));
hunt218 = (medfilt1(hunt(13,:,2))-min(medfilt1(hunt(13,:,2))))/((max(medfilt1(hunt(13,:,2)))-min(medfilt1(hunt(13,:,2)))));
hunt219 = (medfilt1(hunt(14,:,2))-min(medfilt1(hunt(14,:,2))))/((max(medfilt1(hunt(14,:,2)))-min(medfilt1(hunt(14,:,2)))));
hunt220 = (medfilt1(hunt(15,:,2))-min(medfilt1(hunt(15,:,2))))/((max(medfilt1(hunt(15,:,2)))-min(medfilt1(hunt(15,:,2)))));

park21 = (medfilt1(park(1,:,2))-min(medfilt1(park(1,:,2))))/((max(medfilt1(park(1,:,2)))-min(medfilt1(park(1,:,2)))));
park22 = (medfilt1(park(2,:,2))-min(medfilt1(park(2,:,2))))/((max(medfilt1(park(2,:,2)))-min(medfilt1(park(2,:,2)))));
park23 = (medfilt1(park(3,:,2))-min(medfilt1(park(3,:,2))))/((max(medfilt1(park(3,:,2)))-min(medfilt1(park(3,:,2)))));
park24 = (medfilt1(park(4,:,2))-min(medfilt1(park(4,:,2))))/((max(medfilt1(park(4,:,2)))-min(medfilt1(park(4,:,2)))));
park25 = (medfilt1(park(5,:,2))-min(medfilt1(park(5,:,2))))/((max(medfilt1(park(5,:,2)))-min(medfilt1(park(5,:,2)))));
park26 = (medfilt1(park(6,:,2))-min(medfilt1(park(6,:,2))))/((max(medfilt1(park(6,:,2)))-min(medfilt1(park(6,:,2)))));
park27 = (medfilt1(park(7,:,2))-min(medfilt1(park(7,:,2))))/((max(medfilt1(park(7,:,2)))-min(medfilt1(park(7,:,2)))));
park28 = (medfilt1(park(8,:,2))-min(medfilt1(park(8,:,2))))/((max(medfilt1(park(8,:,2)))-min(medfilt1(park(8,:,2)))));
park214 = (medfilt1(park(9,:,2))-min(medfilt1(park(9,:,2))))/((max(medfilt1(park(9,:,2)))-min(medfilt1(park(9,:,2)))));
park215 = (medfilt1(park(10,:,2))-min(medfilt1(park(10,:,2))))/((max(medfilt1(park(10,:,2)))-min(medfilt1(park(10,:,2)))));

als21 = (medfilt1(als(1,:,2))-min(medfilt1(als(1,:,2))))/((max(medfilt1(als(1,:,2)))-min(medfilt1(als(1,:,2)))));
als22 = (medfilt1(als(2,:,2))-min(medfilt1(als(2,:,2))))/((max(medfilt1(als(2,:,2)))-min(medfilt1(als(2,:,2)))));
als23 = (medfilt1(als(3,:,2))-min(medfilt1(als(3,:,2))))/((max(medfilt1(als(3,:,2)))-min(medfilt1(als(3,:,2)))));
als24 = (medfilt1(als(4,:,2))-min(medfilt1(als(4,:,2))))/((max(medfilt1(als(4,:,2)))-min(medfilt1(als(4,:,2)))));
als25 = (medfilt1(als(5,:,2))-min(medfilt1(als(5,:,2))))/((max(medfilt1(als(5,:,2)))-min(medfilt1(als(5,:,2)))));
als26 = (medfilt1(als(6,:,2))-min(medfilt1(als(6,:,2))))/((max(medfilt1(als(6,:,2)))-min(medfilt1(als(6,:,2)))));
als27 = (medfilt1(als(7,:,2))-min(medfilt1(als(7,:,2))))/((max(medfilt1(als(7,:,2)))-min(medfilt1(als(7,:,2)))));
als28 = (medfilt1(als(8,:,2))-min(medfilt1(als(8,:,2))))/((max(medfilt1(als(8,:,2)))-min(medfilt1(als(8,:,2)))));