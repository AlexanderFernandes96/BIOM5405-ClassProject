% Add this script to path from project directory and place all folders and
% files to add to path for MATLAB
clear all; clc;

addpath ./matlab/ ./blind/
%load data
[blind] = load_blind_data('./blind/');
%foot 1 normalized and filtered
%naming - 'class'+'foot#'+'subject'

blind11 = (medfilt1(blind(1,:,1))-min(medfilt1(blind(1,:,1))))/((max(medfilt1(blind(1,:,1)))-min(medfilt1(blind(1,:,1)))));
blind12 = (medfilt1(blind(2,:,1))-min(medfilt1(blind(2,:,1))))/((max(medfilt1(blind(2,:,1)))-min(medfilt1(blind(2,:,1)))));
blind13 = (medfilt1(blind(3,:,1))-min(medfilt1(blind(3,:,1))))/((max(medfilt1(blind(3,:,1)))-min(medfilt1(blind(3,:,1)))));
blind14 = (medfilt1(blind(4,:,1))-min(medfilt1(blind(4,:,1))))/((max(medfilt1(blind(4,:,1)))-min(medfilt1(blind(4,:,1)))));
blind15 = (medfilt1(blind(5,:,1))-min(medfilt1(blind(5,:,1))))/((max(medfilt1(blind(5,:,1)))-min(medfilt1(blind(5,:,1)))));
blind16 = (medfilt1(blind(6,:,1))-min(medfilt1(blind(6,:,1))))/((max(medfilt1(blind(6,:,1)))-min(medfilt1(blind(6,:,1)))));
blind17 = (medfilt1(blind(7,:,1))-min(medfilt1(blind(7,:,1))))/((max(medfilt1(blind(7,:,1)))-min(medfilt1(blind(7,:,1)))));
blind18 = (medfilt1(blind(8,:,1))-min(medfilt1(blind(8,:,1))))/((max(medfilt1(blind(8,:,1)))-min(medfilt1(blind(8,:,1)))));
blind19 = (medfilt1(blind(9,:,1))-min(medfilt1(blind(9,:,1))))/((max(medfilt1(blind(9,:,1)))-min(medfilt1(blind(9,:,1)))));
blind110 = (medfilt1(blind(10,:,1))-min(medfilt1(blind(10,:,1))))/((max(medfilt1(blind(10,:,1)))-min(medfilt1(blind(10,:,1)))));
blind111 = (medfilt1(blind(11,:,1))-min(medfilt1(blind(11,:,1))))/((max(medfilt1(blind(11,:,1)))-min(medfilt1(blind(11,:,1)))));
blind112 = (medfilt1(blind(12,:,1))-min(medfilt1(blind(12,:,1))))/((max(medfilt1(blind(12,:,1)))-min(medfilt1(blind(12,:,1)))));
blind113 = (medfilt1(blind(13,:,1))-min(medfilt1(blind(13,:,1))))/((max(medfilt1(blind(13,:,1)))-min(medfilt1(blind(13,:,1)))));
blind114 = (medfilt1(blind(14,:,1))-min(medfilt1(blind(14,:,1))))/((max(medfilt1(blind(14,:,1)))-min(medfilt1(blind(14,:,1)))));
blind115 = (medfilt1(blind(15,:,1))-min(medfilt1(blind(15,:,1))))/((max(medfilt1(blind(15,:,1)))-min(medfilt1(blind(15,:,1)))));
blind116 = (medfilt1(blind(16,:,1))-min(medfilt1(blind(16,:,1))))/((max(medfilt1(blind(16,:,1)))-min(medfilt1(blind(16,:,1)))));
blind117 = (medfilt1(blind(17,:,1))-min(medfilt1(blind(17,:,1))))/((max(medfilt1(blind(17,:,1)))-min(medfilt1(blind(17,:,1)))));
blind118 = (medfilt1(blind(18,:,1))-min(medfilt1(blind(18,:,1))))/((max(medfilt1(blind(18,:,1)))-min(medfilt1(blind(18,:,1)))));
blind119 = (medfilt1(blind(19,:,1))-min(medfilt1(blind(19,:,1))))/((max(medfilt1(blind(19,:,1)))-min(medfilt1(blind(19,:,1)))));
blind120 = (medfilt1(blind(20,:,1))-min(medfilt1(blind(20,:,1))))/((max(medfilt1(blind(20,:,1)))-min(medfilt1(blind(20,:,1)))));



%foot 1 normalized and filtered
%naming - 'class'+'foot#'+'subject'


blind21 = (medfilt1(blind(1,:,2))-min(medfilt1(blind(1,:,2))))/((max(medfilt1(blind(1,:,2)))-min(medfilt1(blind(1,:,2)))));
blind22 = (medfilt1(blind(2,:,2))-min(medfilt1(blind(2,:,2))))/((max(medfilt1(blind(2,:,2)))-min(medfilt1(blind(2,:,2)))));
blind23 = (medfilt1(blind(3,:,2))-min(medfilt1(blind(3,:,2))))/((max(medfilt1(blind(3,:,2)))-min(medfilt1(blind(3,:,2)))));
blind24 = (medfilt1(blind(4,:,2))-min(medfilt1(blind(4,:,2))))/((max(medfilt1(blind(4,:,2)))-min(medfilt1(blind(4,:,2)))));
blind25 = (medfilt1(blind(5,:,2))-min(medfilt1(blind(5,:,2))))/((max(medfilt1(blind(5,:,2)))-min(medfilt1(blind(5,:,2)))));
blind26 = (medfilt1(blind(6,:,2))-min(medfilt1(blind(6,:,2))))/((max(medfilt1(blind(6,:,2)))-min(medfilt1(blind(6,:,2)))));
blind27 = (medfilt1(blind(7,:,2))-min(medfilt1(blind(7,:,2))))/((max(medfilt1(blind(7,:,2)))-min(medfilt1(blind(7,:,2)))));
blind28 = (medfilt1(blind(8,:,2))-min(medfilt1(blind(8,:,2))))/((max(medfilt1(blind(8,:,2)))-min(medfilt1(blind(8,:,2)))));
blind29 = (medfilt1(blind(9,:,2))-min(medfilt1(blind(9,:,2))))/((max(medfilt1(blind(9,:,2)))-min(medfilt1(blind(9,:,2)))));
blind210 = (medfilt1(blind(10,:,2))-min(medfilt1(blind(10,:,2))))/((max(medfilt1(blind(10,:,2)))-min(medfilt1(blind(10,:,2)))));
blind211 = (medfilt1(blind(11,:,2))-min(medfilt1(blind(11,:,2))))/((max(medfilt1(blind(11,:,2)))-min(medfilt1(blind(11,:,2)))));
blind212 = (medfilt1(blind(12,:,2))-min(medfilt1(blind(12,:,2))))/((max(medfilt1(blind(12,:,2)))-min(medfilt1(blind(12,:,2)))));
blind213 = (medfilt1(blind(13,:,2))-min(medfilt1(blind(13,:,2))))/((max(medfilt1(blind(13,:,2)))-min(medfilt1(blind(13,:,2)))));
blind214 = (medfilt1(blind(14,:,2))-min(medfilt1(blind(14,:,2))))/((max(medfilt1(blind(14,:,2)))-min(medfilt1(blind(14,:,2)))));
blind215 = (medfilt1(blind(15,:,2))-min(medfilt1(blind(15,:,2))))/((max(medfilt1(blind(15,:,2)))-min(medfilt1(blind(15,:,2)))));
blind216 = (medfilt1(blind(16,:,2))-min(medfilt1(blind(16,:,2))))/((max(medfilt1(blind(16,:,2)))-min(medfilt1(blind(16,:,2)))));
blind217 = (medfilt1(blind(17,:,2))-min(medfilt1(blind(17,:,2))))/((max(medfilt1(blind(17,:,2)))-min(medfilt1(blind(17,:,2)))));
blind218 = (medfilt1(blind(18,:,2))-min(medfilt1(blind(18,:,2))))/((max(medfilt1(blind(18,:,2)))-min(medfilt1(blind(18,:,2)))));
blind219 = (medfilt1(blind(19,:,2))-min(medfilt1(blind(19,:,2))))/((max(medfilt1(blind(19,:,2)))-min(medfilt1(blind(19,:,2)))));
blind220 = (medfilt1(blind(20,:,2))-min(medfilt1(blind(20,:,2))))/((max(medfilt1(blind(20,:,2)))-min(medfilt1(blind(20,:,2)))));
