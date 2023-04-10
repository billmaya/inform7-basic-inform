[ Basic Inform test case code ]
[ File: BIP-ListOperations.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

A fruit is a kind of object.

An apple, a pear and an orange are fruits. A fruit has a number called size.

The size of a fruit is usually 4. The size of the apple is 7. The size of the pear is 6.

To begin:
	let L be { 16, 3, 5, -7, 11, -7, 0, 2 };
	say "L is [L in brace notation].";
	reverse L;
	say "L reverses to [L in brace notation].";
	sort L;
	say "L sorts to [L in brace notation].";
	reverse L;
	say "L then reverses to [L in brace notation].";
	rotate L;
	say "L then rotates to [L in brace notation].";
	rotate L backwards;
	say "L then rotates backwards to [L in brace notation].";
	sort L in random order;
	say "L sorts randomly to [L in brace notation].";
	sort L in reverse order;
	say "L sorts in reverse order to [L in brace notation].";
	let F be the list of fruits;
	showme F;
	sort F in size order;
	say "F sorts in size order to [F in brace notation].";
	sort F in reverse size order;
	say "F sorts in reverse size order to [F in brace notation].";