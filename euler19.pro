% 1 Jan 1900 was a Monday.
% Thirty days has September,
% April, June and November.
% All the rest have thirty-one,
% Saving February alone,
% Which has twenty-eight, rain or shine.
% And on leap years, twenty-nine.
% A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

%How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

range(I,I,[I]).
range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).
inrange(S,E,N) :- range(S,E,L),member(N,L).

sublist([H|T],H,[H|T]).
sublist([H|T],I,SL) :- sublist(T,I,SL).

days(D) :- D = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'].
months(M) :- M = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'].

leap(Y) :- 0 is mod(Y,4), ((X is mod(Y,100), X \= 0);(0 is mod(Y,400))).

thirty(M) :- MM = ['Apr','Jun','Sep','Nov'], member(M,MM).
thirtyone(M) :- MM = ['Jan','Mar','May','Jul','Aug','Oct','Dec'], member(M,MM).

febdays(Y,29) :- leap(Y).
febdays(Y,28) :- not(leap(Y)).

daysinmonth(Y,M,31) :- thirtyone(M).
daysinmonth(Y,M,D) :- M = 'Feb',febdays(Y,D). 
daysinmonth(Y,M,30) :- thirty(M).

daysinyear(Y,[],TD,TD).
daysinyear(Y,[M|MM],D,TD) :- daysinmonth(Y,M,D1),DN is D + D1,daysinyear(Y,MM,DN,TD). 
daysinyear(Y,TD) :- months(MM),daysinyear(Y,MM,0,TD).


term(DT,DY).

addterm(DT,DY,A,AA) :- (DT \= 1; DY \= 'Sun'),A = AA.
addterm(DT,DY,A,AA) :- T = term(DT,DY),DT = 1,DY = 'Sun',append(A,[T],AA).

%addterm(DT,DY,A,AA) :- T = term(DT,DY),append(A,[T],AA).

dates(D,D,[],'Mon',TT,TT).
dates(D,D,[ND|_],ND,TT,TT).
dates(D,CD,[],ND,TA,TT)      :- D \= CD, CD1 is CD + 1,days([DY|RD]), addterm(CD1,DY,TA,TAA),dates(D,CD1,RD,ND,TAA,TT). %,write(CD1),nl
dates(D,CD,[DY|RD],ND,TA,TT) :- D \= CD, CD1 is CD + 1, addterm(CD1,DY,TA,TAA), dates(D,CD1,RD,ND,TAA,TT). %,write(CD1),nl,write(TAA),nl
dates(D,DY,ND,TT) :- days(DYS),sublist(DYS,DY,RD),dates(D,0,RD,ND,[],TT). %,write(RD),nl. 

%write(Y),write(M),write(D),write(DY),write(NT),nl

dayatend(Y,[],ND,ND,TT,TT).
dayatend(Y,[M|MM],DY,ND,TA,TT) :- daysinmonth(Y,M,D),dates(D,DY,NT,TAA),append(TA,TAA,A),dayatend(Y,MM,NT,ND,A,TT).
dayatend(Y,DY,ND,TT) :-months(MM),dayatend(Y,MM,DY,ND,[],TT).

browse([],_,TT,TT).
browse([Y|YY],DY,A,TT) :- dayatend(Y,DY,ND,TTA),append(A,TTA,AA),browse(YY,ND,AA,TT).
browse(S,E,DY,TT) :- range(S,E,YY),browse(YY,DY,[],TT).

solve(I,DY,S,E,L) :- dayatend(I,DY,ND,_),browse(S,E,ND,TT),length(TT,L).