:- dynamic
done/2,
drone/2,
ready/1,
hatcheryPosition/2,
currentSupply/2,
sendDrone/3,
batch/3,
unit/2.

alive([],0).
alive([Id|T],N) :- unit(_,Id), alive(T,N2), N is N2 + 1.
alive([Id|T],N) :- not(unit(_,Id)), alive(T,N).

