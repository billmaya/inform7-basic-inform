[ Basic Inform test case code ]
[ File: BIP-TextReplacement.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	showme whether or not "fish" exactly matches the text "FIsH";
	showme whether or not "fish" exactly matches the text "FIsH", case insensitively;
	showme whether or not "Go fish!" matches the text "fish";
	showme whether or not "I WANT MY FISH" matches the text "fish", case insensitively;
	showme the number of times "Bananagrams to Alpaca" matches the text "a";
	showme the number of times "Bananagrams to Alpaca" matches the text "a", case insensitively;
	run test A;
	run test B;
	run test C;
	run test D;

To run test A:
	let Neptune be text;
	let Neptune be "The capture of Triton may explain a number of features of the Neptunian system, including the extremely eccentric orbit of Neptune's moon Nereid and the scarcity of moons as compared to the other gas giants.";
	say "The original text: [Neptune][line break]";
	replace word number 7 in Neptune with "banana"; 
	say "The intermediate text: [Neptune][line break]";
	replace word number 22 in Neptune with "pineapple daiquiri"; 
	say "The intermediate text: [Neptune][line break]";
	replace character number 5 in Neptune with "z"; 
	say "The intermediate text: [Neptune][line break]";
	replace character number 50 in Neptune with "(abcdef)"; 
	say "The redacted text: [Neptune][line break]".

To run test B:
	let Neptune be text;
	let Neptune be "The capture of Triton may explain a number of features of the Neptunian system, including the extremely eccentric orbit of Neptune's moon Nereid and the scarcity of moons as compared to the other gas giants.";
	say "The original text: [Neptune][line break]";
	replace the text "the" in Neptune with "potato"; 
	replace the text "giants." in Neptune with "turtles?"; 
	say "The redacted text: [Neptune][line break]".

To run test C:
	let Neptune be text;
	let Neptune be "the capture of Triton may explain a number of features of the Neptunian system, including the extremely eccentric orbit of Neptune's moon Nereid and the scarcity of moons as compared to the other gas giants.";
	say "The original text: [Neptune][line break]";
	replace the word "the" in Neptune with "potato"; 
	replace the word "system" in Neptune with "frog"; 
	say "The redacted text: [Neptune][line break]".

To run test D:
	let Neptune be text;
	let Neptune be "The capture of Triton may explain a number of features of the Neptunian system, including the extremely eccentric orbit of Neptune's moon Nereid and the scarcity of moons as compared to the other gas giants.";
	say "The original text: [Neptune][line break]";
	replace the punctuated word "system," in Neptune with "toad";
	replace the punctuated word "." in Neptune with "!"; 
	say "The redacted text: [Neptune][line break]".