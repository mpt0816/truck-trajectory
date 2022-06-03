function pts = GenerateRoadCenterLine()
pts = [];
for x = 0.0 : 1 : 50.0
    pt.theta = 0.0;
    pt.x = x;
    pt.y = tan(pt.theta) * pt.x + 10.0;
    pts = [pts, pt];
end

radius = 50.0;
center.x = pts(end).x;
center.y = pts(end).y + radius;

for theta = -1.0 / 2.0 * pi : 0.02 : 0.0 * pi
    pt.x = center.x + radius * cos(theta);
    pt.y = center.y + radius * sin(theta);
    pt.theta = NormalizeAngle(theta + pi / 2.0);
    pts = [pts, pt];
end

center.x = pts(end).x + radius;
center.y = pts(end).y;

for theta = pi : -0.02 : -1.0 / 2.0 * pi
    pt.x = center.x + radius * cos(theta);
    pt.y = center.y + radius * sin(theta);
    pt.theta = -NormalizeAngle(pi / 2.0 - theta);
    pts = [pts, pt];
end

% for x = 1 : 0.5 : 150
%     y = 50 * sin (2 * pi / 150 * x);
%     k = 50 / 150 * 2 * pi * cos(2 * pi / 150 * x);
%     theta = atan(k);
%     pt.x = x; pt.y = y; pt.theta = theta;
%     pts = [pts, pt];
% end

% radius = 50.0;
% for theta = 0 : 0.05 : 2.0 * pi
%     pt.x = 0 + radius * cos(theta);
%     pt.y = 0 + radius * sin(theta);
%     pt.theta = NormalizeAngle(pi / 2.0 + theta);
%     pts = [pts, pt];
% end

end