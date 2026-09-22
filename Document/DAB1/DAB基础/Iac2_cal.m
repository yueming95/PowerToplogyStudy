clc;
clear;
%单移相计算输入电流
syms t n Vac Vdc L D K f
y1=n*Vdc/(8*f*L)*(2-4*D-K)+n*Vdc*(0.5*K+1)/L*t;
int(y1,t,0,D*0.5/f)
syms t n Vac Vdc L D K f
y2=n*Vdc/(8*f*L)*(2-K*(1-2*D))+n*Vdc*(0.5*K-1)/L*t;
int(y2,t,0,0.5/f*(1-D))

iac1=(D*Vdc*n*(D - 1)*(K - 2))/(16*L*f^2)-(D*Vdc*n*(D - 1)*(K + 2))/(16*L*f^2)
simplify(iac1/(1/2/f))

%扩展移相计算输入电流
syms t n Vac Vdc L D1 D2 K f
y3=n*Vdc/(4*f*L)*(-K*D2-D1+1+0.5*K)+n*Vdc*(0.5*K)/L*t;
Y3=int(y3,t,0,D2*0.5/f)
syms t n Vac Vdc L D1 D2 K f
y4=n*Vdc/(4*f*L)*-(-D1+1+0.5*K)+n*Vdc*-(-0.5*K)/L*t;
Y4=int(y4,t,0,0.5/f*(D1-D2))
syms t n Vac Vdc L D1 D2 K f
y5=n*Vdc/(4*f*L)*-(K*D2-K*D1+1+0.5*K)+n*Vdc*-(-0.5*K-1)/L*t;
Y5=int(y5,t,0,0.5/f*(1-D1))

iac2=Y3+Y4+Y5;
simplify(iac2)