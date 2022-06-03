function PlotCurrentPoint(pt_front, pt_rear, pt_trailer)
p1 = plot([pt_front.x], [pt_front.y], 'ko', 'MarkerSize',3);
set(p1, 'handlevisibility', 'off');
hold on;

p2 = plot([pt_rear.x], [pt_rear.y], 'ro', 'MarkerSize',3);
set(p2, 'handlevisibility', 'off');
hold on;

p3 = plot([pt_trailer.x], [pt_trailer.y], 'bo', 'MarkerSize',3);
set(p3, 'handlevisibility', 'off');
hold on;
end