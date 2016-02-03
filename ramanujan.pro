pint(X) :- integer(X), X > 0.

unique(_,[]).
unique(Y,[HD|TL]) :- Y =\= HD,unique(Y,TL),unique(HD,TL).
 
range(I,I,[I]).
range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).

cube(X,Y) :- Y is X * X * X.

prn(X):-write(X),nl.
prn(X,Y):-write(X),write('->'),write(Y),nl.

maxn(R,S,X,Y):- R > S, Y is X - 1.
maxn(R,S,X,Y):- R < S, X1 is X + 1,cube(X1,X3),maxn(X3,S,X1,Y).
maxn(S,Y) :- maxn(1,S,1,Y).

distinct([]).
distinct([X|XS]):- not(member(X,XS)),distinct(XS).

inrange(S,N) :- maxn(S,X),range(1,X,L),member(N,L).

%rama1(X,Y,S):- unique(X,[Y]),nums(X,S),nums(Y,S),cube(X,X1),cube(Y,Y1),S is X1 + Y1.

%rama(P,Q,X,Y,S):- unique(X,[Y,P,Q]),nums(P,S),nums(Q,S),nums(X,S),nums(Y,S),cube(X,X1),cube(Y,Y1),S is X1 + Y1,cube(P,P1),cube(Q,Q1),S is P1 + Q1.

rama(P,Q,S):- inrange(S,P),inrange(S,Q),cube(P,P3),cube(Q,Q3),S is P3 + Q3.

ram(X,Y,P,Q,S):- rama(X,Y,S),rama(P,Q,S),distinct([X,Y,P,Q]).
%


