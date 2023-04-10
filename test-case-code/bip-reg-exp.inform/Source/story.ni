[ Basic Inform test case code ]
[ File: BIP-RegExp.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

The lower bound is a number that varies. The upper bound is a number that varies.

To begin:
	now lower bound is 1;
	now upper bound is the number of rows in the Table of Perl Test Cases;
	say "Complete test set.";
	repeat with N running from lower bound to upper bound
	begin;
		run single test N;
	end repeat;
	say "Batch complete."

To debug mode (N - a number): (- TEXT_TY_RE_SetTrace({N}); -).
To decide if a regexp error occurred: (- (((TEXT_TY_RE_Err<0) || (TEXT_TY_RE_Err>=32))) -).

To decide what text is regexp error message: (- (TEXT_TY_RE_Err) -).

To say match (N - number):
	say text matching subexpression N.

To say match start pos (N - number):
	(- if (TEXT_TY_MV_End({N},0) >= 0) print TEXT_TY_MV_End({N},0); -).

To say match end pos (N - number):
	(- if (TEXT_TY_MV_End({N},1) >= 0) print TEXT_TY_MV_End({N},1); -).

To test-compile the regular expression (T - text):
	(- TEXT_TY_RE_CompileTree({-by-reference:T});
	if ((TEXT_TY_RE_Err<0) || (TEXT_TY_RE_Err>=32)) print "Error returned: ", (string) TEXT_TY_RE_Err, "^";
	else TEXT_TY_RE_Err = 0;
	-).

To compile single test (N - a number):
	if N is greater than the number of rows in the Table of Perl Test Cases, stop;
	choose row N in the Table of Perl Test Cases;
	if outcome entry is "c",
		say "test [N]: compiling [pattern entry] should produce error [resultant entry].";
	otherwise
		say "test [N]: compiling [pattern entry] should work.";
	test-compile the regular expression pattern entry.

To say casing of (N - a number):
	if N is 1, say "insensitive";
	otherwise say "sensitive".

To say number of rewinds:
	(- TEXT_TY_RE_PrintNoRewinds(); -).

To run single test (N - a number):
	if N is greater than the number of rows in the Table of Perl Test Cases, stop;
	choose row N in the Table of Perl Test Cases;
	if outcome entry is "c"
	begin;
		say "test [N]: compiling [pattern entry] to error [resultant entry] --> ";
	otherwise if outcome entry is "r";
		say "test [N]: replacing [pattern entry] in [target entry] with '!' case [casing of insens entry] --> ";
	otherwise;
		say "test [N]: matching [pattern entry] in [target entry] case [casing of insens entry] --> ";
	end if;
	let failure be 0;
	let match be 0;
	let EXP be an text;
	if exactly entry is 1
	begin;
		if insens entry is 1
		begin;
			if target entry exactly matches the regular expression pattern entry, case insensitively
				begin;
				let match be 1;
				let EXP be expand entry;
			end if;
		otherwise;
			if target entry exactly matches the regular expression pattern entry
				begin;
				let match be 1;
				let EXP be expand entry;
			end if;
		end if;
	otherwise;
		if insens entry is 1
		begin;
			if the outcome entry is "r"
			begin;
				let EXP be the target entry;
				replace the regular expression pattern entry in EXP with "!", case insensitively;
			otherwise;
			if target entry matches the regular expression pattern entry, case insensitively
			begin;
				let match be 1;
				let EXP be expand entry;
			end if;
			end if;
		otherwise;
			if the outcome entry is "r"
			begin;
				let EXP be the target entry;
				replace the regular expression pattern entry in EXP with "!";
			otherwise;
			if target entry matches the regular expression pattern entry
			begin;
				let match be 1;
				let EXP be expand entry;
			end if;
			end if;
		end if;
	end if;
	let EXP be the substituted form of EXP;
	if a regexp error occurred, let failure be 1;
	otherwise say "<[number of rewinds]> ";
	if outcome entry is "c"
	begin;
		let failure be 1;
		if a regexp error occurred, let failure be 0;
	otherwise if outcome entry is "y";
		if match is 0, let failure be 1;
		if match is 1 and EXP is not resultant entry, let failure be 1;
	otherwise if outcome entry is "n";
		if match is 1, let failure be 1;
	otherwise if outcome entry is "r";
		if EXP is not resultant entry, let failure be 1;
	end if;
	if outcome entry is "r"
	begin;
		say "[resultant entry][line break]";
	otherwise;
		if match is 1, say "[text matching regular expression][line break]";
		if match is 0 and outcome entry is not "c", say "--[line break]";
	end if;
	if failure is 1
	begin;
		say "[bold type]FAILED[roman type] - should have ";
		if outcome entry is "n", say "failed to match";
		if outcome entry is "r", say "produced replacement [resultant entry]";
		if outcome entry is "y", say "had result of [perl form entry] equal to [resultant entry]";
		if outcome entry is "c", say "failed to compile with error [resultant entry]";
		say line break;
	end if.

Table of Perl Test Cases
pattern	insens	exactly	target	outcome	expand	resultant	perl form
"abc"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"abc"	0	0	"abc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"abc"	0	0	"abc"	"y"	"[match end pos 0]"	"3"	"$+[0]"
"abc"	0	0	"xbc"	"n"	"[match end pos 0]"	"-"	"-"
"abc"	0	0	"axc"	"n"	"[match end pos 0]"	"-"	"-"
"abc"	0	0	"abx"	"n"	"[match end pos 0]"	"-"	"-"
"abc"	0	0	"xabcy"	"y"	"[match 0]"	"abc"	"$&"
"abc"	0	0	"xabcy"	"y"	"[match start pos 0]"	"1"	"$-[0]"
"abc"	0	0	"xabcy"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"abc"	0	0	"ababc"	"y"	"[match 0]"	"abc"	"$&"
"abc"	0	0	"ababc"	"y"	"[match start pos 0]"	"2"	"$-[0]"
"abc"	0	0	"ababc"	"y"	"[match end pos 0]"	"5"	"$+[0]"
"ab*c"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"ab*c"	0	0	"abc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab*c"	0	0	"abc"	"y"	"[match end pos 0]"	"3"	"$+[0]"
"ab*bc"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"ab*bc"	0	0	"abc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab*bc"	0	0	"abc"	"y"	"[match end pos 0]"	"3"	"$+[0]"
"ab*bc"	0	0	"abbc"	"y"	"[match 0]"	"abbc"	"$&"
"ab*bc"	0	0	"abbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab*bc"	0	0	"abbc"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"ab*bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab*bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab*bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
".{1}"	0	0	"abbbbc"	"y"	"[match 0]"	"a"	"$&"
".{1}"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
".{1}"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"1"	"$+[0]"
".{3,4}"	0	0	"abbbbc"	"y"	"[match 0]"	"abbb"	"$&"
".{3,4}"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
".{3,4}"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"ab{0,}bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab{0,}bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab{0,}bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
"ab+bc"	0	0	"abbc"	"y"	"[match 0]"	"abbc"	"$&"
"ab+bc"	0	0	"abbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab+bc"	0	0	"abbc"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"ab+bc"	0	0	"abc"	"n"	"[match end pos 0]"	"-"	"-"
"ab+bc"	0	0	"abq"	"n"	"[match end pos 0]"	"-"	"-"
"ab{1,}bc"	0	0	"abq"	"n"	"[match end pos 0]"	"-"	"-"
"ab+bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab+bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab+bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
"ab{1,}bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab{1,}bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab{1,}bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
"ab{1,3}bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab{1,3}bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab{1,3}bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
"ab{3,4}bc"	0	0	"abbbbc"	"y"	"[match 0]"	"abbbbc"	"$&"
"ab{3,4}bc"	0	0	"abbbbc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"ab{3,4}bc"	0	0	"abbbbc"	"y"	"[match end pos 0]"	"6"	"$+[0]"
"ab{4,5}bc"	0	0	"abbbbc"	"n"	"[match end pos 0]"	"-"	"-"
"ab?bc"	0	0	"abbc"	"y"	"[match 0]"	"abbc"	"$&"
"ab?bc"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"ab{0,1}bc"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"ab?bc"	0	0	"abbbbc"	"n"	"[match 0]"	"-"	"-"
"ab?c"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"ab{0,1}c"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"^abc$"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"^abc$"	0	0	"abcc"	"n"	"[match 0]"	"-"	"-"
"^abc"	0	0	"abcc"	"y"	"[match 0]"	"abc"	"$&"
"^abc$"	0	0	"aabc"	"n"	"[match 0]"	"-"	"-"
"abc$"	0	0	"aabc"	"y"	"[match 0]"	"abc"	"$&"
"abc$"	0	0	"aabcd"	"n"	"[match 0]"	"-"	"-"
"^"	0	0	"abc"	"y"	"[match 0]"	""	"$&"
"$"	0	0	"abc"	"y"	"[match 0]"	""	"$&"
"a.c"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"a.c"	0	0	"axc"	"y"	"[match 0]"	"axc"	"$&"
"a.*c"	0	0	"axyzc"	"y"	"[match 0]"	"axyzc"	"$&"
"a.*c"	0	0	"axyzd"	"n"	"[match 0]"	"-"	"-"
"a<bc>d"	0	0	"abc"	"n"	"[match 0]"	"-"	"-"
"a<bc>d"	0	0	"abd"	"y"	"[match 0]"	"abd"	"$&"
"a<b-d>e"	0	0	"abd"	"n"	"[match 0]"	"-"	"-"
"a<b-d>e"	0	0	"ace"	"y"	"[match 0]"	"ace"	"$&"
"a<b-d>"	0	0	"aac"	"y"	"[match 0]"	"ac"	"$&"
"a<-b>"	0	0	"a-"	"y"	"[match 0]"	"a-"	"$&"
"a<b->"	0	0	"a-"	"y"	"[match 0]"	"a-"	"$&"
"a<b-a>"	0	0	"-"	"c"	"[match 0]"	"Invalid <> range 'b-a'"	"-"
"a<>b"	0	0	"-"	"c"	"[match 0]"	"Unmatched <"	"-"
"a<"	0	0	"-"	"c"	"[match 0]"	"Unmatched <"	"-"
"a>"	0	0	"a>"	"y"	"[match 0]"	"a>"	"$&"
"a<>>b"	0	0	"a>b"	"y"	"[match 0]"	"a>b"	"$&"
"a<^bc>d"	0	0	"aed"	"y"	"[match 0]"	"aed"	"$&"
"a<^bc>d"	0	0	"abd"	"n"	"[match 0]"	"-"	"-"
"a<^-b>c"	0	0	"adc"	"y"	"[match 0]"	"adc"	"$&"
"a<^-b>c"	0	0	"a-c"	"n"	"[match 0]"	"-"	"-"
"a<^>b>c"	0	0	"a>c"	"n"	"[match 0]"	"-"	"-"
"a<^>b>c"	0	0	"adc"	"y"	"[match 0]"	"adc"	"$&"
"\ba\b"	0	0	"a-"	"y"	"-"	"-"	"-"
"\ba\b"	0	0	"-a"	"y"	"-"	"-"	"-"
"\ba\b"	0	0	"-a-"	"y"	"-"	"-"	"-"
"\by\b"	0	0	"xy"	"n"	"-"	"-"	"-"
"\by\b"	0	0	"yz"	"n"	"-"	"-"	"-"
"\by\b"	0	0	"xyz"	"n"	"-"	"-"	"-"
"\Ba\B"	0	0	"a-"	"n"	"-"	"-"	"-"
"\Ba\B"	0	0	"-a"	"n"	"-"	"-"	"-"
"\Ba\B"	0	0	"-a-"	"n"	"-"	"-"	"-"
"\By\b"	0	0	"xy"	"y"	"-"	"-"	"-"
"\By\b"	0	0	"xy"	"y"	"[match start pos 0]"	"1"	"$-[0]"
"\By\b"	0	0	"xy"	"y"	"[match end pos 0]"	"2"	"$+[0]"
"\By\b"	0	0	"xy"	"y"	"-"	"-"	"-"
"\by\B"	0	0	"yz"	"y"	"-"	"-"	"-"
"\By\B"	0	0	"xyz"	"y"	"-"	"-"	"-"
"\w"	0	0	"a"	"y"	"-"	"-"	"-"
"\w"	0	0	"-"	"n"	"-"	"-"	"-"
"\W"	0	0	"a"	"n"	"-"	"-"	"-"
"\W"	0	0	"-"	"y"	"-"	"-"	"-"
"a\sb"	0	0	"a b"	"y"	"-"	"-"	"-"
"a\sb"	0	0	"a-b"	"n"	"-"	"-"	"-"
"a\Sb"	0	0	"a b"	"n"	"-"	"-"	"-"
"a\Sb"	0	0	"a-b"	"y"	"-"	"-"	"-"
"\d"	0	0	"1"	"y"	"-"	"-"	"-"
"\d"	0	0	"-"	"n"	"-"	"-"	"-"
"\D"	0	0	"1"	"n"	"-"	"-"	"-"
"\D"	0	0	"-"	"y"	"-"	"-"	"-"
"<\w>"	0	0	"a"	"y"	"-"	"-"	"-"
"<\w>"	0	0	"-"	"n"	"-"	"-"	"-"
"<\W>"	0	0	"a"	"n"	"-"	"-"	"-"
"<\W>"	0	0	"-"	"y"	"-"	"-"	"-"
"a<\s>b"	0	0	"a b"	"y"	"-"	"-"	"-"
"a<\s>b"	0	0	"a-b"	"n"	"-"	"-"	"-"
"a<\S>b"	0	0	"a b"	"n"	"-"	"-"	"-"
"a<\S>b"	0	0	"a-b"	"y"	"-"	"-"	"-"
"<\d>"	0	0	"1"	"y"	"-"	"-"	"-"
"<\d>"	0	0	"-"	"n"	"-"	"-"	"-"
"<\D>"	0	0	"1"	"n"	"-"	"-"	"-"
"<\D>"	0	0	"-"	"y"	"-"	"-"	"-"