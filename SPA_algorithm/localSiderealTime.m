function LST = localSiderealTime(n, longitude, hour, minute, second)
    GMST = mod(6.697374558 + 0.06570982441908 * n + (hour + minute / 60 + second / 3600) * 1.00273790935, 24);
    LST = mod(GMST * 15 + longitude, 360);
end