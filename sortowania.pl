in2sorted([],X,[X]).
in2sorted([H|T],X,W) :-
	H>X,
	W = [X|[H|T]].
in2sorted([H|T],X,W) :-
	H=<X,
	in2sorted(T,X,W1),
	W=[H|W1].

insertsort([],[]).
insertsort([H|T],Wy) :-
	insertsort(T,Wy1),
	in2sorted(Wy1,H,Wy).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

swap([],[]).
swap([X],[X]).
swap([X,Y|T],Wy) :-
	X =< Y,
	swap([Y|T],Wy1),
	Wy = [X|Wy1].
swap([X,Y|T],Wy) :-
	X > Y,
	Wy = [Y,X|T].

bubblesort(We,Wy) :-
	swap(We,Wy),
	We=Wy.
bubblesort(We,Wy) :-
	swap(We,Wy1),
	We\=Wy1,
	bubblesort(Wy1,Wy).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

polowki([],[],[]).
polowki([X],[X],[]).
polowki(We,Le,Pr) :-
	append([H|T],[X],We),
	polowki(T,Le1,Pr1),
	Le=[H|Le1],
	append(Pr1,[X],Pr).

mergex([],L,L):- !.
mergex(L,[],L).
mergex([X|T1],[Y|T2],[X|T3]):-
	X<Y,!,
	mergex(T1,[Y|T2],T3).
mergex(L1,[Y|T2],[Y|T3]):-
	mergex(L1,T2,T3).

mergesort([X],[X]) :- !.
mergesort(We,Wy) :-
	polowki(We,L,P),
	mergesort(L,L1),
	mergesort(P,P1),
	mergex(L1,P1,Wy).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split([],_,[],[]).
split([H|T],X,M,W) :-
	split(T,X,M1,W1),
	H<X,
	M=[H|M1],
	W=W1.
split([H|T],X,M,W) :-
	split(T,X,M1,W1),
	H>=X,
	M=M1,
	W=[H|W1].

quicksort([],[]) :- !.
quicksort([X],[X]) :- !.
quicksort([HWe|TWe],Wy) :-
	split(TWe,HWe,M,W),
	quicksort(M,M1),
	quicksort(W,W1),
	append(M1,[HWe|W1],Wy).

















