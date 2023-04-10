[ Basic Inform test case code ]
[ File: Namespaces.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Include (-

+namespace(Alpha);

	Constant EXAMPLE = 20;

	[ greet;
		summon();
		print "greet in Alpha^";
		ponder();
		main`ponder();
		dismiss();
		Beta`dismiss();
	];

	[ dismiss;
		print "dismiss in Alpha, where EXAMPLE = ", EXAMPLE, "^";
	];

	[ ponder;
		print "ponder in Alpha^";
	];

+namespace(Beta);

	[ dismiss;
		print "dismiss in Beta^";
	];

+namespace(main);

	Constant EXAMPLE = 10;

	[ summon;
		print "summon in main where Alpha`EXAMPLE = ", Alpha`EXAMPLE, "^";
	];

	[ dismiss;
		print "dismiss in main^";
	];

	[ ponder;
		print "ponder in main^";
	];

-).

To run the test: (-
	Alpha`greet();
	print "Here are the dismiss functions:^";
	Alpha`dismiss();
	Beta`dismiss();
	dismiss();
	print "The value of EXAMPLE here is ", EXAMPLE, "^";
-).

To begin:
	run the test;