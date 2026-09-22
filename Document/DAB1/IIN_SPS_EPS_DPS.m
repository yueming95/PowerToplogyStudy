clc;
clear;
%单移相计算输入电流
syms t n V1 V2 L D K f 
 y1=n*V2/(4*f*L)*(1-2*D-K)+n*V2*(K+1)/L*t;
 Y1=int(y1,t,0,D*0.5/f)
 syms t n V1 V2 L D K f
 y2=n*V2/(4*f*L)*(1+2*D*K-K)+n*V2*(K-1)/L*t;
 Y2=int(y2,t,0,0.5/f*(1-D)) 
 
 iac1=Y1+Y2;
 simplify(iac1/(1/2/f))

%扩展移相计算输入电流
syms t n V1 V2 L D1 D2 K f
y3=n*V2/(4*f*L)*(K*D1-2*D2+1-K)+n*V2/L*t;
Y3=int(y3,t,0,D1*0.5/f)
syms t n V1 V2 L D1 D2 K f
y4=n*V2/(4*f*L)*((K+2)*D1+1-K-2*D2)+(n*V2*(K+1))/L*t;
Y4=int(y4,t,0,0.5/f*(D2-D1))
syms t n V1 V2 L D1 D2 K f
y5=n*V2/(4*f*L)*(2*K*D2-K*D1+1-K)+(n*V2*(K-1))/L*t;
Y5=int(y5,t,0,0.5/f*(1-D2))

iac2=0+Y4+Y5;
simplify(iac2/(1/2/f))

%双重移相计算输入电流
syms t n V1 V2 L D1 D2 K f
y6=-n*V2/(4*f*L)*((K-1)*(1-D1)+2*D2)+n*V2/L*t;
Y6=int(y6,t,0,D1*0.5/f)
syms t n V1 V2 L D1 D2 K f
y7=n*V2/(4*f*L)*(1+D1-K*(1-D1)-2*D2)+(n*V2*(K+1))/L*t;
Y7=int(y7,t,0,0.5/f*(D2-D1))
syms t n V1 V2 L D1 D2 K f
y8=n*V2/(4*f*L)*(K*(2*D2-1-D1)+1)+(V1*(1))/L*t;
Y8=int(y8,t,0,0.5/f*(D1))
syms t n V1 V2 L D1 D2 K f
y9=n*V2/(4*f*L)*(D1*(K-1)+(2*K*D2+1-K))+(n*V2*(K-1))/L*t;
Y9=int(y9,t,0,0.5/f*(1-D2-D1))

iac3=0+Y7+Y8+Y9
simplify(iac3/(1/2/f))
