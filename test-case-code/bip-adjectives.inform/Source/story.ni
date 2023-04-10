[ Basic Inform test case code ]
[ File: BIP-Adjectives.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To assay (N - a number):
	say "Now testing N = [N].";
	showme whether or not N is positive;
	showme whether or not N is negative;
	showme whether or not N is even;
	showme whether or not N is odd;

To assay the list (L - a list of values of kind K):
	say "Now testing L = [L in brace notation].";
	showme whether or not L is empty;
	showme whether or not L is non-empty;

To assay the text (T - a text):
	say "Now testing T = [T].";
	showme whether or not T is empty;
	showme whether or not T is non-empty;
	showme whether or not T is substituted;
	showme whether or not T is unsubstituted;

To assay the table (T - a table name):
	say "Now testing T = [T].";
	showme whether or not T is empty;
	showme whether or not T is non-empty;
	showme whether or not T is full;
	showme whether or not T is non-full;

To assay the rulebook (R - a rulebook):
	say "Now testing R = [R].";
	showme whether or not R is empty;
	showme whether or not R is non-empty;

To assay the option (U - a use option):
	say "Now testing U = [U].";
	showme whether or not U is active;
	showme whether or not U is inactive;

To assay the verb (V - a verb):
	say "Now testing V = [V].";
	showme whether or not V is modal;
	showme whether or not V is non-modal;
	showme whether or not V is meaningful;
	showme whether or not V is meaningless;

Commenting on something is an activity on numbers.

Rule for commenting on an even number:
	showme whether or not commenting on activity is going on;

Table of Completed Numbers
numeric		alphabetic
4			"four"
3			"three"

Table of Selected Numbers
numeric		alphabetic
4			"four"
3			"three"
154			"one hundred and fifty-four"
27			"twenty-seven"
9			"nine"
with 4 blank rows

Table of Unselected Numbers
numeric		alphabetic
with 4 blank rows

Inspecting is a rulebook.

Grading is a rulebook.
Grading: say "No!" instead.

To prognosticate is a verb.

To begin:
	assay -3;
	assay 0;
	assay 4;
	assay 31767;
	assay the text "peach";
	assay the text "";
	assay the table Table of Completed Numbers;
	assay the table Table of Selected Numbers;
	assay the table Table of Unselected Numbers;
	assay the list {1, 2, 3};
	let L be a list of numbers;
	assay the list L;
	showme whether or not commenting on activity is going on;
	carry out the commenting on activity with 4;
	showme whether or not inspecting rules are empty;
	assay the rulebook inspecting rules;
	assay the rulebook grading rules;
	assay the option ineffectual option;
	assay the option predictable randomisation option;
	assay the verb the verb might;
	assay the verb the verb prognosticate;
	assay the verb the verb have;