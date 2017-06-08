/*=============================================================================================
PLAN:
	- represent each house as a list of 5 elements
		ex. [color,nationality,drink,cigar,pet]
	- represent all houses as a list of 5 elements
=============================================================================================*/


/*=================================== KNOWLEDGE BASE =========================================*/
/***********************************************************************************************
DEFINITION of built in function append:
 	append([],L,L). 																		(A1)
 	append([H|T],L2,[H|L3])  :-  append(T,L2,L3).										    (A2)

EXPLANATION:
	append(L1,L2,L3).	
		-> yes, if list L3 is concatenation of lists L1 in L2 in that order
		-> no, else
	(A1) concatenating empty list with list L gives list L.
	(A2) where H represents list's head (first element) and T it's tail (list of other elements),
		 [H|L3] is a concatenation of [H|T] and L2 if L3 is concatenation of T and L2.
************************************************************************************************/


/*DEFINITION of functions for determining ordered neighbours and general neighbours:************/
	ordered_neighbours(X,Y,L) :- append(_,[X,Y|_],L).								     /*(N1)*/
	general_neighbours(X,Y,L) :- ordered_neighbours(X,Y,L);						
							     ordered_neighbours(Y,X,L).			     				 /*(N2)*/	       
/************************************************************************************************
EXPLANATION:
	ordered_neighbours(X,Y,L).
		-> yes, if in list L there are elements X,Y right next to each other, in that order
		-> no, else  
	(N1) satisfied if List is concatenation of 'anylist' and list with elements: X,Y,any,...
	general_neighbours(X,Y,L).
		-> yes, if in list L there are elements X,Y right next to each other, in any order
		-> no, else  
	(N2) satisfied if X,Y satisfy ordered_neighbours(X,Y,L) or ordered_neighbours(Y,X,L).
************************************************************************************************/


/***********************************************************************************************
DEFINITION of built-in function member
	member(X,[X|T]). 																	    (M1)
	member(X,[H|T])  :-  member(X,T).														(M2)

EXPLANATION:
	member(X,L).
		-> yes, if X is an element of list L
		-> no, else
	(M1) X is member of list with first element X.
	(M2) where H represents list's head (first element) and T it's tail (list of other elements),
		 X is a member of list if it's a member of it's tail.
************************************************************************************************/

/*DEFINITION of a function for determining length of list**************************************/
	len([],0). 																			/*(L1)*/
  	len([_|T],N)  :-  len(T,X),  N  is  X+1.											/*(L2)*/
/***********************************************************************************************
EXPLANATION:
	len(L,N).
		-> yes, if L is a list with N elements
		-> no, else
	(L1) empty list has 0 elements
	(L2) where _ represents (any) first element and T list's tail (list of other elements),
		 N is length of tail + 1.
************************************************************************************************/

/***********************************************************************************************
Now we write formula for a problem's solution directly using above definitions: 
[color, nationality, drink, cigar, pet]			
***********************************************************************************************/

solution(Houses) :-
  len(Houses,5),
  member([red,brit,_,_,_],Houses),
  member([_,swede,_,_,dogs],Houses), 
  member([_,dane,tea,_,_],Houses),
  ordered_neighbours([green,_,_,_,_],[white,_,_,_,_],Houses),
  member([green,_,coffee,_,_],Houses),
  member([_,_,_,pall_mall,birds],Houses),
  member([yellow,_,_,dunhill,_],Houses),
  Houses = [_,_,[_,_,milk,_,_],_,_],
  member([_,norwegian,_,_,_],Houses),
  Houses = [[_,norwegian,_,_,_],_,_,_,_],
  general_neighbours([_,_,_,blends,_],[_,_,_,_,cats],Houses),
  general_neighbours([_,_,_,_,horses],[_,_,_,dunhill,_],Houses),
  member([_,_,beer,bluemasters,_],Houses),
  member([_,german,_,prince,_],Houses),
  general_neighbours([_,norwegian,_,_,_],[blue,_,_,_,_],Houses),
  general_neighbours([_,_,_,blends,_],[_,_,water,_,_],Houses),
  member([_,_,_,_,fish],Houses).

person(X) :-
	solution(H),
	member([_,X,_,_,fish],H).
	



