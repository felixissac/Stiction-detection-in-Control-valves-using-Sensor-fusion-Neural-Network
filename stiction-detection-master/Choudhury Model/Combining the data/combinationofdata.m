%%Combining the data 
PV = [ PV_y(1001:1500,2:1601) PV_n_t(1001:1500,2:6955) PV_n_o(1001:1500,2:2113)];
OP = [ OP_y(1001:1500,2:1601) OP_n_t(1001:1500,2:6955) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,1600) zeros(1,9066); zeros(1,1600) ones(1,9066)];
%6954 + 2112

%%

%y_5 is 0.05

PV = [ PV_y_5(1001:1500,2:1601) PV_y_4(1001:1500,2:1601) PV_n_o(1001:1500,2:2113)];
OP = [ OP_y_5(1001:1500,2:1601) OP_y_4(1001:1500,2:1601) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,3200) zeros(1,2112); zeros(1,3200) ones(1,2112)];

%%
%y_3 is 0.03

PV = [ PV_y_3(1001:1500,2:1601) PV_n_t(1001:1500,2:3277) PV_n_o(1001:1500,2:2113)];
OP = [ OP_y_3(1001:1500,2:1601) OP_n_t(1001:1500,2:3277) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,1600) zeros(1,5388); zeros(1,1600) ones(1,5388)];


%%
%y_2 is 0.02 raise to 0.5

PV = [ PV_y_2(1001:1500,2:1601) PV_n_t(1001:1500,2:3277) PV_n_o(1001:1500,2:2113)];
OP = [ OP_y_2(1001:1500,2:1601) OP_n_t(1001:1500,2:3277) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,1600) zeros(1,5388); zeros(1,1600) ones(1,5388)];

%%
%y_1 is 0.01

PV = [ PV_y_1(1001:1500,2:1601) PV_n_t(1001:1500,2:3277) PV_n_o(1001:1500,2:2113)];
OP = [ OP_y_1(1001:1500,2:1601) OP_n_t(1001:1500,2:3277) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,1600) zeros(1,5388); zeros(1,1600) ones(1,5388)];


%%
%combining y_4 and y_5 

PV = [  PV_y_5(1001:1500,2:1601)  PV_y_4(1001:1500,2:1601) PV_n_t(1001:1500,2:3277) PV_n_o(1001:1500,2:2113)];
OP = [  OP_y_5(1001:1500,2:1601)  OP_y_4(1001:1500,2:1601) OP_n_t(1001:1500,2:3277) OP_n_o(1001:1500,2:2113)];

Y = [ones(1,3200) zeros(1,5388); zeros(1,3200) ones(1,5388)];

