[ Basic Inform test case code ]
[ File: Repeat1VTextToNumbers.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

xyz relates one text to various numbers.
The verb to abc means the xyz relation.

Alphabet is always {"a","b","c","d","e","f","g","h","i","j","k"}.

To begin:
	let x be 0;
	repeat with i running through alphabet:
		say "i: [i] x: [x].";
		now i abcs x;
		increment x;