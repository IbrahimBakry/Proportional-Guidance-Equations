%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphical Solution for Proportional Navigation Equations %
% Eng. Ibrahim Bakry                                       %
% Done at 2015/6/25                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

Vb=300; % Body Velocity
Vm=480; % Rocket Velocity
A=2;   % Proportional Navigation Constant
delta_b0=90;
delta_m0=0;
K = Vm/Vb;

delta_b = -180/57.3 : 1/57.3 : 180/57.3;
delta_m = -180/57.3 : 1/57.3 : 180/57.3;

i=0;
x=0;
for i = 1 : length(delta_b)
     V_r(i) = - Vb*cos(delta_b(i)) + Vm*cos(delta_m(i));
     V_eta(i) = Vm*sin(delta_m(i)) - Vb*sin(delta_b(i));
     Inc(i) = (1-A)*i;
 xx(i) = i+1; 
end

V_r_delta_b0 = acos(1/K)*57.3 + max(V_r);
V_eta_delta_m0 = asin(1/K)*57.3;

i=0;
for i=1:length(V_r)
    Vr(i) = V_r(i) - V_r_delta_b0;
end

i=0;
for i=1:length(V_r)
    Vr2(i) = -V_r(i) + V_r_delta_b0;
end


t=-180:1:180;
plot(t,Vr)
hold on
plot(t,Vr2)
grid on

N = max(V_eta)/ V_eta_delta_m0;
V_eta_1 = V_eta./N;
plot(t,V_eta_1,'r')

delta = (1-A) * t + (delta_m0 - ((1-A)*delta_b0));
plot(t,delta,'k')





    
    
    