function [zp]=funBlas(x,z)
A=2;

Vb=300; % Body Velocity
Vm=400; % Rocket Velocity

delta_b = z(1);
r= z(2);
delta_m = z(3);


delta_m_dot = (1-A)*(1/r)*(Vm*sin(delta_m) - Vb*sin(delta_b));
r_dot = Vb*cos(delta_b) - Vm*cos(delta_m);
delta_b_dot = (1/r)*(Vm*sin(delta_m) - Vb*sin(delta_b));

zp=[delta_m_dot; r_dot; delta_b_dot];


end
