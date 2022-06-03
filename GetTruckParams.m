function params = GetTruckParams()
tractor.wheel_base = 5.50;
tractor.front_oh = 1.20;
tractor.rear_oh = 0.81;
tractor.width = 2.55;

trailer.wheel_base = 9.0;
trailer.front_oh = 0.85;
trailer.rear_oh = 3.07;
trailer.width = 2.50;

params.tractor = tractor;
params.trailer = trailer;
params.tractor_base2hinge = 0.32;
end