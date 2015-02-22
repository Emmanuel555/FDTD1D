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

% [V, I] = FDTD1D(0.25, 1, 1, 1, 1, 1, 4, 8, 12, 4)

function [V_nk, I_nk] = FDTD1D(h, C, L, Rs, Rl, v0, freq, Nz, SamplesPerPeriod, SettlingPeriods)    
    close all
    delta_z = h/(Nz-1);
    T= 1/freq; % Period of signal    
    delta_t = T/SamplesPerPeriod;              
    Nt=SettlingPeriods*SamplesPerPeriod; 
    beta1 = 2*delta_t/(Rs*C*delta_z);
    beta2 = 2*delta_t/(Rl*C*delta_z);
    r = (delta_t)^2/(L*C*delta_z^2);   
    % Initialize Yee grid with initial conditions (ICs)
    Vtilde_nk = zeros(Nt, Nz);
    I_nk = zeros(Nt, Nz);            
    % Time/Space loop
    for n = 2:Nt
        Vo_n = voltageSource(n-1, delta_t, v0, freq);
        Vtilde_nk(n, 1) = (1-beta1)*Vtilde_nk(n-1, 1) - 2*I_nk(n-1, 1) + (2/Rs)*Vo_n;
        for k = 2:Nz-1
            Vtilde_nk = voltageStencilUpdate(Vtilde_nk, I_nk, n, k);            
        end                
        Vtilde_nk(n, Nz) = (1-beta2)*Vtilde_nk(n-1, Nz) + 2*I_nk(n-1, Nz-1);      
        for k = 1:Nz-1
            I_nk = currentStencilUpdate(Vtilde_nk, I_nk, n, k, r); 
        end                        
    end
    V_nk = Vtilde_nk *delta_t/(C*delta_z);       
end