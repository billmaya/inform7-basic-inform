[ Basic Inform test case code ]
[ File: BIP-SayIf.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	say "It seems [if 1 is 1]1 is 1[otherwise]1 is not 1[end if].";
	say "It seems [if 2 is 3]2 is 3[otherwise]2 is not 3[end if].";
	say "It seems [unless 1 is 1]1 is not 1[otherwise]1 is 1[end if].";
	say "It seems [unless 2 is 3]2 is not 3[otherwise]2 is 3[end unless].";
	say "It seems [if 1 is 3]1 is 3[otherwise if 2 is 3]2 is 3[otherwise]3 is 3[end if].";
	say "It seems [if 1 is 2]1 is 2[otherwise if 2 is 2]2 is 2[otherwise]3 is 2[end if].";