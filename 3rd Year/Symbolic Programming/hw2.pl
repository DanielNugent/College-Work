% --- Q1 ---
s --> [2].
s --> u(Zeros), [2], v(Ones), {Zeros is 2*Ones}.

u(0) --> [].
u(Zeros) --> [0], u(Z), {Zeros is Z+1}.
u(Zeros) --> [1], u(Zeros).

v(0) --> [].
v(Ones) --> [1], v(O), {Ones is O+1}.
v(Ones) --> [0], v(Ones).

% --- Q2 ---
street -->  house(Col1,Nat1,Pet1), house(Col2,Nat2,Pet2), house(Col3,Nat3,Pet3),
			{Col1\=Col2}, {Col2\=Col3}, {Col1\=Col3},
			{Nat1\=Nat2}, {Nat2\=Nat3}, {Nat1\=Nat3},
			{Pet1\=Pet2}, {Pet2\=Pet3}, {Pet1\=Pet3}.

house(Colour, Nation, Pet) --> [Colour],{lex(Colour, col)}, [Nation],{lex(Nation, nat)}, [Pet],{lex(Pet, pet)}.

lex(red, col).
lex(blue, col). 
lex(green, col).

lex(english, nat).
lex(japanese, nat).
lex(spanish, nat).

lex(snail, pet).
lex(jaguar, pet).
lex(zebra, pet).

% --- Q3 ---
mkList(1,[1]).
mkList(N, [N|T]) :- N > 1, N1 is N - 1, mkList(N1, T).

listSum(N) --> [N].
listSum(N) --> {mkList(N, L)},{member(Num,L)}, {Rest is N - Num}, {Rest > 0},[Num], listSum(Rest).