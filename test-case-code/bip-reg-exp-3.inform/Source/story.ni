[ Basic Inform test case code ]
[ File: BIP-RegExp3.txt ]
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
"ab|cd"	0	0	"abc"	"y"	"[match 0]"	"ab"	"$&"
"ab|cd"	0	0	"abcd"	"y"	"[match 0]"	"ab"	"$&"
"()ef"	0	0	"def"	"y"	"[match 0]-[match 1]"	"ef-"	"$&-$1"
"()ef"	0	0	"def"	"y"	"[match start pos 0]"	"1"	"$-[0]"
"()ef"	0	0	"def"	"y"	"[match end pos 0]"	"3"	"$+[0]"
"()ef"	0	0	"def"	"y"	"[match start pos 1]"	"1"	"$-[1]"
"()ef"	0	0	"def"	"y"	"[match end pos 1]"	"1"	"$+[1]"
"*a"	0	0	"-"	"c"	"[match end pos 1]"	"Quantifier follows nothing"	"-"
"(*)b"	0	0	"-"	"c"	"[match end pos 1]"	"Quantifier follows nothing"	"-"
"$b"	0	0	"b"	"n"	"[match end pos 1]"	"-"	"-"
"a\"	0	0	"-"	"c"	"[match end pos 1]"	"Search pattern not terminated"	"-"
"a\(b"	0	0	"a(b"	"y"	"[match 0]-[match 1]"	"a(b-"	"$&-$1"
"a\(*b"	0	0	"ab"	"y"	"[match 0]"	"ab"	"$&"
"a\(*b"	0	0	"a((b"	"y"	"[match 0]"	"a((b"	"$&"
"a\\b"	0	0	"a\b"	"y"	"[match 0]"	"a\b"	"$&"
"abc)"	0	0	"-"	"c"	"[match 0]"	"Unmatched )"	"-"
"(abc"	0	0	"-"	"c"	"[match 0]"	"Unmatched ("	"-"
"((a))"	0	0	"abc"	"y"	"[match 0]-[match 1]-[match 2]"	"a-a-a"	"$&-$1-$2"
"((a))"	0	0	"abc"	"y"	"[match start pos 0]-[match start pos 1]-[match start pos 2]"	"0-0-0"	"$-[0]-$-[1]-$-[2]"
"((a))"	0	0	"abc"	"y"	"[match end pos 0]-[match end pos 1]-[match end pos 2]"	"1-1-1"	"$+[0]-$+[1]-$+[2]"
"(a)b(c)"	0	0	"abc"	"y"	"[match 0]-[match 1]-[match 2]"	"abc-a-c"	"$&-$1-$2"
"(a)b(c)"	0	0	"abc"	"y"	"[match start pos 0]-[match start pos 1]-[match start pos 2]"	"0-0-2"	"$-[0]-$-[1]-$-[2]"
"(a)b(c)"	0	0	"abc"	"y"	"[match end pos 0]-[match end pos 1]-[match end pos 2]"	"3-1-3"	"$+[0]-$+[1]-$+[2]"
"a+b+c"	0	0	"aabbabc"	"y"	"[match 0]"	"abc"	"$&"
"a{1,}b{1,}c"	0	0	"aabbabc"	"y"	"[match 0]"	"abc"	"$&"
"a**"	0	0	"-"	"c"	"[match 0]"	"Nested quantifiers"	"-"
"a.+?c"	0	0	"abcabc"	"y"	"[match 0]"	"abc"	"$&"
"(a+|b)*"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"ab-b"	"$&-$1"
"(a+|b)*"	0	0	"ab"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"(a+|b)*"	0	0	"ab"	"y"	"[match end pos 0]"	"2"	"$+[0]"
"(a+|b)*"	0	0	"ab"	"y"	"[match start pos 1]"	"1"	"$-[1]"
"(a+|b)*"	0	0	"ab"	"y"	"[match end pos 1]"	"2"	"$+[1]"
"(a+|b){0,}"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"ab-b"	"$&-$1"
"(a+|b)+"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"ab-b"	"$&-$1"
"(a+|b){1,}"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"ab-b"	"$&-$1"
"(a+|b)?"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"a-a"	"$&-$1"
"(a+|b){0,1}"	0	0	"ab"	"y"	"[match 0]-[match 1]"	"a-a"	"$&-$1"
")("	0	0	"-"	"c"	"[match 0]-[match 1]"	"Unmatched )"	"-"
"<^ab>*"	0	0	"cde"	"y"	"[match 0]"	"cde"	"$&"
"abc"	0	0	""	"n"	"[match 0]"	"-"	"-"
"a*"	0	0	""	"y"	"[match 0]"	""	"$&"
"(<abc>)*d"	0	0	"abbbcd"	"y"	"[match 0]-[match 1]"	"abbbcd-c"	"$&-$1"
"(<abc>)*bcd"	0	0	"abcd"	"y"	"[match 0]-[match 1]"	"abcd-a"	"$&-$1"
"a|b|c|d|e"	0	0	"e"	"y"	"[match 0]"	"e"	"$&"
"(a|b|c|d|e)f"	0	0	"ef"	"y"	"[match 0]-[match 1]"	"ef-e"	"$&-$1"
"(a|b|c|d|e)f"	0	0	"ef"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"(a|b|c|d|e)f"	0	0	"ef"	"y"	"[match end pos 0]"	"2"	"$+[0]"
"(a|b|c|d|e)f"	0	0	"ef"	"y"	"[match start pos 1]"	"0"	"$-[1]"
"(a|b|c|d|e)f"	0	0	"ef"	"y"	"[match end pos 1]"	"1"	"$+[1]"
"abcd*efg"	0	0	"abcdefg"	"y"	"[match 0]"	"abcdefg"	"$&"
"ab*"	0	0	"xabyabbbz"	"y"	"[match 0]"	"ab"	"$&"
"ab*"	0	0	"xayabbbz"	"y"	"[match 0]"	"a"	"$&"
"(ab|cd)e"	0	0	"abcde"	"y"	"[match 0]-[match 1]"	"cde-cd"	"$&-$1"
"<abhgefdc>ij"	0	0	"hij"	"y"	"[match 0]"	"hij"	"$&"
"^(ab|cd)e"	0	0	"abcde"	"n"	"[match 0]"	"xy"	"x$1y"
"(abc|)ef"	0	0	"abcdef"	"y"	"[match 0]-[match 1]"	"ef-"	"$&-$1"
"(a|b)c*d"	0	0	"abcd"	"y"	"[match 0]-[match 1]"	"bcd-b"	"$&-$1"
"(ab|ab*)bc"	0	0	"abc"	"y"	"[match 0]-[match 1]"	"abc-a"	"$&-$1"
"a(<bc>*)c*"	0	0	"abc"	"y"	"[match 0]-[match 1]"	"abc-bc"	"$&-$1"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match 0]-[match 1]-[match 2]"	"abcd-bc-d"	"$&-$1-$2"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match start pos 1]"	"1"	"$-[1]"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match end pos 1]"	"3"	"$+[1]"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match start pos 2]"	"3"	"$-[2]"
"a(<bc>*)(c*d)"	0	0	"abcd"	"y"	"[match end pos 2]"	"4"	"$+[2]"
"a(<bc>+)(c*d)"	0	0	"abcd"	"y"	"[match 0]-[match 1]-[match 2]"	"abcd-bc-d"	"$&-$1-$2"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match 0]-[match 1]-[match 2]"	"abcd-b-cd"	"$&-$1-$2"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match start pos 1]"	"1"	"$-[1]"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match end pos 1]"	"2"	"$+[1]"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match start pos 2]"	"2"	"$-[2]"
"a(<bc>*)(c+d)"	0	0	"abcd"	"y"	"[match end pos 2]"	"4"	"$+[2]"
"a<bcd>*dcdcde"	0	0	"adcdcde"	"y"	"[match 0]"	"adcdcde"	"$&"
"a<bcd>+dcdcde"	0	0	"adcdcde"	"n"	"[match 0]"	"-"	"-"
"(ab|a)b*c"	0	0	"abc"	"y"	"[match 0]-[match 1]"	"abc-ab"	"$&-$1"
"(ab|a)b*c"	0	0	"abc"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"(ab|a)b*c"	0	0	"abc"	"y"	"[match end pos 0]"	"3"	"$+[0]"
"(ab|a)b*c"	0	0	"abc"	"y"	"[match start pos 1]"	"0"	"$-[1]"
"(ab|a)b*c"	0	0	"abc"	"y"	"[match end pos 1]"	"2"	"$+[1]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match 1]-[match 2]-[match 3]-[match 4]"	"abc-a-b-d"	"$1-$2-$3-$4"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match end pos 0]"	"4"	"$+[0]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match start pos 1]"	"0"	"$-[1]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match end pos 1]"	"3"	"$+[1]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match start pos 2]"	"0"	"$-[2]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match end pos 2]"	"1"	"$+[2]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match start pos 3]"	"1"	"$-[3]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match end pos 3]"	"2"	"$+[3]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match start pos 4]"	"3"	"$-[4]"
"((a)(b)c)(d)"	0	0	"abcd"	"y"	"[match end pos 4]"	"4"	"$+[4]"
"<a-zA-Z_><a-zA-Z0-9_>*"	0	0	"alpha"	"y"	"[match 0]"	"alpha"	"$&"
"^a(bc+|b<eh>)g|.h$"	0	0	"abh"	"y"	"[match 0]-[match 1]"	"bh-"	"$&-$1"
"(bc+d$|ef*g.|h?i(j|k))"	0	0	"effgz"	"y"	"[match 0]-[match 1]-[match 2]"	"effgz-effgz-"	"$&-$1-$2"
"(bc+d$|ef*g.|h?i(j|k))"	0	0	"ij"	"y"	"[match 0]-[match 1]-[match 2]"	"ij-ij-j"	"$&-$1-$2"
"(bc+d$|ef*g.|h?i(j|k))"	0	0	"effg"	"n"	"[match 0]-[match 1]-[match 2]"	"-"	"-"
"(bc+d$|ef*g.|h?i(j|k))"	0	0	"bcdd"	"n"	"[match 0]-[match 1]-[match 2]"	"-"	"-"
"(bc+d$|ef*g.|h?i(j|k))"	0	0	"reffgz"	"y"	"[match 0]-[match 1]-[match 2]"	"effgz-effgz-"	"$&-$1-$2"
"((((((((((a))))))))))"	0	0	"a"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"((((((((((a))))))))))"	0	0	"a"	"y"	"[match end pos 0]"	"1"	"$+[0]"
"(((((((((a)))))))))"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"multiple words of text"	0	0	"uh-uh"	"n"	"[match 0]"	"-"	"-"
"multiple words"	0	0	"multiple words, yeah"	"y"	"[match 0]"	"multiple words"	"$&"
"(.*)c(.*)"	0	0	"abcde"	"y"	"[match 0]-[match 1]-[match 2]"	"abcde-ab-de"	"$&-$1-$2"
"\((.*), (.*)\)"	0	0	"(a, b)"	"y"	"([match 2], [match 1])"	"(b, a)"	"($2, $1)"
"<k>"	0	0	"ab"	"n"	"([match 2], [match 1])"	"-"	"-"
"a<->?c"	0	0	"ac"	"y"	"[match 0]"	"ac"	"$&"
"(abc)\1"	0	0	"abcabc"	"y"	"[match 1]"	"abc"	"$1"
"(<a-c>*)\1"	0	0	"abcabc"	"y"	"[match 1]"	"abc"	"$1"
"\1"	0	0	"-"	"c"	"[match 1]"	"Reference to nonexistent group"	"-"
"\2"	0	0	"-"	"c"	"[match 1]"	"Reference to nonexistent group"	"-"
"(a)|\1"	0	0	"a"	"y"	"-"	"-"	"-"
"(a)|\1"	0	0	"x"	"n"	"-"	"-"	"-"
"(a)|\2"	0	0	"-"	"c"	"-"	"Reference to nonexistent group"	"-"
"((<a-c>)b*?\2)*"	0	0	"ababbbcbc"	"y"	"[match 0]-[match 1]-[match 2]"	"ababb-bb-b"	"$&-$1-$2"
"((<a-c>)b*?\2){3}"	0	0	"ababbbcbc"	"y"	"[match 0]-[match 1]-[match 2]"	"ababbbcbc-cbc-c"	"$&-$1-$2"
"((\3|b)\2(a)x)+"	0	0	"aaxabxbaxbbx"	"n"	"[match 0]-[match 1]-[match 2]"	"-"	"-"
"((\3|b)\2(a)x)+"	0	0	"aaaxabaxbaaxbbax"	"y"	"[match 0]-[match 1]-[match 2]-[match 3]"	"bbax-bbax-b-a"	"$&-$1-$2-$3"
"((\3|b)\2(a)){2,}"	0	0	"bbaababbabaaaaabbaaaabba"	"y"	"[match 0]-[match 1]-[match 2]-[match 3]"	"bbaaaabba-bba-b-a"	"$&-$1-$2-$3"
"(a)|(b)"	0	0	"b"	"y"	"[match start pos 0]"	"0"	"$-[0]"
"(a)|(b)"	0	0	"b"	"y"	"[match end pos 0]"	"1"	"$+[0]"
"(a)|(b)"	0	0	"b"	"y"	"x[match start pos 1]"	"x"	"x$-[1]"
"(a)|(b)"	0	0	"b"	"y"	"x[match end pos 1]"	"x"	"x$+[1]"
"(a)|(b)"	0	0	"b"	"y"	"[match start pos 2]"	"0"	"$-[2]"
"(a)|(b)"	0	0	"b"	"y"	"[match end pos 2]"	"1"	"$+[2]"
"abc"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"abc"	1	0	"XBC"	"n"	"[match 0]"	"-"	"-"
"abc"	1	0	"AXC"	"n"	"[match 0]"	"-"	"-"
"abc"	1	0	"ABX"	"n"	"[match 0]"	"-"	"-"
"abc"	1	0	"XABCY"	"y"	"[match 0]"	"ABC"	"$&"
"abc"	1	0	"ABABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab*c"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab*bc"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab*bc"	1	0	"ABBC"	"y"	"[match 0]"	"ABBC"	"$&"
"ab*?bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab{0,}?bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab+?bc"	1	0	"ABBC"	"y"	"[match 0]"	"ABBC"	"$&"
"ab+bc"	1	0	"ABC"	"n"	"[match 0]"	"-"	"-"
"ab+bc"	1	0	"ABQ"	"n"	"[match 0]"	"-"	"-"
"ab{1,}bc"	1	0	"ABQ"	"n"	"[match 0]"	"-"	"-"
"ab+bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab{1,}?bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab{1,3}?bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab{3,4}?bc"	1	0	"ABBBBC"	"y"	"[match 0]"	"ABBBBC"	"$&"
"ab{4,5}?bc"	1	0	"ABBBBC"	"n"	"[match 0]"	"-"	"-"
"ab??bc"	1	0	"ABBC"	"y"	"[match 0]"	"ABBC"	"$&"
"ab??bc"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab{0,1}?bc"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab??bc"	1	0	"ABBBBC"	"n"	"[match 0]"	"-"	"-"
"ab??c"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"ab{0,1}?c"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"^abc$"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"^abc$"	1	0	"ABCC"	"n"	"[match 0]"	"-"	"-"
"^abc"	1	0	"ABCC"	"y"	"[match 0]"	"ABC"	"$&"
"^abc$"	1	0	"AABC"	"n"	"[match 0]"	"-"	"-"
"abc$"	1	0	"AABC"	"y"	"[match 0]"	"ABC"	"$&"