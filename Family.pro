parent(jay, claire).
parent(jay, joe).
parent(claire, alex).

female(alex).
female(claire).
male(joe).
male(jay).

father(Person1, Person2):-

	male(Person1),
	parent(Person1, Person2).
	
grandfather(Person1, Person2):-

	(father(Person1, X),
	parent(X, Person2);
	
	(male(Person1),
	partner(Person1, X),

	parent(X, Y),

	parent(Y, Person2)).
	