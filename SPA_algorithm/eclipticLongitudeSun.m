function lambda = eclipticLongitudeSun(L, g)
    lambda = mod(L + 1.915 * sind(g) + 0.020 * sind(2 * g), 360);
end