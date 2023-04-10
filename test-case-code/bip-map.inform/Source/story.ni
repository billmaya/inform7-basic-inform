[ Basic Inform test case code ]
[ File: BIP-Map.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Colour is a kind of value. The colours are red, indigo and chartreuse.

Weight is a kind of value. 5kg specifies a weight.

To decide what number is double (N - a number) (this is doubling):
	decide on N plus N.

To decide what number is the square of (N - a number) (this is squaring):
	decide on N times N.

To decide what text is the longhand form of (N - a number) (this is spelling out):
	decide on "[N in words]".

To decide what text is the consonant form of (T - text) (this is txtng):
	replace the regular expression "<aeiou>" in T with "", case insensitively;
	decide on T.

To decide what number is the larger of (N - number) and (M - number) (this is maximizing):
	if N > M, decide on N;
	decide on M.

To decide what number is the sum of (N - number) and (M - number) (this is summing):
	decide on N + M.

To decide what text is the concatenation of (X - text) and (Y - text) (this is concatenation):
	decide on "[X][Y]".

Joint magnitude relates a number (called N) to a number (called M) when N plus M is greater than 7.

Definition: an text (called T) is lengthy if the number of characters in it is greater than 6.

To decide which number is the length of (T - an text) (this is length extraction):
	decide on the number of characters in T.

To begin:
	showme joint magnitude relation;
	showme txtng;
	showme maximizing;
	showme doubling applied to 2;
	showme txtng applied to spelling out applied to doubling applied to { 3, 8, 4, 19, 7 };
	showme the maximizing reduction of { 3, 8, 4, 19, 7 };
	showme the filter to even numbers of { 3, 8, 4, 19, 7 };
	showme the maximizing reduction of { -3, -8, -4, -19, -7 };
	showme the summing reduction of { 3, 8, 4, 19, 7 };
	showme the concatenation reduction of spelling out applied to { 3, 8, 4, 19, 7 };
	showme the filter to lengthy texts of spelling out applied to { 3, 8, 4, 19, 7 };
	showme filter to lengthy texts of spelling out applied to {15, 2, 20, 29, -4};
	showme the filter to negative numbers of {-2, -1, 0, 1, 2, 4, 7}.