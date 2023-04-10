[ Basic Inform test case code ]
[ File: BIP-Decide.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To decide which number is the magic number:
	decide on 417.

To decide if (N - number) pleases us:
	decide yes.

To decide if (N - number) displeases us:
	decide no.

To demonstrate stop:
	say "I begin.";
	stop;
	say "I do not continue.";

A fruit is a kind of object. An apple, a pear and an orange are fruits.

Definition: a fruit is tasty:
	decide yes.

To begin:
	showme the magic number;
	showme whether or not 31 pleases us;
	showme whether or not -417 displeases us;
	showme whether or not a fruit is tasty;
	demonstrate stop;