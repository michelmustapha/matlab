function []=tduni_plot(res)
% PURPOSE: Generate graphic output of the BFL or Denton 
%          temporal disaggregation method
% ------------------------------------------------------------
% SYNTAX: tduni_plot(res);
% ------------------------------------------------------------
% OUTPUT: Graphic output:
%         - High and low frequency series: y vs Y
% ------------------------------------------------------------
% INPUT: res: structure generated by bfl or denton programs
% ------------------------------------------------------------
% LIBRARY: temporal_agg
% ------------------------------------------------------------
% SEE ALSO: bfl, denton_uni, tduni_plot

% written by:
% Enrique M. Quilis
% Instituto Nacional de Estadistica
% Paseo de la Castellana, 183
% 28046 - Madrid (SPAIN)


% 1: Generation of a 'naive' high freq. series using low freq. data
% 2: Plot of low freq. input and high freq. output (divided by s)

n = res.N * res.s;

Y = temporal_agg(res.y,res.ta,res.s);

i=1; t=1;
ya=zeros(n,1);   % Initial allocation

while (t<=res.N)
   c=0;
   while (c<res.s)         
      ya(i,1)=Y(t,1);
      c=c+1;
      i=i+1;
   end
   t=t+1;
end;

if (res.ta == 1)
   g1=res.s;
else
   g1=1;
end

t=1:n;
plot(t,res.y,'b-',t,ya/g1,'r-');
axis ([0 n+1 min(res.y)*0.99 max(res.y)*1.01]);
grid off; legend (res.meth,'naive',0);
title ('High frequency and low frequency series');
xlabel ('time'); 

switch res.meth
case {'Boot-Feibes-Lisman'}
   % Do nothing
case {'Denton','Proportional Denton'}
   figure;
   t=1:n;
   plot(t,res.y,'r-',t,res.x,'b-');
   grid off; legend ('y','x',0);
   title ('High frequency conformity');
   xlabel ('time');
   % -----------------------------------------------------------
   % High and low frequency residuals: u vs U
   %   1. Generate a high freq. time series with the low freq. data
   %   2. Plot both series (low freq. divides by g1)
   i=1; t=1;
   while (t <= res.N)
      c=0;
      while (c < res.s)
         ua(i,1)=res.U(t,1);
         c=c+1;
         i=i+1;
      end
      t=t+1;
   end;
   figure;
   t=1:n;
   plot(t,res.u,'r-',t,ua/g1,'b-');
   grid off; legend ('u','U',0);
   title ('High frequency and low frequency residuals');
   xlabel ('time'); 
end




   