% 1D FDTD implementation 
% Reference: David B. Davidson's "Computational Electromagnetics for RF and Microwave Engineering"
%     Copyright (C) 2014 Tao-Yi Lee (tylee <AT> ieee <dot> org)
% 
%     This program is free software; you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation; either version 2 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License along
%     with this program; if not, write to the Free Software Foundation, Inc.,
%     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

function mVo = voltageStencilUpdate(mV, mI, n, k)
    mVo = mV;
    mVo(n, k) = mV(n-1, k) -(mI(n-1, k) - mI(n-1, k-1));
end