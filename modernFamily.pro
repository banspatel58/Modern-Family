parent(jay, mitchell).

parent(jay, claire).

parent(jay, joe).

parent(jay, manny).

parent(gloria, joe).

parent(gloria, manny).

parent(cameron, lily).

parent(mitchell, lily).

parent(claire, haley).

parent(claire, alex).

parent(claire, luke).

parent(phil, haley).

parent(phil, alex).

parent(phil, luke).



female(gloria).

female(lily).

female(claire).

female(haley).

female(alex).

male(manny).

male(jay).

male(cameron).

male(mitchell).

male(phil).

male(luke).

male(joe).



mother(Person1, Person2) :-

	female(Person1),

	parent(Person1, Person2).



father(Person1, Person2) :-

	male(Person1),

	parent(Person1, Person2).



sibling(Person1, Person2) :-

	parent(X, Person1),

	parent(X, Person2),

	not(Person1 = Person2).



partner(Person1, Person2) :-

	parent(Person1, X),

	parent(Person2, X),

	not(Person1 = Person2).



grandmother(Person1, Person2) :-

	(mother(Person1, X),

	parent(X, Person2));



	(female(Person1),
	partner(Person1, X),

	parent(X, Y),

	parent(Y, Person2)).



grandfather(Person1, Person2) :-

	(father(Person1, X),

	parent(X, Person2));


	
(male(Person1),
	partner(Person1, X),

	parent(X, Y),

	parent(Y, Person2)).



aunt(Person1, Person2) :-

	female(Person1),

	((sibling(Person1, X),

	parent(X, Person2));


	
(partner(Person1, X),

	sibling(X, Y),

	parent(Y, Person2))).



uncle(Person1, Person2) :-

	male(Person1),

	((sibling(Person1, X),

	parent(X, Person2));


	
(partner(Person1, X),

	sibling(X, Y),

	parent(Y, Person2))).



niece(Person1, Person2) :-

	female(Person1),

	(aunt(Person2, Person1);
	uncle(Person2, Person1)).



nephew(Person1, Person2) :-

	male(Person1),

	(aunt(Person2, Person1);

	uncle(Person2, Person1)).



cousin(Person1, Person2) :-

	parent(X, Person1),

	sibling(X, Y),

	parent(Y, Person2).

