[ Basic Inform test case code ]
[ File: IndirectCallsInInclusions.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	perform the test.

To perform the test: (- beta(); -)

To expostulate mildly about (N - a number) (this is the irked function):
	say "I do think this is a pity, given [N]."

To expostulate firmly (this is the riled function):
	say "Oh really! This is too much!"

Include (-
[ alpha;
print "alpha called^";
];

[beta n plugh;
print "beta called^";
alpha();
plugh = alpha;
plugh();

((+ irked function +)-->1)(7);
((+ irked function +)-->1)(22);
((+ riled function +)-->1)();
];
-)
