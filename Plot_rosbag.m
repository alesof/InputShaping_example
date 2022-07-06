clear all; close all; clc;

%ROS Simulation Parameters (test_comp1.bag)
%maxacc=20.0
%maxvel=3.0
%qi=0.0
%qf=1.2
%shaper=ZVDD
%wn=3.2*6.28
%zita=0.005

%ROS Simulation Parameters (test_comp2.bag)
%maxacc=20.0
%maxvel=3.0
%qi=1.2
%qf=0.0
%shaper=ZVDD
%wn=3.2*6.28
%zita=0.005

%%Plot Rosbag shaped profile
%bag=rosbag("test_comp2.bag");
bag=rosbag("test_comp1.bag");
shaped= select(bag,'Topic','/ShapedVel');
unshaped= select(bag,'Topic','/TrapVel');
msgStruct = readMessages(shaped,'DataFormat','struct');
msgStruct_2 = readMessages(unshaped,'DataFormat','struct');

s_vel=cellfun(@(m) double(m.Vel), msgStruct);
s_acc=cellfun(@(m) double(m.Acc), msgStruct);
s_pos=cellfun(@(m) double(m.Pos), msgStruct);
u_vel=cellfun(@(m) double(m.Vel), msgStruct_2);
u_acc=cellfun(@(m) double(m.Acc), msgStruct_2);
u_pos=cellfun(@(m) double(m.Pos), msgStruct_2);


figure(1)
subplot(2,1,1)
plot(s_vel,'LineWidth',1.5)
hold on
grid on
plot(s_pos,'LineWidth',1.5)
xlabel('[s]')
legend('vel','pos')
title('Shaped signal')
xlim([0 3000])
set(gca,'XTick',0:500:3000)
set(gca,'XTickLabel',0:.25:12)
xlabel('[s]')

subplot(2,1,2)
plot(u_vel,'LineWidth',1.5)
hold on
grid on
plot(u_pos,'LineWidth',1.5)
xlabel('[s]')
legend('vel','pos')
title('Unshaped signal')
xlim([0 3000])
set(gca,'XTick',0:500:3000)
set(gca,'XTickLabel',0:.25:12)
xlabel('[s]')

figure(2)
subplot(2,1,1)
plot(s_vel,'LineWidth',1.5)
hold on
grid on
plot(u_vel,'LineWidth',1.5)
xlabel('[s]')
legend('shaped','unshaped')
title('Velocity Comparison')
xlim([0 3000])
set(gca,'XTick',0:500:3000)
set(gca,'XTickLabel',0:.25:12)
xlabel('[s]')

subplot(2,1,2)
plot(s_pos,'LineWidth',1.5)
xlabel('[s]')
hold on
grid on
plot(u_pos,'LineWidth',1.5)
xlabel('[s]')
legend('shaped','unshaped')
title('Position Comparison')
xlim([0 3000])
set(gca,'XTick',0:500:3000)
set(gca,'XTickLabel',0:.25:12)





