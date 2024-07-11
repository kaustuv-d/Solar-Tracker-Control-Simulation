function [alpha, delta] = rightAscensionDeclination(lambda, epsilon)
    alpha = atan2d(cosd(epsilon) * sind(lambda), cosd(lambda));
    delta = asind(sind(epsilon) * sind(lambda));
end