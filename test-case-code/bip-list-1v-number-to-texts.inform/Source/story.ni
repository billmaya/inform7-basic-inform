[ Basic Inform test case code ]
[ File: List1VNumberToTexts.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Fubar relates one number to various texts.
the verb to foo means the fubar relation.
27 foos "a".
27 foos "a2".
1 foos "b".
2 foos "a".
2 foos "c".

To bar (n - a number):
	say "Texts that [n] relates to...";
	repeat with t running through the list of texts that n relates to by the fubar relation:
		showme t.

To begin:
	bar 27;
	bar 1;
	bar 2;
	bar 3;