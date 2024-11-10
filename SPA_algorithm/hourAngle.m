function H = hourAngle(LST, alpha)
    H = mod(LST - alpha, 360);
end