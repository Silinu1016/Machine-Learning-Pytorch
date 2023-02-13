clc
clear all
close all
x = csvread("G:/내 드라이브/연구실/PyTorch/1주차/DATA_x.csv");
y = csvread("G:/내 드라이브/연구실/PyTorch/1주차/DATA_y.csv");
y_predicts = csvread("G:/내 드라이브/연구실/PyTorch/1주차/DATA_y_predicts.csv");
W_and_b = csvread("G:/내 드라이브/연구실/PyTorch/1주차/DATA_y_W_and_b.csv");
Loss = csvread("G:/내 드라이브/연구실/PyTorch/1주차/Loss.csv");

x_lin = linspace(-10,10,1000);
Y_predicts_all = W_and_b(:,1) * x_lin  +  W_and_b(:,2) ;
figure()
set(gcf,'Position',[0 0 2000 1500]);
set(gca,'FontSize',50);
for i  = 1: size(W_and_b,1)
    plot(x,y,'r*','markersize',10);
    hold on;
    grid on;
    x_lin = linspace(-10,10,1000);
    plot(x_lin,Y_predicts_all(i,:),'b-','linewidth',20);
    legend("DATA","Gradient "+string(i),"Location","southeast", 'FontSize',50);
    xlabel("x", 'FontSize',50);
    ylabel("y", 'FontSize',50);
    title("학습에 따른 기울기 변화", 'FontSize',50);
    hold off
    drawnow
end
disp("y = "+W_and_b(end,1)+"x + "+W_and_b(end,2))
%%
figure();
Epoch = linspace(1,500,500);
plot(Epoch,Loss,'b-','linewidth',5);
grid on;
legend("Loss","Location","northeast");
xlabel("Epoch");
ylabel("Loss");
title("학습에 따른 Loss 변화");

