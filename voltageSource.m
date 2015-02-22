% voltage_out = voltageSource(1, delta_t, v0)
function voltage_out = voltageSource(nn, delta_t, v0, freq)
    % just a cosine source
    voltage_out = v0*cos(2*pi*freq*nn*delta_t); 
end