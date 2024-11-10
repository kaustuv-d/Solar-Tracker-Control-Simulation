function n = daysSinceJ2000(JD)
    JD_J2000 = 2451545.0;  % Julian Date of J2000.0
    n = JD - JD_J2000;
end