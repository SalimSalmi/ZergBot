 :- dynamic
condition/1,
minerals/1,
gas/1,
builder/0,
gathering/0,
mineralField/4,
constructionSite/2,
workerActivity/2,
self/2,
chokepoint/2,
base/4,
friendly/6,
unitAmount/2,
hatcheryPosition/2,
sendDrone/1,
chat/0,
morph/3,
myPos/2,
otherPos/3,
isMorphing/2,
extractor/3.

	% Indicates when agent is busy gathering
	busy :- condition(List), member(gathering, List).
	
	% The cost of declared buildings (for every new building add the cost here)	
	cost("Zerg Spawning Pool", 200, 0).
	cost("Zerg Hatchery", 300, 0).
	cost("Zerg Creep Colony", 75, 0).
	cost("Zerg Extractor",50,0).
	cost("Zerg Hydralisk Den",100,100).
	
	
	% default distance check				
	distance(X1,Y1,X2,Y2,D) :- D is sqrt((X2-X1)**2 + (Y2-Y1)**2).
	
	closestOther(X1,Y1, D) :- otherPos(_,X2,Y2), distance(X1,Y1, X2, Y2,D2), D > D2.
	
	%closestBuildLoc(X, Y) :- hatcheryPosition(Xh, Yh), constructionSite(X, Y), distance(X, Y, Xh, Yh, D),
	%			constructionSite(X2, Y2), not(X==X2), not(Y==Y2), distance(X2, Y2, Xh, Yh, D2), not(D > D2).
	
	
	closestBuildLoc(X,Y) :- hatcheryPosition(Xh, Yh), constructionSite(X, Y), distance(X, Y, Xh, Yh, D), not(otherdistances(D)).
	
	otherdistances(D) :- constructionSite(X2, Y2), hatcheryPosition(Xh, Yh), distance(X2,Y2, Xh, Yh,D2), D>D2. 
				
	% example code for gas gathering handling
	shouldMineVespene :- unitAmount("Zerg Extractor",RefCount),
			     NeededWorkers is RefCount * 2,
			     aggregate_all(count, workerActivity(_,gatheringGas), Count),
			     Count < NeededWorkers.
									