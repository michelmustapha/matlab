function [y] = geomean(x,DIM)
% GEOMEAN calculates the geomentric mean of data elements. 
% 
% 	y = geomean(x [,DIM])   is the same as 
% 	y = mean(x,'G' [,DIM]) 
%
% DIM	dimension
%	1 STD of columns
%	2 STD of rows
%	default or []: first DIMENSION, with more than 1 element
%
% features:
% - can deal with NaN's (missing values)
% - dimension argument also in Octave
% - compatible to Matlab and Octave
%
% see also: SUMSKIPNAN, MEAN, HARMMEAN
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA


%	Version 1.23;	07 Jun 2002
%	Copyright (C) 2000-2002 by Alois Schloegl <a.schloegl@ieee.org>


if nargin<2
        DIM=min(find(size(x)>1));
        if isempty(DIM), DIM=1; end;
end;

[y, n] = sumskipnan(log(x),DIM);
y = exp (y./n);

