[ Basic Inform test case code ]
[ File: BIP-If.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To check (V - a number):
	if V is:
		-- 1:
			say "One.";
		-- 2:
			say "Two.";
		-- otherwise:
			say "Something larger."

To begin:
	if 1 is 1:
		say "Yes, 1 is 1.";
	otherwise:
		say "No, 1 is not 1.";
	unless 1 is 1:
		say "No, 1 is not 1.";
	otherwise:
		say "Yes, 1 is 1.";
	if 1 is 1:
		say "Yes, 1 is 1.";
	else:
		say "No, 1 is not 1.";
	check 1;
	check 2;
	check 3;