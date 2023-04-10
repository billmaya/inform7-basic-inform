[ Basic Inform test case code ]
[ File: CompareText.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To say z: say "z".
To say doublez: say "zz".

To begin:
	let flag be whether or not "xyzzy" is "xyzzy";
	say "Case 1: [flag].";
	let flag be whether or not "xyzzy" is "xy[z]zy";
	say "Case 2: [flag].";
	let flag be whether or not "xy[z]zy" is "xyzzy";
	say "Case 3: [flag].";
	let flag be whether or not "xy[z]zy" is "xy[z]zy";
	say "Case 4: [flag].";
	let flag be whether or not "xy[z][z]y" is "xy[doublez]y";
	say "Case 5: [flag].";