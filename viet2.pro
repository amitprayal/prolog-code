otn(X)  :- member(X,[1,2,3,4,5,6,7,8,9]).

otx(X,L)  :- otn(X),not(member(X,L)).

distinct([]).
distinct([X|XS]):- not(member(X,XS)),distinct(XS).

set([],S,S).
set([H|T],A,S) :- not(member(H,T)),append(A,[H],AA),set(T,AA,S).
set([H|T],A,S) :- member(H,T),set(T,A,S).
set(L,S):- set(L,[],S).

range(I,I,[I]).
range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).

num(X,N) :- range(1,N,L),member(X,L).

%chk(A,B,C,D,E,F,G,H,I) :- not(A = B),not(B = C),not(C = D),not(D = E),not(E = F),not(F = G),not(G = H),not(H = I).


%print(Y),print(' '),print(HD),print(';'),

unique(_,[]).
unique(Y,[HD|TL]) :- not(Y == HD),unique(Y,TL),unique(HD,TL).

%cand(5,4,1,9,2,7,3,8,6,66).
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
R is A + ((13 * B) / C) + D + (12 * E) - F - 11 +  ((G * H) / I) - 10.

/*cand(A,B,C,R) :- otn(A),otn(B),otn(C),R is A + B + C.*/

nofrac(N,D,R) :- S is mod(N,D), S = 0, R is  N/D.

test(B,C,R) :- num(B,9),num(C,9), B \= C,nofrac(B*13,C,R),R =< 93.
bvalues(S) :- findall(B,test(B,_,_),BB),set(BB,S),member(B,S).
cvalues(S) :- findall(C,test(_,C,_),CC),set(CC,S),member(C,S).

test1(G,H,I,R) :- num(G,9),num(H,9),num(I,9), G \= H, H \= I,G \= I,nofrac(G*H,I,R),R =< 93.
ivalues(S) :- findall(I,test1(_,_,I,_),II),set(II,S),member(I,S).


viet2(A,B,C,D,E,F,G,H,I) :-
	bvalues(BB),cvalues(CC),member(B,BB),member(C,CC), B \= C,
	ivalues(II),member(I,II),B \= I, C \= I,
	nofrac(B*13,C,M1),
	L = [B,C,I],
	otx(A,L),    
	otx(D,L),
	otx(E,L),E =< 5, 
	otx(F,L),
	otx(G,L),
	otx(H,L),
	nofrac((G * H),I,M3),
	distinct([A,D,E,F,G,H]),
	
	M2 is (12 * E),
	87 is  A + D + M1 + M2 + M3  - F ,
	write(M1),write(' '),write(M2),write(' '),write(M3),nl.




