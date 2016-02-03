
oper(A,B,C,O) :- C is (A + B), O = '+'.
oper(A,B,C,O) :- C is (A - B), O = '-'.
oper(A,B,C,O) :- C is (A * B), O = '*'.
oper(A,B,C,O) :- C is (A / B), O = '/'.

find(2016,0,OP,OP).
find(Z,N,[H|R],OP) :- N > 0,oper(Z,N,NR,O),N2 is N - 1,find(NR,N2,[O,H|R],OP).
find(N,OP) :- N1 is N - 1,N2 is N - 2,oper(N,N1,R,O), find(R,N2,[O],RR),reverse(RR,OP).