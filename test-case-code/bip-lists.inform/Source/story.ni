[ Basic Inform test case code ]
[ File: BIP-Lists.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

A fruit is a kind of object.

An apple, a pear and an orange are fruits.

A fruit can be bright or dull. An orange is bright.

To begin:
	let L be a list of numbers;
	say "L is initially [L in brace notation].";
	add 11 to L;
	say "L is now [L in brace notation].";
	add 7 to L;
	add 200 to L;
	add 5 to L;
	add -6 to L;
	add 0 to L;
	say "L is now [L in brace notation].";
	add 5 to L, if absent;
	say "Adding 5 if absent should make no difference: [L in brace notation].";
	say "Entry 2 of L is [entry 2 of L].";
	now entry 3 of L is 104;
	say "After changing entry 3 to 104, L is now [L in brace notation].";
	now entry 3 of L is 208;
	say "After changing entry 3 to 208, L is now [L in brace notation].";
	now entry 1 of L is 1;
	now entry 6 of L is 6;
	say "After changing the two end entries, L is now [L in brace notation].";
	say "These, however, should fail as being out of range.";
	now entry 0 of L is 104;
	now entry 7 of L is 104;
	add 208 to L;
	say "L now contains two instances of 208: [L in brace notation].";
	remove 208 from L;
	say "Both of which go after removing this value: [L in brace notation].";
	let M be a list of numbers;
	add 2 to M; add 3 to M; add 5 to M; add 7 to M; add 11 to M;
	add M to L;
	say "Adding [M in brace notation] to L gives [L in brace notation].";
	remove M from L;
	say "Removing the same set then gives [L in brace notation].";
	let N be a list of numbers;
	add 7 to N; add 11 to N; add 5 to N; add 16 to N;
	add N to M, if absent;
	say "Adding [N in brace notation] to M, if absent, gives [M in brace notation].";
	add 1001 at entry 3 in M;
	say "Adding 1001 at entry 3 gives [M in brace notation].";	
	remove entry 2 from M;
	say "Removing entry 2 gives [M in brace notation].";	
	remove entries 2 to 4 from M;
	say "Removing entries 2 to 4 gives [M in brace notation].";	
	showme whether or not 71 is listed in M;
	showme whether or not 16 is listed in M;
	showme whether or not 71 is not listed in M;
	showme whether or not 16 is not listed in M;
	showme the list of fruits;
	showme the list of dull fruits;