[ Basic Inform test case code ]
[ File: ListBasedRules.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Blob is a list of numbers based rulebook.
First blob rule for a list of numbers (called L): say "I now apply blob to [L]."
Blob rule for empty lists of numbers: say "It's empty!".
Blob rule for { 2, 4 }: say "It's the magic one!"
Blob rule: say "It's a list, anyway."

To begin:
	follow blob rules for { 1, 17, 2 };
	follow blob rules for { 2, 4 };
	follow blob rules for { };