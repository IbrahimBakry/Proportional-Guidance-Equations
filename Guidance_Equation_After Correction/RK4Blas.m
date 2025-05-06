%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical Solution for Proportional Navigation Equations %
% Method is RK4                                            %
% Eng. Ibrahim Bakry                                       %
% Done at 2015/6/25                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

Vb=input('Input Target Velocity: '); % Body Velocity
Vm=input('Input Missle Velocity: '); % Rocket Velocity
A=input('Input A: ');   % Proportional Navigation Constant
delta_b=input('Input Target Initial Angle Delta_B0: ');
delta_m=input('Input Missle Initial Angle Delta_M0: ');
r=input('Input The Inintial r: ');

% Vb=300; % Body Velocity
% Vm=480; % Rocket Velocity
% A=1;   % Proportional Navigation Constant

% Integration Boundary
n=100000;
a=0;
b=150;
h=(b-a)/n;

% Initial Values;
% delta_m = 0/57.3;
% r = 3000;
% delta_b = 135/57.3;
z= [delta_b r delta_m]';

i=0;
j=0;
for x=a:h:b
    
    i=i+1;
    j=j+h;
    xx(i)=x;
    zz(i,:)=z';
    
    k1=h*funBlas(x,z,A,Vm,Vb);
    k2=h*funBlas(x+h/2,z+k1/2,A,Vm,Vb);
    k3=h*funBlas(x+h/2,z+k2/2,A,Vm,Vb);
    k4=h*funBlas(x+h,z+k3,A,Vm,Vb);
    k=(1/6)*(k1+2*k2+2*k3+k4);
    z=z+k;
        
    % Colision Roll ( the roll is: r=0 with error 0.1%)
      if abs(z(2)) <= 0.1 % && zz(i,2) == 0.1
        disp('impact time Tf [Sec] = ')
        T=j;
        disp(T)
        disp('The Final Values of [Delta_B Delta_M] in Degree')
        disp([zz(i,1),zz(i,3)])
       
        break
      end
     
end
% disp('the History of [Delta_B r Delta_M]')
% disp(zz)

 plot(xx,zz(:,1))
xlabel ('Time')
ylabel ('Delta_B')
title ('Delta_B VS Time')
 grid on

figure(2)
 plot(xx,zz(:,3))
xlabel ('Time')
ylabel ('Delta_M')
title ('Delta_M VS Time')
 grid on

% Plotting r(t) with time 
 figure(3)
 plot(xx,zz(:,2))
xlabel ('Time')
ylabel ('r')
title ('r VS Time')
 grid on


