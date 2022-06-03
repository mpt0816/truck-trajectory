function PlotTrajectory(pts_front, pts_rear, pts_trailer)
x_front = [];
y_front = [];
x_rear = [];
y_rear = [];
x_trailer = [];
y_trailer = [];

num = length(pts_front);
for i = 1 : 1 : num
    x_front = [x_front, pts_front(i).x];
    y_front = [y_front, pts_front(i).y];
    
    x_rear = [x_rear, pts_rear(i).x];
    y_rear = [y_rear, pts_rear(i).y];
    
    x_trailer = [x_trailer, pts_trailer(i).x];
    y_trailer = [y_trailer, pts_trailer(i).y];
end

PlotTruckArea(pts_rear(end), pts_trailer(end));
% PlotCurrentPoint(pts_front(end), pts_rear(end), pts_trailer(end));

plot(x_front, y_front, 'k-');
hold on;
    
plot(x_rear, y_rear, 'r-');
hold on;
    
plot(x_trailer, y_trailer, 'b-');

legend({'Tractor Front Axle Trajectory', 'Tractor Rear Axle Trajectory', 'Trailer Rear Axle Trajectory'},...
    'Location','northeast', 'FontSize',4);
axis equal

% set(gca, 'XLim', [-60 60]);
% set(gca, 'YLim', [-60 60]);

% set(gca, 'XLim', [-10 160]);
% set(gca, 'YLim', [-60 60]);

set(gca, 'XLim', [-20 210]);
set(gca, 'YLim', [-10 130]);
axis off
end