%% init
clc
close all
clear

%% param init
l1 = 105;
l2 = 55.95;
l3 = 69.07;
l4 = 14.36;
theta1 = -2*pi/3:0.3:pi/2;
theta2 = 0:0.2:pi/2;
theta3 = -pi/4:0.2:pi/4;
theta4 = -pi/2:0.2:0;

%% data init
data = combvec(theta1, theta2, theta3, theta4);
data = data';

X = l1*cos(data(:,1)) + l2*cos(data(:,1) + data(:,2)) + ...
    l3 * cos(data(:,1) + data(:,2) + data(:,3)) + ...
    l4 * cos(data(:,1) + data(:,2) + data(:,3) + data(:,4));

Y = l1 * sin(data(:,1)) + l2 * sin(data(:,1) + data(:,2)) + ...
    l3 * sin(data(:,1) + data(:,2) + data(:,3)) + ...
    l4 * sin(data(:,1) + data(:,2) + data(:,3) + data(:,4));

data1 = [X(:) Y(:) data(:,1)]; % create x-y-theta1 dataset
data2 = [X(:) Y(:) data(:,2)]; % create x-y-theta2 dataset
data3 = [X(:) Y(:) data(:,3)];
data4 = [X(:) Y(:) data(:,4)];

%% plotting
figure(1), plot(X(:),Y(:),'r.'); 
axis equal;
xlabel('X','fontsize',10)
ylabel('Y','fontsize',10)
title('X-Y coordinates for all combinations','fontsize',10)

%% anfis options
opt = anfisOptions;
opt.InitialFIS = 4;
opt.EpochNumber = 120;
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0

%% training
disp('--> Training 1st ANFIS network.')
anfis1 = anfis(data1,opt);
disp('--> Training 2nd ANFIS network.')
opt.InitialFIS = 3;
anfis2 = anfis(data2,opt);
disp('--> Training 3rd ANFIS network.')
anfis3 = anfis(data3,opt);
disp('--> Training 4th ANFIS network.')
anfis4 = anfis(data4,opt);

%% save results
save('anfises.mat', '*fis*')

%% evaluation
x_val = linspace(200,220,100); % x coordinates for validation
y_val = linspace(0,50,100); % y coordinates for validation

input = combvec(x_val, y_val);
input = input';

[X,Y] = meshgrid(x_val,y_val);
XY = [X(:) Y(:)];
THETA1P = evalfis(anfis1,XY); % theta1 predicted by anfis1
THETA2P = evalfis(anfis2,XY); % theta2 predicted by anfis2
THETA3P = evalfis(anfis3,XY);
THETA4P = evalfis(anfis4,XY);
