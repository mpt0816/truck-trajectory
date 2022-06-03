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

step = 1;

pts = GenerateRoadCenterLine();
pts_size = length(pts);
% index = [];
% theta = [];
% for i = 1 : 1 : pts_size
%     index = [index, i];
%     theta = [theta, pts(i).theta];
% end
% plot(index, theta);
    
for i = 1 : 1 : pts_size
    close all;
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
    PlotTrajectory(pts_front, pts_rear, pts_trailer);
    
    %% make gif
    pause(0.05);
    MakeGif('demo.gif', step);
    step = step + 1;
end