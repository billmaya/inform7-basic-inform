[ Basic Inform test case code ]
[ File: BIP-ListLength.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	let M be a list of numbers;
	add 2 to M; add 3 to M; add 5 to M; add 7 to M; add 11 to M;
	extend M to 5 entries;
	say "Extending M to 5 entries should not change it: [M in brace notation].";
	extend M to 7 entries;
	say "Extending M to 7 entries should add two 0s: [M in brace notation].";
	truncate M to 8 entries;
	say "Truncating M to 8 entries should make no difference: [M in brace notation].";
	truncate M to 4 entries;
	say "Truncating M to 4 entries should change it: [M in brace notation].";
	truncate M to the last 2 entries;
	say "Truncating M to the last 2 entries should certainly change it: [M in brace notation].";