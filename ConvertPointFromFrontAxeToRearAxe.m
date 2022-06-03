function point = ConvertPointFromFrontAxeToRearAxe(last_pt_front, last_pt_rear, current_pt_front, length)

delta_s = sqrt((last_pt_front.x - current_pt_front.x) ^ 2 + (last_pt_front.y - current_pt_front.y) ^ 2);
theta = last_pt_rear.theta + sin(NormalizeAngle(last_pt_front.theta - last_pt_rear.theta)) / length * delta_s;
theta = NormalizeAngle(theta);

point.x = current_pt_front.x - length * cos(theta);
point.y = current_pt_front.y - length * sin(theta);
point.theta = theta;
end