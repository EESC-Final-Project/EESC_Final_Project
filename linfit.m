function [a,b,sdeva,sdevb,chisqr,prob]=linfit(x, y, sdev)
%LINFIT Linear least-squares data fitting with parameter error estimation
%
% PURPOSE:
%       This function fits the paired data {X(i), Y(i)} to the linear model,
%       y = a + b x, by minimizing the chi-square error statistic. The result
%       is the model parameters a and b.
%
% CALLING SEQUENCE:
%       [a,b,sdeva,sdevb,chisqr,prob] = linfit(x, y, sdev)
%
% INPUTS:
%       x:    An n-element vector
%       y:    An n-element vector
%    sdev:    An optional n-element vector specifies the individual standard
%             deviations for [x(i), y(i)].
%             
% OUTPUTS:
%   chisq:    The chi-square error statistic as the sum of squared errors 
%             between y(i) and a + b x(i). If individual standard deviations
%             are supplied, then the chi-square error statistic is computed as
%             the sum of squared errors divided by the standard deviations.
%    prob:    The probability that the computed fit would have a value of 
%             chisqr or greater. If prob is greater than 0.1, the model 
%             parameters are "believable". If prob is less than 0.1, the 
%             accuracy of the model parameters is questionable.
%
% EXAMPLE:
%       Define two n-element vectors of paired data.
%         x = [-3.20, 4.49, -1.66, 0.64, -2.43, -0.89, -0.12, 1.41, ...
%               2.95, 2.18,  3.72, 5.26];
%         y = [-7.14, -1.30, -4.26, -1.90, -6.19, -3.98, -2.87, -1.66, ...
%              -0.78, -2.61,  0.31,  1.74];
%       Define a vector of standard deviations with a constant value of 0.85
%         sdev = x-x+.85;
%       Compute the model parameters, a and b.
%         [a,b,sdeva,sdevb,chisqr,prob] = linfit(x, y, sdev)
%       The result should be the two-element vector:
%         [-3.44596, 0.867329]
%       The keyword parameters should be returned as:
%         chisq = 11.4998, prob = 0.319925
%
% REFERENCE:
%       Numerical Recipes, The Art of Scientific Computing (Second Edition)
%       Cambridge University Press
%       ISBN 0-521-43108-5
%
% MODIFICATION HISTORY:
%     written by:  Oded Aharonson & Mark Behn, Feb, 2000.
%       based on:  GGS, RSI, September 1994
%                    LINFIT is based on the routines: fit.c, gammq.c, gser.c,
%                    and gcf.c described in section 15.2 of Numerical Recipes,
%                    The Art of Scientific Computing (Second Edition), and is
%                    used by permission.

nx = length(x);
  ny = length(y);

  if (nx ~= ny); error('X and Y must be vectors of equal length.'); end;

  if exist('sdev') 
    nsdev=length(sdev);
  else
    nsdev=0;
  end
  
  if exist('sdev') 
    % Standard deviations are supplied.
    if (length(sdev) == nx)
      wt = 1.0 ./ sdev.^2;
      ss = sum(wt);
      sx = sum(wt .* x);
      sy = sum(wt .* y);
      t =  (x - sx./ss) ./ sdev;
      st2 = sum(t.^2);
      b = sum(t .* y ./ sdev);
    else
      error('sdev and x must be vectors of equal length.');
    end
  else
    ss = nx;
    sx = sum(x);
    sy = sum(y);
    t = x - sx./ss;
    st2 = sum(t.^2);
    b = sum(t .* y);
  end
  
  b = b ./ st2;
  a = (sy - sx .* b) ./ ss;
  sdeva = sqrt((1.0 + sx * sx / (ss * st2)) / ss);
  sdevb = sqrt(1.0 / st2);

  if nsdev ~= 0 
    chisqr = sum( ((y - a - b .* x) ./ sdev).^2);
    prob = 1 - gammainc(0.5*chisqr,0.5*(nx-2));
  else
    chisqr = sum( (y - a - b .* x).^2);
    prob = chisqr * 0 + 1;  % Make prob same type as chisqr.
    sdevdat = sqrt(chisqr / (nx-2));
    sdeva = sdeva .* sdevdat;
    sdevb = sdevb .* sdevdat;
  end

