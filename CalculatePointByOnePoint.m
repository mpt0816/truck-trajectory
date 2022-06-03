function point = CalculatePointByOnePoint(pt, length)

point.x = pt.x - length * cos(pt.theta);
point.y = pt.y - length * sin(pt.theta);
point.theta = pt.theta;
end
