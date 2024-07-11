function [elevation, azimuth] = solarElevationAzimuth(latitude, delta, H)
    elevation = asind(sind(latitude) * sind(delta) + cosd(latitude) * cosd(delta) * cosd(H));
    azimuth = atan2d(-sind(H), cosd(H) * sind(latitude) - tand(delta) * cosd(latitude));
    if azimuth < 0
        azimuth = azimuth + 360;
    end
end