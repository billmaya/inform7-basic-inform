[ Basic Inform test case code ]
[ File: BIP-SayParagraphing.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	say "This has a[line break]sudden line break.[line break]";
	say "There's no skipped line above this one.[no line break]";
	say " And we didn't break a line just then.";
	say "But here's a paragraph break.[paragraph break]";
	say "And here I resume.[run paragraph on]";
	say "[conditional paragraph break]";
	say "There wasn't a para break before this line.";
	say "[conditional paragraph break]";
	say "But there was before this line.";
	say "[paragraph break]";
	showme whether or not a paragraph break is pending;
	say "Now I say something, and ";
	showme whether or not a paragraph break is pending;