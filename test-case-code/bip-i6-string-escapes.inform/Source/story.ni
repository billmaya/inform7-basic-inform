[ Basic Inform test case code ]
[ File: I6StringEscapes-G.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Include (-
[ JunkFn;
	print (char) '^', " might be a caret, who knows.^";
	print (address) 'x^', " might be an x', who knows.^";
	print (address) '^//', " might be a ', who knows.^";
	print (char) '@ss', " might be an @ss, who knows.^";
	print (address) 'x@ss', " might be an x@ss, who knows.^";
	print (char) '@{0041}', " might be an A, who knows.^";
	print (address) 'x@{0041}', " might be an xA, who knows.^";
	print "Les @oeuvres d'@AEsop en fran@,cais, mon @'el@`eve!^";
	print "Na@:ive readers of the New Yorker re@:elected Mr Clinton.^";
	print "Gau@ss first proved the Fundamental Theorem of Algebra.^";
	print "@'a@'e@'i@'o@'u@'y@'A@'E@'I@'O@'U@'Y@`a@`e@`i@`o@`u@`A@`E@`I@`O@`U@^a@^e@^i@^o@^u@^A@^E@^I@^O@^U@:a@:e@:i@:o@:u@:y@:A@:E@:I@:O@:U@:Y^";
	print "@~a@~n@~o@~A@~N@~O@,c@,C@\o@\O@ae@AE@et@Et@th@Th@LL@!!@??@<<@>>@ss@oa@oA@oe@OE^";
	print "So @{a9} is a copyright sign, and @{424} is a capital Cyrillic ef, and @{25B2} is a triangle^";
	print "Backslash: @@92 At sign: @@64 Caret: @@94 Tilde: @@126^";
];
-).

To gojunk: (- JunkFn(); -).

To begin:
	gojunk.
