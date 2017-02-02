:- dynamic
self/2,
queueSize/1,
friendly/4,
isMorphing/2,
minerals/1,
unitAmount/2,
gas/1,
supply/2,
train/1,
sendDrone/1,
chat/0,
unitAttack/1.

% default distance check				
	distance(X1,Y1,X2,Y2,D) :- D is sqrt((X2-X1)**2 + (Y2-Y1)**2).


	unitCost("Zerg Drone", 50, 0).
	unitCost("Zerg Zergling", 50, 0).
	unitCost("Zerg Overlord", 100, 0).
	unitCost("Zerg Hydralisk",100,50).
	
	