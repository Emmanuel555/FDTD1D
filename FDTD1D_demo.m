% 1D FDTD implementation 
% Reference: David B. Davidson's "Computational Electromagnetics for RF and Microwave Engineering"
%     Copyright (C) 2014 Tao-Yi Lee
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
    
function FDTD1D_demo()
    close all
    h = 0.25;
    freq = 4;
    Nz = 32;
    SamplesPerPeriod = 2*Nz;
    SettlingPeriods = 10;
    C = 1;
    L = 1;
    [V_nk, I_nk] = FDTD1D(h, C, L, 1, 1, 1, freq, Nz, SamplesPerPeriod, SettlingPeriods);
    VLastTimeStep = V_nk(end, :);
    ILastTimeStep = I_nk(end, :); 
    z = linspace(0, h, Nz);
    plot(z, VLastTimeStep, '-o', z, ILastTimeStep, '-+', 'LineWidth', 2);
    title(['1D FDTD of a C=' num2str(C) ', L=' num2str(L) , ', Length = ' num2str(h) ' T-line'], 'FontSize', 14)
    xlabel('z location (m)', 'FontSize', 14);
    ylabel('Voltage (V) and Current (A)', 'FontSize', 14);
    legend({'FDTD V', 'FDTD I'}, 'FontSize', 14);
    grid on
end