[ Basic Inform test case code ]
[ File: BIP-RealAdjectives-G.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To assay (R - a real number):
	say "Now testing R = [R].";
	showme whether or not R is positive;
	showme whether or not R is negative;
	showme whether or not R is infinite;
	showme whether or not R is finite;
	showme whether or not R is nonexistent;
	showme whether or not R is existent;

To begin:
	assay pi;
	assay -1 times pi;
	let R be 1.0 divided by 0.0;
	assay R;
	let R2 be -1.0 divided by 0.0;
	assay R2;
