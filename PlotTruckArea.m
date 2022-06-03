function PlotTruckArea(pt_rear, pt_trailer)
params = GetTruckParams();
tractor = params.tractor;
trailer = params.trailer;

tractor_coners = CalculateConersFromRearPoint(pt_rear, tractor);
trailer_coners = CalculateConersFromRearPoint(pt_trailer, trailer);

p1 = fill([tractor_coners(1).x, tractor_coners(2).x, tractor_coners(3).x, tractor_coners(4).x], ...
          [tractor_coners(1).y, tractor_coners(2).y, tractor_coners(3).y, tractor_coners(4).y], 'g', 'facealpha', 0.6);
set(p1, 'handlevisibility', 'off'); 
hold on;

p2 = fill([trailer_coners(1).x, trailer_coners(2).x, trailer_coners(3).x, trailer_coners(4).x], ...
          [trailer_coners(1).y, trailer_coners(2).y, trailer_coners(3).y, trailer_coners(4).y], 'y', 'facealpha', 0.6);
set(p2, 'handlevisibility', 'off');
hold on;
end