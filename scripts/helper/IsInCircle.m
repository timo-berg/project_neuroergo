function isInCircle = IsInCircle(x, y, xCenter, yCenter, radius)
    % Check if mouse click is within a circle
    dist = sqrt((x - xCenter)^2 + (y - yCenter)^2);

    % Add 10 pixels to radius to account for border and make selection easier
    isInCircle = dist <= radius + 10;
end