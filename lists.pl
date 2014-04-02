incr1([],[]).
incr1([H1|T1],[H2|T2]) :- H2 is H1+1,
                          incr1(T1,T2).

append1([],L,L).
append1([H|L1],L2,[H|L3]) :- append1(L1,L2,L3).

reverse1([],[]).
reverse1([H|T],L) :- reverse1(T,L1),
                     append1(L1,[H],L).

remdup([],[]).
remdup([H|T],L) :- member1(H,T),
                   !, 
                   remdup(T,L).
remdup([H|T],[H|L1]) :- remdup(T,L1).

member1(X,[X|_]).
member1(X,[_|T]) :- member1(X,T).

% assume that the lists have unique elements
union([],Y,Y).
union([H|T],Y,Z) :- member1(H,Y),
                    !,
                    union(T,Y,Z).
union([H|T],Y,[H|Z]) :- union(T,Y,Z).

intersection([],_,[]).
intersection([H|T],Y,[H|Z]) :- member1(H,Y),
                            !,
                            intersection(T,Y,Z).
intersection([_|T],Y,Z) :- intersection(T,Y,Z).
