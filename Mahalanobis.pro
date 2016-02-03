
sum([],S,S).
sum([H|T],I,S) :- I1 is I + H, sum(T,I1,S).
sum(L,S) :- sum(L,0,S).  

range(I,I,[I]).
range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).


house(N,X,MX) :- range(1,MX,L),
					member(N,L),
					range(1,N,NL),
					member(X,NL),
					X1 is X - 1,
					X2 is X + 1,
					range(1,X1,L1),
					range(X2,N,L2),
					sum(L1,S1),
					sum(L2,S2),
					S1 = S2.