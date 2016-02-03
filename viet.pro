otn(X)  :- member(X,[1,2,3,4,5,6,7,8,9]).

%chk(A,B,C,D,E,F,G,H,I) :- not(A = B),not(B = C),not(C = D),not(D = E),not(E = F),not(F = G),not(G = H),not(H = I).

%print(Y),print(' '),print(HD),print(';'),

unique(_,[]).
unique(Y,[HD|TL]) :- not(Y == HD),unique(Y,TL),unique(HD,TL).

distinct([]).
distinct([X|XS]):- not(member(X,XS)),distinct(XS).

cand(A,B,C,D,E,F,G,H,I,R) :-
otn(A),
otn(B),
otn(C),
otn(D),
otn(E),
otn(F),
otn(G),
otn(H),	
otn(I), 
distinct([A,B,C,D,E,F,G,H,I]),
R is A + 13 * B / C + D + 12 * E - F - 11 +  G * H / I - 10.

/*

R = 66,

cand(A,B,C,R) :- otn(A),otn(B),otn(C),R is A + B + C.*/




