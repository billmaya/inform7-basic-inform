[ Basic Inform test case code ]
[ File: BIP-Tables.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Table of Neptune's Moons
moon		surface (text)
"Nereid"	"utterly unknown"
"Triton"	"cryovolcanic ridges"
"Proteus"	"highly irregular and sooty"
--			--

To begin:
	showme the contents of the Table of Neptune's Moons;
	choose row 2 in the Table of Neptune's Moons;
	say "The surface of [moon entry] is [surface entry].";
	choose row 3 in the Table of Neptune's Moons;
	say "We seem to find [the current table row].";
	choose a random row in the Table of Neptune's Moons;
	say "The surface of [moon entry] is [surface entry].";
	let the sought value be "utterly unknown";
	showme whether or not the sought value is a surface listed in the Table of Neptune's Moons;
	showme moon entry;
	showme surface entry;
	choose the row with moon column of "Triton" in the Table of Neptune's Moons;
	showme moon entry;
	showme surface entry;
	showme the number of rows in the Table of Neptune's Moons;
	showme the number of blank rows in the Table of Neptune's Moons;
	showme the number of filled rows in the Table of Neptune's Moons;
	choose a blank row in the Table of Neptune's Moons;
	now the moon entry is "Dolcelatte";
	now the surface entry is "surprisingly aromatic";
	showme the contents of the Table of Neptune's Moons;
	showme the number of rows in the Table of Neptune's Moons;
	showme the number of blank rows in the Table of Neptune's Moons;
	showme the number of filled rows in the Table of Neptune's Moons;
	showme whether or not there is a moon of "Dolcelatte" in the Table of Neptune's Moons;
	showme whether or not there is a moon of "Dione" in the Table of Neptune's Moons;
	showme whether or not there is no moon of "Dolcelatte" in the Table of Neptune's Moons;
	showme whether or not there is no moon of "Dione" in the Table of Neptune's Moons;
	showme the surface corresponding to a moon of "Proteus" in the Table of Neptune's Moons;
	say "Row 2 looks like [row 2 in the Table of Neptune's Moons].";
	say "Row 2 looks like [row 2 from the Table of Neptune's Moons].";
	say "Column 2 looks like [surface column in the Table of Neptune's Moons].";
	blank out the surface corresponding to a moon of "Proteus" in the Table of Neptune's Moons;
	showme the contents of the Table of Neptune's Moons;
	choose row 3 in the Table of Neptune's Moons;
	blank out the whole row;
	showme the contents of the Table of Neptune's Moons;
	blank out the whole moon column of the Table of Neptune's Moons;
	showme the contents of the Table of Neptune's Moons;
	blank out the whole of the Table of Neptune's Moons;
	showme the contents of the Table of Neptune's Moons;