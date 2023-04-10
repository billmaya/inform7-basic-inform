[ Basic Inform test case code ]
[ File: Replacement.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Include (-

+replacing(keeping) Constant QUARTER_HOUR = (2 * replaced`QUARTER_HOUR);

+replacing(keeping) [ SquareRoot num x;
	x = replaced`SquareRoot(num);
	if (x*x < num) x++;
	return x;
];

[ ShowRSS;
	print "QUARTER_HOUR = ", QUARTER_HOUR, "^";
	print "replaced`QUARTER_HOUR = ", replaced`QUARTER_HOUR, "^";
];

-).

To show QUARTER_HOUR: (- ShowRSS(); -).

To begin:
	show QUARTER_HOUR;
	showme the square root of 16;
	showme the square root of 17;
	showme the square root of 25;