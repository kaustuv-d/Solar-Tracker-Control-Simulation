function JD = calculateJulianDate(year, month, day, hour, minute, second)
    if month <= 2
        year = year - 1;
        month = month + 12;
    end
    A = floor(year / 100);
    B = 2 - A + floor(A / 4);
    JD = floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + day + B - 1524.5 ...
        + (hour + minute / 60 + second / 3600) / 24;
end