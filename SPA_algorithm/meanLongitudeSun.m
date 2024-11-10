function L = meanLongitudeSun(n)
    L = mod(280.460 + 0.9856474 * n, 360);
end