%%  ragone.m
%   Copyright Politecnico di Milano 2020
%   Samuele Grillo

%% battery

clc
range = .0001:.0001:1;

f = @(x,r,rL) 0.5.*x./(1-sqrt(1-x) + 2*r/rL);     % self-discharge (leakage) 
f_nl = @(x) 0.5.*x./(1-sqrt(1-x));              % no self-discharge

loglog([range],f([range],1,1000))

hold on

loglog([range],f([range],1,100),'k')
loglog([range],f_nl([range]),'r')
loglog([range],.5*ones(size([range])),'r--')

title('ragone plot for battery storage (varying self-discharge "leakage")')
xlabel('p') 
ylabel('e_b') 
legend({'Rleak = 1000 \Omega','Rleak = 100 \Omega','Rleak = inf \Omega'},'Location','Southeast')

hold off