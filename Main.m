clc; clear; close all;

%% truck params
params = GetTruckParams();
tractor = params.tractor;
trailer = params.trailer;
tractor_wheel_base = tractor.wheel_base;
trailer_wheel_base = trailer.wheel_base;
tractor_base2hinge = params.tractor_base2hinge;

%% 轨迹
pts_front = [];
pts_rear = [];
pts_hinge = [];
pts_trailer = [];

pts = GenerateRoadCenterLine();
pts_size = length(pts);

for i = 1 : 1 : pts_size
    %% 牵引车前轴轨迹
    pt_front.x = pts(i).x;
    pt_front.y = pts(i).y;
    pt_front.theta = pts(i).theta;
    pts_front = [pts_front, pt_front];
    
    %% 牵引车后轴轨迹
    if length(pts_front) == 1
        pt_rear = CalculatePointByOnePoint(pt_front, tractor_wheel_base);
    else
        last_pt_front = pts_front(end - 1);
        last_pt_rear = pts_rear(end);
        pt_rear = ConvertPointFromFrontAxeToRearAxe(last_pt_front, last_pt_rear, pt_front, tractor_wheel_base);
    end
    pts_rear = [pts_rear, pt_rear];
    
    %% 铰接点轨迹
    pt_hinge = CalculatePointByOnePoint(pt_rear, tractor_base2hinge);
    pts_hinge = [pts_hinge, pt_hinge];
    %% 拖车轨迹
    if length(pts_hinge) == 1
        pt_trailer = CalculatePointByOnePoint(pt_hinge, trailer_wheel_base);
    else
        last_pt_hinge = pts_hinge(end - 1);
        last_pt_trailer = pts_trailer(end);
        pt_trailer = ConvertPointFromFrontAxeToRearAxe(last_pt_hinge,last_pt_trailer, pt_hinge, trailer_wheel_base);
    end
    pts_trailer = [pts_trailer, pt_trailer];
end

%% Make Gif
tractor_color = [72 118 255] / 255;  %% RoyalBlue
trailer_color = [255 215 0] / 255;  %% Gold

x_rear = [];
y_rear = [];
x_trailer = [];
y_trailer = [];

num = length(pts_rear);
for i = 1 : 1 : num
    x_rear = [x_rear, pts_rear(i).x];
    y_rear = [y_rear, pts_rear(i).y];
    
    x_trailer = [x_trailer, pts_trailer(i).x];
    y_trailer = [y_trailer, pts_trailer(i).y];
end

plot(x_rear, y_rear, '-', 'Color', tractor_color, 'LineWidth', 1.0);
legend({'Tractor Rear Axle Trajectory'}, 'Location','northeast', 'FontSize', 8);
set(gca, 'XLim', [-20 210]);
set(gca, 'YLim', [-10 130]);
axis equal
hold on;

step = 1;
pause_time = 1;
pause_step = 1;
pause(pause_time);
MakeGif('demo.gif', step);
step = step + pause_step;


for i = 1 : 1 : num
    
    if (~(rem(i, 20) == 1))
        continue;
    end
    tractor_coners = CalculateConersFromRearPoint(pts_rear(i), tractor);
    
    p1 = fill([tractor_coners(1).x, tractor_coners(2).x, tractor_coners(3).x, tractor_coners(4).x], ...
        [tractor_coners(1).y, tractor_coners(2).y, tractor_coners(3).y, tractor_coners(4).y], tractor_color, 'facealpha', 0.6);
    set(p1, 'handlevisibility', 'off');
    hold on;
end

trailer_coners = CalculateConersFromRearPoint(pts_trailer(1), trailer);

p1 = fill([trailer_coners(1).x, trailer_coners(2).x, trailer_coners(3).x, trailer_coners(4).x], ...
    [trailer_coners(1).y, trailer_coners(2).y, trailer_coners(3).y, trailer_coners(4).y], trailer_color, 'facealpha', 0.6);
set(p1, 'handlevisibility', 'off');
hold on;

tractor_coners = CalculateConersFromRearPoint(pts_rear(1), tractor);

p1 = fill([tractor_coners(1).x, tractor_coners(2).x, tractor_coners(3).x, tractor_coners(4).x], ...
    [tractor_coners(1).y, tractor_coners(2).y, tractor_coners(3).y, tractor_coners(4).y], tractor_color, 'facealpha', 0.6);
hold on;
legend({'Tractor Rear Axle Trajectory', 'Tractor Body Project'}, 'Location','northeast', 'FontSize', 8);

pause(pause_time);
MakeGif('demo.gif', step);
step = step + pause_step;

plot(x_trailer, y_trailer, '-', 'Color', trailer_color, 'LineWidth', 1.0);
legend({'Tractor Rear Axle Trajectory', 'Tractor Body Project', 'Trailer Rear Axle Trajectory'}, 'Location','northeast', 'FontSize', 8);
set(gca, 'XLim', [-20 210]);
set(gca, 'YLim', [-10 130]);
axis equal
hold on;

pause(pause_time);
MakeGif('demo.gif', step);
step = step + pause_step;

for i = 1 : 1 : num
    
    if (~(rem(i, 20) == 1))
        continue;
    end
    trailer_coners = CalculateConersFromRearPoint(pts_trailer(i), trailer);
    
    p1 = fill([trailer_coners(1).x, trailer_coners(2).x, trailer_coners(3).x, trailer_coners(4).x], ...
        [trailer_coners(1).y, trailer_coners(2).y, trailer_coners(3).y, trailer_coners(4).y], trailer_color, 'facealpha', 0.6);
    set(p1, 'handlevisibility', 'off');
    hold on;
end

trailer_coners = CalculateConersFromRearPoint(pts_trailer(1), trailer);

p1 = fill([trailer_coners(1).x, trailer_coners(2).x, trailer_coners(3).x, trailer_coners(4).x], ...
    [trailer_coners(1).y, trailer_coners(2).y, trailer_coners(3).y, trailer_coners(4).y], trailer_color, 'facealpha', 0.6);
legend({'Tractor Rear Axle Trajectory', 'Tractor Body Project', 'Trailer Rear Axle Trajectory', 'Trailer Body Project'}, 'Location','northeast', 'FontSize', 8);
pause(pause_time);
MakeGif('demo.gif', step);
