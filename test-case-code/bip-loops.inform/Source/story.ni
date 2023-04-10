[ Basic Inform test case code ]
[ File: BIP-Loops.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Colour is a kind of value. The colours are red, orange, yellow, green, blue, indigo, violet.

Table of Neptune's Moons
moon		surface (text)
"Nereid"	"utterly unknown"
"Triton"	"cryovolcanic ridges"
"Proteus"	"highly irregular and sooty"
--			--

To begin:
	let N be 31;
	while N is not 1:
		showme N;
		if N is even:
			now N is N divided by 2;
		otherwise:
			now N is N times 3 plus 1;
	repeat with M running from 1 to 5:
		showme M;
	repeat with C running from orange to indigo:
		showme C;
	repeat with C2 running through colours:
		showme C2;
	repeat with K running through { 2, 3, 5, 7, 11, 13 }:
		showme K;
	say "First run.";
	repeat through the Table of Neptune's Moons:
		say "[moon entry] has a surface best described as [surface entry].";
	say "Second run.";
	repeat through the Table of Neptune's Moons in reverse order:
		say "[moon entry] has a surface best described as [surface entry].";
	say "Third run.";
	repeat through the Table of Neptune's Moons in surface order:
		say "[moon entry] has a surface best described as [surface entry].";
	say "Fourth run.";
	repeat through the Table of Neptune's Moons in reverse surface order:
		say "[moon entry] has a surface best described as [surface entry].";