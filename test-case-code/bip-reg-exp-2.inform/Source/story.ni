[ Basic Inform test case code ]
[ File: BIP-RegExp2.txt ]
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
"^"	1	0	"ABC"	"y"	"[match 0]"	""	"$&"
"$"	1	0	"ABC"	"y"	"[match 0]"	""	"$&"
"a.c"	1	0	"ABC"	"y"	"[match 0]"	"ABC"	"$&"
"a.c"	1	0	"AXC"	"y"	"[match 0]"	"AXC"	"$&"
"a.*?c"	1	0	"AXYZC"	"y"	"[match 0]"	"AXYZC"	"$&"
"a.*c"	1	0	"AXYZD"	"n"	"[match 0]"	"-"	"-"
"a<bc>d"	1	0	"ABC"	"n"	"[match 0]"	"-"	"-"
"a<bc>d"	1	0	"ABD"	"y"	"[match 0]"	"ABD"	"$&"
"a<b-d>e"	1	0	"ABD"	"n"	"[match 0]"	"-"	"-"
"a<b-d>e"	1	0	"ACE"	"y"	"[match 0]"	"ACE"	"$&"
"a<b-d>"	1	0	"AAC"	"y"	"[match 0]"	"AC"	"$&"
"a<-b>"	1	0	"A-"	"y"	"[match 0]"	"A-"	"$&"
"a<b->"	1	0	"A-"	"y"	"[match 0]"	"A-"	"$&"
"a<b-a>"	1	0	"-"	"c"	"[match 0]"	"Invalid <> range 'b-a'"	"-"
"a<>b"	1	0	"-"	"c"	"[match 0]"	"Unmatched <"	"-"
"a<"	1	0	"-"	"c"	"[match 0]"	"Unmatched <"	"-"
"a>"	1	0	"A>"	"y"	"[match 0]"	"A>"	"$&"
"a<>>b"	1	0	"A>B"	"y"	"[match 0]"	"A>B"	"$&"
"a<^bc>d"	1	0	"AED"	"y"	"[match 0]"	"AED"	"$&"
"a<^bc>d"	1	0	"ABD"	"n"	"[match 0]"	"-"	"-"
"a<^-b>c"	1	0	"ADC"	"y"	"[match 0]"	"ADC"	"$&"
"a<^-b>c"	1	0	"A-C"	"n"	"[match 0]"	"-"	"-"
"a<^>b>c"	1	0	"A>C"	"n"	"[match 0]"	"-"	"-"
"a<^>b>c"	1	0	"ADC"	"y"	"[match 0]"	"ADC"	"$&"
"ab|cd"	1	0	"ABC"	"y"	"[match 0]"	"AB"	"$&"
"ab|cd"	1	0	"ABCD"	"y"	"[match 0]"	"AB"	"$&"
"()ef"	1	0	"DEF"	"y"	"[match 0]-[match 1]"	"EF-"	"$&-$1"
"*a"	1	0	"-"	"c"	"[match 0]-[match 1]"	"Quantifier follows nothing"	"-"
"(*)b"	1	0	"-"	"c"	"[match 0]-[match 1]"	"Quantifier follows nothing"	"-"
"$b"	1	0	"B"	"n"	"[match 0]-[match 1]"	"-"	"-"
"a\"	1	0	"-"	"c"	"[match 0]-[match 1]"	"Search pattern not terminated"	"-"
"a\(b"	1	0	"A(B"	"y"	"[match 0]-[match 1]"	"A(B-"	"$&-$1"
"a\(*b"	1	0	"AB"	"y"	"[match 0]"	"AB"	"$&"
"a\(*b"	1	0	"A((B"	"y"	"[match 0]"	"A((B"	"$&"
"a\\b"	1	0	"A\B"	"y"	"[match 0]"	"A\B"	"$&"
"abc)"	1	0	"-"	"c"	"[match 0]"	"Unmatched )"	"-"
"(abc"	1	0	"-"	"c"	"[match 0]"	"Unmatched ("	"-"
"((a))"	1	0	"ABC"	"y"	"[match 0]-[match 1]-[match 2]"	"A-A-A"	"$&-$1-$2"
"(a)b(c)"	1	0	"ABC"	"y"	"[match 0]-[match 1]-[match 2]"	"ABC-A-C"	"$&-$1-$2"
"a+b+c"	1	0	"AABBABC"	"y"	"[match 0]"	"ABC"	"$&"
"a{1,}b{1,}c"	1	0	"AABBABC"	"y"	"[match 0]"	"ABC"	"$&"
"a**"	1	0	"-"	"c"	"[match 0]"	"Nested quantifiers"	"-"
"a.+?c"	1	0	"ABCABC"	"y"	"[match 0]"	"ABC"	"$&"
"a.*?c"	1	0	"ABCABC"	"y"	"[match 0]"	"ABC"	"$&"
"a.{0,5}?c"	1	0	"ABCABC"	"y"	"[match 0]"	"ABC"	"$&"
"(a+|b)*"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"AB-B"	"$&-$1"
"(a+|b){0,}"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"AB-B"	"$&-$1"
"(a+|b)+"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"AB-B"	"$&-$1"
"(a+|b){1,}"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"AB-B"	"$&-$1"
"(a+|b)?"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"A-A"	"$&-$1"
"(a+|b){0,1}"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"A-A"	"$&-$1"
"(a+|b){0,1}?"	1	0	"AB"	"y"	"[match 0]-[match 1]"	"-"	"$&-$1"
")("	1	0	"-"	"c"	"[match 0]-[match 1]"	"Unmatched )"	"-"
"<^ab>*"	1	0	"CDE"	"y"	"[match 0]"	"CDE"	"$&"
"abc"	1	0	""	"n"	"[match 0]"	"-"	"-"
"a*"	1	0	""	"y"	"[match 0]"	""	"$&"
"(<abc>)*d"	1	0	"ABBBCD"	"y"	"[match 0]-[match 1]"	"ABBBCD-C"	"$&-$1"
"(<abc>)*bcd"	1	0	"ABCD"	"y"	"[match 0]-[match 1]"	"ABCD-A"	"$&-$1"
"a|b|c|d|e"	1	0	"E"	"y"	"[match 0]"	"E"	"$&"
"(a|b|c|d|e)f"	1	0	"EF"	"y"	"[match 0]-[match 1]"	"EF-E"	"$&-$1"
"abcd*efg"	1	0	"ABCDEFG"	"y"	"[match 0]"	"ABCDEFG"	"$&"
"ab*"	1	0	"XABYABBBZ"	"y"	"[match 0]"	"AB"	"$&"
"ab*"	1	0	"XAYABBBZ"	"y"	"[match 0]"	"A"	"$&"
"(ab|cd)e"	1	0	"ABCDE"	"y"	"[match 0]-[match 1]"	"CDE-CD"	"$&-$1"
"<abhgefdc>ij"	1	0	"HIJ"	"y"	"[match 0]"	"HIJ"	"$&"
"^(ab|cd)e"	1	0	"ABCDE"	"n"	"[match 0]"	"XY"	"x$1y"
"(abc|)ef"	1	0	"ABCDEF"	"y"	"[match 0]-[match 1]"	"EF-"	"$&-$1"
"(a|b)c*d"	1	0	"ABCD"	"y"	"[match 0]-[match 1]"	"BCD-B"	"$&-$1"
"(ab|ab*)bc"	1	0	"ABC"	"y"	"[match 0]-[match 1]"	"ABC-A"	"$&-$1"
"a(<bc>*)c*"	1	0	"ABC"	"y"	"[match 0]-[match 1]"	"ABC-BC"	"$&-$1"
"a(<bc>*)(c*d)"	1	0	"ABCD"	"y"	"[match 0]-[match 1]-[match 2]"	"ABCD-BC-D"	"$&-$1-$2"
"a(<bc>+)(c*d)"	1	0	"ABCD"	"y"	"[match 0]-[match 1]-[match 2]"	"ABCD-BC-D"	"$&-$1-$2"
"a(<bc>*)(c+d)"	1	0	"ABCD"	"y"	"[match 0]-[match 1]-[match 2]"	"ABCD-B-CD"	"$&-$1-$2"
"a<bcd>*dcdcde"	1	0	"ADCDCDE"	"y"	"[match 0]"	"ADCDCDE"	"$&"
"a<bcd>+dcdcde"	1	0	"ADCDCDE"	"n"	"[match 0]"	"-"	"-"
"(ab|a)b*c"	1	0	"ABC"	"y"	"[match 0]-[match 1]"	"ABC-AB"	"$&-$1"
"((a)(b)c)(d)"	1	0	"ABCD"	"y"	"[match 1]-[match 2]-[match 3]-[match 4]"	"ABC-A-B-D"	"$1-$2-$3-$4"
"<a-zA-Z_><a-zA-Z0-9_>*"	1	0	"ALPHA"	"y"	"[match 0]"	"ALPHA"	"$&"
"^a(bc+|b<eh>)g|.h$"	1	0	"ABH"	"y"	"[match 0]-[match 1]"	"BH-"	"$&-$1"
"(bc+d$|ef*g.|h?i(j|k))"	1	0	"EFFGZ"	"y"	"[match 0]-[match 1]-[match 2]"	"EFFGZ-EFFGZ-"	"$&-$1-$2"
"(bc+d$|ef*g.|h?i(j|k))"	1	0	"IJ"	"y"	"[match 0]-[match 1]-[match 2]"	"IJ-IJ-J"	"$&-$1-$2"
"(bc+d$|ef*g.|h?i(j|k))"	1	0	"EFFG"	"n"	"[match 0]-[match 1]-[match 2]"	"-"	"-"
"(bc+d$|ef*g.|h?i(j|k))"	1	0	"BCDD"	"n"	"[match 0]-[match 1]-[match 2]"	"-"	"-"
"(bc+d$|ef*g.|h?i(j|k))"	1	0	"REFFGZ"	"y"	"[match 0]-[match 1]-[match 2]"	"EFFGZ-EFFGZ-"	"$&-$1-$2"
"(((((((((a)))))))))"	1	0	"A"	"y"	"[match 0]"	"A"	"$&"
"(?:(?:(?:(?:(?:(?:(?:(?:(?:(a))))))))))"	1	0	"A"	"y"	"[match 1]"	"A"	"$1"
"(?:(?:(?:(?:(?:(?:(?:(?:(?:(a|b|c))))))))))"	1	0	"C"	"y"	"[match 1]"	"C"	"$1"
"multiple words of text"	1	0	"UH-UH"	"n"	"[match 1]"	"-"	"-"
"multiple words"	1	0	"MULTIPLE WORDS, YEAH"	"y"	"[match 0]"	"MULTIPLE WORDS"	"$&"
"(.*)c(.*)"	1	0	"ABCDE"	"y"	"[match 0]-[match 1]-[match 2]"	"ABCDE-AB-DE"	"$&-$1-$2"
"\((.*), (.*)\)"	1	0	"(A, B)"	"y"	"([match 2], [match 1])"	"(B, A)"	"($2, $1)"
"<k>"	1	0	"AB"	"n"	"([match 2], [match 1])"	"-"	"-"
"a<->?c"	1	0	"AC"	"y"	"[match 0]"	"AC"	"$&"
"(abc)\1"	1	0	"ABCABC"	"y"	"[match 1]"	"ABC"	"$1"
"(<a-c>*)\1"	1	0	"ABCABC"	"y"	"[match 1]"	"ABC"	"$1"
"a(?!b)."	0	0	"abad"	"y"	"[match 0]"	"ad"	"$&"
"a(?=d)."	0	0	"abad"	"y"	"[match 0]"	"ad"	"$&"
"a(?=c|d)."	0	0	"abad"	"y"	"[match 0]"	"ad"	"$&"
"a(?:b|c|d)(.)"	0	0	"ace"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d)*(.)"	0	0	"ace"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d)+?(.)"	0	0	"ace"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d)+?(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"d"	"$1"
"a(?:b|c|d)+(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d){2}(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"b"	"$1"
"a(?:b|c|d){4,5}(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"b"	"$1"
"a(?:b|c|d){4,5}?(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"d"	"$1"
"((foo)|(bar))*"	0	0	"foobar"	"y"	"[match 1]-[match 2]-[match 3]"	"bar-foo-bar"	"$1-$2-$3"
":(?:"	0	0	"-"	"c"	"[match 1]-[match 2]-[match 3]"	"Sequence (? incomplete"	"-"
"a(?:b|c|d){6,7}(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d){6,7}?(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d){5,6}(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d){5,6}?(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"b"	"$1"
"a(?:b|c|d){5,7}(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"e"	"$1"
"a(?:b|c|d){5,7}?(.)"	0	0	"acdbcdbe"	"y"	"[match 1]"	"b"	"$1"
"a(?:b|(c|e){1,2}?|d)+?(.)"	0	0	"ace"	"y"	"[match 1][match 2]"	"ce"	"$1$2"
"^(.+)?B"	0	0	"AB"	"y"	"[match 1]"	"A"	"$1"
"^(<^a-z>)|(\^)$"	0	0	"."	"y"	"[match 1]"	"."	"$1"
"^(a\1?){4}$"	0	0	"aaaaaaaaaa"	"y"	"[match 1]"	"aaaa"	"$1"
"^(a\1?){4}$"	0	0	"aaaaaaaaa"	"n"	"[match 1]"	"-"	"-"
"^(a\1?){4}$"	0	0	"aaaaaaaaaaa"	"n"	"[match 1]"	"-"	"-"
"^(a(?(1)\1)){4}$"	0	0	"aaaaaaaaaa"	"y"	"[match 1]"	"aaaa"	"$1"
"^(a(?(1)\1)){4}$"	0	0	"aaaaaaaaa"	"n"	"[match 1]"	"-"	"-"
"^(a(?(1)\1)){4}$"	0	0	"aaaaaaaaaaa"	"n"	"[match 1]"	"-"	"-"
"((a{4})+)"	0	0	"aaaaaaaaa"	"y"	"[match 1]"	"aaaaaaaa"	"$1"
"(((aa){2})+)"	0	0	"aaaaaaaaaa"	"y"	"[match 1]"	"aaaaaaaa"	"$1"
"(((a{2}){2})+)"	0	0	"aaaaaaaaaa"	"y"	"[match 1]"	"aaaaaaaa"	"$1"
"(?:(f)(o)(o)|(b)(a)(r))*"	0	0	"foobar"	"y"	"[match 1]:[match 2]:[match 3]:[match 4]:[match 5]:[match 6]"	"f:o:o:b:a:r"	"$1:$2:$3:$4:$5:$6"
"(?<=a)b"	0	0	"ab"	"y"	"[match 0]"	"b"	"$&"
"(?<=a)b"	0	0	"cb"	"n"	"[match 0]"	"-"	"-"
"(?<=a)b"	0	0	"b"	"n"	"[match 0]"	"-"	"-"
"(?<!c)b"	0	0	"ab"	"y"	"[match 0]"	"b"	"$&"
"(?<!c)b"	0	0	"cb"	"n"	"[match 0]"	"-"	"-"
"(?<!c)b"	0	0	"b"	"y"	"-"	"-"	"-"
"(?<!c)b"	0	0	"b"	"y"	"[match 0]"	"b"	"$&"
"(?<%)b"	0	0	"-"	"c"	"[match 0]"	"Sequence (?<%...) not recognized"	"-"
"(?:..)*a"	0	0	"aba"	"y"	"[match 0]"	"aba"	"$&"
"(?:..)*?a"	0	0	"aba"	"y"	"[match 0]"	"a"	"$&"
"^(?:b|a(?=(.)))*\1"	0	0	"abc"	"y"	"[match 0]"	"ab"	"$&"
"^(){3,5}"	0	0	"abc"	"y"	"a[match 1]"	"a"	"a$1"
"^(a+)*ax"	0	0	"aax"	"y"	"[match 1]"	"a"	"$1"
"^((a|b)+)*ax"	0	0	"aax"	"y"	"[match 1]"	"a"	"$1"
"^((a|bc)+)*ax"	0	0	"aax"	"y"	"[match 1]"	"a"	"$1"
"(a|x)*ab"	0	0	"cab"	"y"	"y[match 1]"	"y"	"y$1"
"(a)*ab"	0	0	"cab"	"y"	"y[match 1]"	"y"	"y$1"
"(?:(?i)a)b"	0	0	"ab"	"y"	"[match 0]"	"ab"	"$&"
"((?i)a)b"	0	0	"ab"	"y"	"[match 0]:[match 1]"	"ab:a"	"$&:$1"
"(?:(?i)a)b"	0	0	"Ab"	"y"	"[match 0]"	"Ab"	"$&"
"((?i)a)b"	0	0	"Ab"	"y"	"[match 0]:[match 1]"	"Ab:A"	"$&:$1"
"(?:(?i)a)b"	0	0	"aB"	"n"	"[match 0]:[match 1]"	"-"	"-"
"((?i)a)b"	0	0	"aB"	"n"	"[match 0]:[match 1]"	"-"	"-"
"(?i:a)b"	0	0	"ab"	"y"	"[match 0]"	"ab"	"$&"
"((?i:a))b"	0	0	"ab"	"y"	"[match 0]:[match 1]"	"ab:a"	"$&:$1"
"(?i:a)b"	0	0	"Ab"	"y"	"[match 0]"	"Ab"	"$&"
"((?i:a))b"	0	0	"Ab"	"y"	"[match 0]:[match 1]"	"Ab:A"	"$&:$1"
"(?i:a)b"	0	0	"aB"	"n"	"[match 0]:[match 1]"	"-"	"-"
"((?i:a))b"	0	0	"aB"	"n"	"[match 0]:[match 1]"	"-"	"-"
"(?:(?-i)a)b"	1	0	"ab"	"y"	"[match 0]"	"ab"	"$&"
"((?-i)a)b"	1	0	"ab"	"y"	"[match 0]:[match 1]"	"ab:a"	"$&:$1"
"(?:(?-i)a)b"	1	0	"aB"	"y"	"[match 0]"	"aB"	"$&"
"((?-i)a)b"	1	0	"aB"	"y"	"[match 0]:[match 1]"	"aB:a"	"$&:$1"
"(?:(?-i)a)b"	1	0	"Ab"	"n"	"[match 0]:[match 1]"	"-"	"-"
"((?-i)a)b"	1	0	"Ab"	"n"	"[match 0]:[match 1]"	"-"	"-"
"(?:(?-i)a)b"	1	0	"aB"	"y"	"[match 0]"	"aB"	"$&"
"((?-i)a)b"	1	0	"aB"	"y"	"[match 1]"	"a"	"$1"
"(?:(?-i)a)b"	1	0	"AB"	"n"	"[match 1]"	"-"	"-"
"((?-i)a)b"	1	0	"AB"	"n"	"[match 1]"	"-"	"-"
"(?-i:a)b"	1	0	"ab"	"y"	"[match 0]"	"ab"	"$&"
"((?-i:a))b"	1	0	"ab"	"y"	"[match 0]:[match 1]"	"ab:a"	"$&:$1"
"(?-i:a)b"	1	0	"aB"	"y"	"[match 0]"	"aB"	"$&"
"((?-i:a))b"	1	0	"aB"	"y"	"[match 0]:[match 1]"	"aB:a"	"$&:$1"
"(?-i:a)b"	1	0	"Ab"	"n"	"[match 0]:[match 1]"	"-"	"-"
"((?-i:a))b"	1	0	"Ab"	"n"	"[match 0]:[match 1]"	"-"	"-"
"(?-i:a)b"	1	0	"aB"	"y"	"[match 0]"	"aB"	"$&"
"((?-i:a))b"	1	0	"aB"	"y"	"[match 1]"	"a"	"$1"
"(?-i:a)b"	1	0	"AB"	"n"	"[match 1]"	"-"	"-"
"((?-i:a))b"	1	0	"AB"	"n"	"[match 1]"	"-"	"-"
"(?:c|d)(?:)(?:a(?:)(?:b)(?:b(?:))(?:b(?:)(?:b)))"	0	0	"cabbbb"	"y"	"[match 0]"	"cabbbb"	"$&"
"(?:c|d)(?:)(?:aaaaaaaa(?:)(?:bbbbbbbb)(?:bbbbbbbb(?:))(?:bbbbbbbb(?:)(?:bbbbbbbb)))"	0	0	"caaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"	"y"	"[match 0]"	"caaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"	"$&"
"(ab)\d\1"	1	0	"Ab4ab"	"y"	"[match 1]"	"Ab"	"$1"
"(ab)\d\1"	1	0	"ab4Ab"	"y"	"[match 1]"	"ab"	"$1"
"foo\w*\d{4}baz"	0	0	"foobar1234baz"	"y"	"[match 0]"	"foobar1234baz"	"$&"
"x(~~)*(?:(?:F)?)?"	0	0	"x~~"	"y"	"-"	"-"	"-"
"^a(?#xxx){3}c"	0	0	"aaac"	"y"	"[match 0]"	"aaac"	"$&"
"(?<!<cd>)b"	0	0	"dbcb"	"n"	"[match 0]"	"-"	"-"
"(?<!<cd>)<ab>"	0	0	"dbaacb"	"y"	"[match 0]"	"a"	"$&"
"(?<!(c|d))b"	0	0	"dbcb"	"n"	"[match 0]"	"-"	"-"
"(?<!(c|d))<ab>"	0	0	"dbaacb"	"y"	"[match 0]"	"a"	"$&"
"(?<!cd)<ab>"	0	0	"cdaccb"	"y"	"[match 0]"	"b"	"$&"
"^(?:a?b?)*$"	0	0	"a--"	"n"	"[match 0]"	"-"	"-"
"(?(1)a|b)"	0	0	"a"	"n"	"[match 0]"	"-"	"-"
"(?(1)b|a)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"(x)?(?(1)a|b)"	0	0	"a"	"n"	"[match 0]"	"-"	"-"
"(x)?(?(1)b|a)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"()?(?(1)b|a)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"()(?(1)b|a)"	0	0	"a"	"n"	"[match 0]"	"-"	"-"
"()?(?(1)a|b)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"^(\()?blah(?(1)(\)))$"	0	0	"(blah)"	"y"	"[match 2]"	")"	"$2"
"^(\()?blah(?(1)(\)))$"	0	0	"blah"	"y"	"([match 2])"	"()"	"($2)"
"^(\()?blah(?(1)(\)))$"	0	0	"blah)"	"n"	"([match 2])"	"-"	"-"
"^(\()?blah(?(1)(\)))$"	0	0	"(blah"	"n"	"([match 2])"	"-"	"-"
"^(\(+)?blah(?(1)(\)))$"	0	0	"(blah)"	"y"	"[match 2]"	")"	"$2"
"^(\(+)?blah(?(1)(\)))$"	0	0	"blah"	"y"	"([match 2])"	"()"	"($2)"
"^(\(+)?blah(?(1)(\)))$"	0	0	"blah)"	"n"	"([match 2])"	"-"	"-"
"^(\(+)?blah(?(1)(\)))$"	0	0	"(blah"	"n"	"([match 2])"	"-"	"-"
"(?(1?)a|b)"	0	0	"a"	"c"	"([match 2])"	"Switch condition not recognized"	"-"
"(?(1)a|b|c)"	0	0	"a"	"c"	"([match 2])"	"Switch (?(condition)... contains too many branches"	"-"
"(?(?!a)a|b)"	0	0	"a"	"n"	"([match 2])"	"-"	"-"
"(?(?!a)b|a)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"(?(?=a)b|a)"	0	0	"a"	"n"	"[match 0]"	"-"	"-"
"(?(?=a)a|b)"	0	0	"a"	"y"	"[match 0]"	"a"	"$&"
"(?=(a+?))(\1ab)"	0	0	"aaab"	"y"	"[match 2]"	"aab"	"$2"
"^(?=(a+?))\1ab"	0	0	"aaab"	"n"	"[match 2]"	"-"	"-"
"(\w+:)+"	0	0	"one:"	"y"	"[match 1]"	"one:"	"$1"
"$(?<=^(a))"	0	0	"a"	"y"	"[match 1]"	"a"	"$1"
"(?=(a+?))(\1ab)"	0	0	"aaab"	"y"	"[match 2]"	"aab"	"$2"
"^(?=(a+?))\1ab"	0	0	"aaab"	"n"	"[match 2]"	"-"	"-"
"(<\w:>+::)?(\w+)$"	0	0	"abcd:"	"n"	"[match 2]"	"-"	"-"
"(<\w:>+::)?(\w+)$"	0	0	"abcd"	"y"	"[match 1]-[match 2]"	"-abcd"	"$1-$2"
"(<\w:>+::)?(\w+)$"	0	0	"xy:z:::abcd"	"y"	"[match 1]-[match 2]"	"xy:z:::-abcd"	"$1-$2"
"^<^bcd>*(c+)"	0	0	"aexycd"	"y"	"[match 1]"	"c"	"$1"
"(a*)b+"	0	0	"caab"	"y"	"[match 1]"	"aa"	"$1"
"(<\w:>+::)?(\w+)$"	0	0	"abcd:"	"n"	"[match 1]"	"-"	"-"
"(<\w:>+::)?(\w+)$"	0	0	"abcd"	"y"	"[match 1]-[match 2]"	"-abcd"	"$1-$2"
"(<\w:>+::)?(\w+)$"	0	0	"xy:z:::abcd"	"y"	"[match 1]-[match 2]"	"xy:z:::-abcd"	"$1-$2"
"^<^bcd>*(c+)"	0	0	"aexycd"	"y"	"[match 1]"	"c"	"$1"
"(>a+)ab"	0	0	"aaab"	"n"	"[match 1]"	"-"	"-"
"(?>a+)b"	0	0	"aaab"	"y"	"-"	"-"	"-"
"(<<:>+)"	0	0	"a:<b>:"	"y"	"[match 1]"	":<"	"$1"
"(<<=>+)"	0	0	"a=<b>="	"y"	"[match 1]"	"=<"	"$1"
"(<<.>+)"	0	0	"a.<b>."	"y"	"[match 1]"	".<"	"$1"
"<a<:xyz:"	0	0	"-"	"c"	"[match 1]"	"Unmatched <"	"-"
"<a<:>b<:c>"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"<a<:>b<:c>"	0	0	"abc"	"y"	"[match 0]"	"abc"	"$&"
"((?>a+)b)"	0	0	"aaab"	"y"	"[match 1]"	"aaab"	"$1"
"(?>(a+))b"	0	0	"aaab"	"y"	"[match 1]"	"aaa"	"$1"
"((?><^()>+)|\(<^()>*\))+"	0	0	"((abc(ade)ufh()()x"	"y"	"[match 0]"	"abc(ade)ufh()()x"	"$&"
"(?<=x+)y"	0	0	"-"	"c"	"[match 0]"	"Variable length lookbehind not implemented"	"-"
"a{37,17}"	0	0	"-"	"c"	"[match 0]"	"Can't do {n,m} with n > m"	"-"
"(^|x)(c)"	0	0	"ca"	"y"	"[match 2]"	"c"	"$2"
"a*abc?xyz+pqr{3}ab{2,}xy{4,5}pq{0,6}AB{0,}zz"	0	0	"x"	"n"	"[match 2]"	"-"	"-"
"round\(((?><^()>+))\)"	0	0	"_I(round(xs * sz),1)"	"y"	"[match 1]"	"xs * sz"	"$1"
"foo.bart"	0	0	"foo.bart"	"y"	"-"	"-"	"-"
".X(.+)+X"	0	0	"bbbbXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".X(.+)+XX"	0	0	"bbbbXcXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".XX(.+)+X"	0	0	"bbbbXXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".X(.+)+X"	0	0	"bbbbXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".X(.+)+XX"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".XX(.+)+X"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".X(.+)+<X>"	0	0	"bbbbXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".X(.+)+<X><X>"	0	0	"bbbbXcXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".XX(.+)+<X>"	0	0	"bbbbXXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".X(.+)+<X>"	0	0	"bbbbXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".X(.+)+<X><X>"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".XX(.+)+<X>"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".<X>(.+)+<X>"	0	0	"bbbbXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".<X>(.+)+<X><X>"	0	0	"bbbbXcXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".<X><X>(.+)+<X>"	0	0	"bbbbXXcXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"y"	"-"	"-"	"-"
".<X>(.+)+<X>"	0	0	"bbbbXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".<X>(.+)+<X><X>"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
".<X><X>(.+)+<X>"	0	0	"bbbbXXXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	"n"	"-"	"-"	"-"
"tt+$"	0	0	"xxxtt"	"y"	"-"	"-"	"-"
"(\d+\.\d+)"	0	0	"3.1415926"	"y"	"[match 1]"	"3.1415926"	"$1"
"(\ba.{0,10}br)"	0	0	"have a web browser"	"y"	"[match 1]"	"a web br"	"$1"
"\.c(pp|xx|c)?$"	1	0	"Changes"	"n"	"[match 1]"	"-"	"-"
"\.c(pp|xx|c)?$"	1	0	"IO.c"	"y"	"-"	"-"	"-"
"(\.c(pp|xx|c)?$)"	1	0	"IO.c"	"y"	"[match 1]"	".c"	"$1"
"^(<a-z>:)"	0	0	"C:/"	"n"	"[match 1]"	"-"	"-"
"(^|a)b"	0	0	"ab"	"y"	"-"	"-"	"-"
"^(<ab>*?)(b)?(c)$"	0	0	"abac"	"y"	"-[match 2]-"	"--"	"-$2-"
"(\w)?(abc)\1b"	0	0	"abcab"	"n"	"-[match 2]-"	"-"	"-"
"^(?:.,){2}c"	0	0	"a,b,c"	"y"	"-"	"-"	"-"
"^(.,){2}c"	0	0	"a,b,c"	"y"	"[match 1]"	"b,"	"$1"
"^(?:<^,>*,){2}c"	0	0	"a,b,c"	"y"	"-"	"-"	"-"
"^(<^,>*,){2}c"	0	0	"a,b,c"	"y"	"[match 1]"	"b,"	"$1"
"^(<^,>*,){3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>*,){3,}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>*,){0,3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,3},){3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,3},){3,}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,3},){0,3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,},){3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,},){3,}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{1,},){0,3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{0,3},){3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{0,3},){3,}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"^(<^,>{0,3},){0,3}d"	0	0	"aaa,b,c,d"	"y"	"[match 1]"	"c,"	"$1"
"(?i)"	0	0	""	"y"	"-"	"-"	"-"
"^(a(b)?)+$"	0	0	"aba"	"y"	"-[match 1]-[match 2]-"	"-a--"	"-$1-$2-"
"^(aa(bb)?)+$"	0	0	"aabbaa"	"y"	"-[match 1]-[match 2]-"	"-aa--"	"-$1-$2-"
"^(a)?a$"	0	0	"a"	"y"	"-[match 1]-"	"--"	"-$1-"
"^(a)?(?(1)a|b)+$"	0	0	"a"	"n"	"-[match 1]-"	"-"	"-"
"^(a\1?)(a\1?)(a\2?)(a\3?)$"	0	0	"aaaaaa"	"y"	"[match 1],[match 2],[match 3],[match 4]"	"a,aa,a,aa"	"$1,$2,$3,$4"
"^(a\1?){4}$"	0	0	"aaaaaa"	"y"	"[match 1]"	"aa"	"$1"
"^(0+)?(?:x(1))?"	0	0	"x1"	"y"	"-"	"-"	"-"
"^(<0-9a-fA-F>+)(?:x(<0-9a-fA-F>+)?)(?:x(<0-9a-fA-F>+))?"	0	0	"012cxx0190"	"y"	"-"	"-"	"-"
"^(b+?|a){1,2}c"	0	0	"bbbac"	"y"	"[match 1]"	"a"	"$1"
"^(b+?|a){1,2}c"	0	0	"bbbbac"	"y"	"[match 1]"	"a"	"$1"
"\((\w\. \w+)\)"	0	0	"cd. (A. Tw)"	"y"	"-[match 1]-"	"-A. Tw-"	"-$1-"
"((?:aaaa|bbbb)cccc)?"	0	0	"aaaacccc"	"y"	"-"	"-"	"-"
"((?:aaaa|bbbb)cccc)?"	0	0	"bbbbcccc"	"y"	"-"	"-"	"-"
"(a)?(a)+"	0	0	"a"	"y"	"[match 1]:[match 2]"	":a"	"$1:$2"
"(ab)?(ab)+"	0	0	"ab"	"y"	"[match 1]:[match 2]"	":ab"	"$1:$2"
"(abc)?(abc)+"	0	0	"abc"	"y"	"[match 1]:[match 2]"	":abc"	"$1:$2"
"\ba"	0	0	"a"	"y"	"-"	"-"	"-"
"ab(?i)cd"	0	0	"AbCd"	"n"	"-"	"-"	"-"
"ab(?i)cd"	0	0	"abCd"	"y"	"-"	"-"	"-"
"(A|B)*(?(1)(CD)|(CD))"	0	0	"CD"	"y"	"[match 2]-[match 3]"	"-CD"	"$2-$3"
"(A|B)*(?(1)(CD)|(CD))"	0	0	"ABCD"	"y"	"[match 2]-[match 3]"	"CD-"	"$2-$3"
"(A|B)*?(?(1)(CD)|(CD))"	0	0	"CD"	"y"	"[match 2]-[match 3]"	"-CD"	"$2-$3"
"(A|B)*?(?(1)(CD)|(CD))"	0	0	"ABCD"	"y"	"[match 2]-[match 3]"	"CD-"	"$2-$3"
"^(o)(?!.*\1)"	1	0	"Oo"	"n"	"[match 2]-[match 3]"	"-"	"-"
"(.*)\d+\1"	0	0	"abc12bc"	"y"	"[match 1]"	"bc"	"$1"
"(.*)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=c)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=b|c)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=b|c)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=c|b)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=c|b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?=<bc>)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?<=b)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?<=b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?<=b|c)"	0	0	"abcd"	"y"	"[match 1]"	"abc"	"$1"
"(.*)(?<=b|c)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?<=c|b)"	0	0	"abcd"	"y"	"[match 1]"	"abc"	"$1"
"(.*)(?<=c|b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*)(?<=<bc>)"	0	0	"abcd"	"y"	"[match 1]"	"abc"	"$1"
"(.*)(?<=<bc>)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?=c)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?=b|c)"	0	0	"abcd"	"y"	"[match 1]"	"a"	"$1"
"(.*?)(?=b|c)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?=c|b)"	0	0	"abcd"	"y"	"[match 1]"	"a"	"$1"
"(.*?)(?=c|b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?=<bc>)"	0	0	"abcd"	"y"	"[match 1]"	"a"	"$1"
"(.*?)(?<=b)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=b|c)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=b|c)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=c|b)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=c|b)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=<bc>)"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"(.*?)(?<=<bc>)c"	0	0	"abcd"	"y"	"[match 1]"	"ab"	"$1"
"2(>*)?$\1"	0	0	"2"	"y"	"[match 0]"	"2"	"$&"
"a(b)??"	0	0	"abc"	"y"	"<[match 1]>"	"<>"	"<$1>"
"(\d{1,3}\.){3,}"	0	0	"128.134.142.8"	"y"	"<[match 1]>"	"<142.>"	"<$1>"
".*a(?!(b|cd)*e).*f"	0	0	"......abef"	"n"	"<[match 1]>"	"-"	"-"
"x(?#"	0	0	"x"	"c"	"<[match 1]>"	"Sequence (?#... not terminated"	"-"
":x(?#:"	0	0	"x"	"c"	"<[match 1]>"	"Sequence (?#... not terminated"	"-"
"(WORDS|WORD)S"	0	0	"WORDS"	"y"	"[match 1]"	"WORD"	"$1"
"(X.|WORDS|X.|WORD)S"	0	0	"WORDS"	"y"	"[match 1]"	"WORD"	"$1"
"(WORDS|WORLD|WORD)S"	0	0	"WORDS"	"y"	"[match 1]"	"WORD"	"$1"
"(X.|WORDS|WORD|Y.)S"	0	0	"WORDS"	"y"	"[match 1]"	"WORD"	"$1"
"(foo|fool|x.|money|parted)$"	0	0	"fool"	"y"	"[match 1]"	"fool"	"$1"
"(x.|foo|fool|x.|money|parted|y.)$"	0	0	"fool"	"y"	"[match 1]"	"fool"	"$1"
"(foo|fool|money|parted)$"	0	0	"fool"	"y"	"[match 1]"	"fool"	"$1"
"(foo|fool|x.|money|parted)$"	0	0	"fools"	"n"	"[match 1]"	"-"	"-"
"(x.|foo|fool|x.|money|parted|y.)$"	0	0	"fools"	"n"	"[match 1]"	"-"	"-"
"(foo|fool|money|parted)$"	0	0	"fools"	"n"	"[match 1]"	"-"	"-"
"(a|aa|aaa|aaaa|aaaaa|aaaaaa)(b|c)"	0	0	"aaaaaaaaaaaaaaab"	"y"	"[match 1][match 2]"	"aaaaaab"	"$1$2"
"^(a*?)(?!(aa|aaaa)*$)"	0	0	"aaaaaaaaaaaaaaaaaaaa"	"y"	"[match 1]"	"a"	"$1"
"^(.)\s+.$(?(1))"	0	0	"A B"	"y"	"[match 1]"	"A"	"$1"
"fish|fowl"	0	1	"fish"	"y"	"-"	"-"	"-"
"fish|fowl"	0	1	"fowl"	"y"	"-"	"-"	"-"
"fish|fowl"	0	1	"more fish"	"n"	"-"	"-"	"-"
"fish|fowl"	0	1	"fowler"	"n"	"-"	"-"	"-"
"fish|fowl"	0	1	"duck soup"	"n"	"-"	"-"	"-"
"a.*a"	0	1	"algebra"	"y"	"-"	"-"	"-"
"a.*a"	0	1	"antonine"	"n"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"-3045"	"y"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"-045"	"n"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"007"	"n"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"21"	"y"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"0"	"y"	"-"	"-"	"-"
"0|-?<1-9><0-9>*"	0	1	"fishslice"	"n"	"-"	"-"	"-"
"a"	0	0	"abacus"	"r"	"!"	"!b!cus"	"-"
"bac"	0	0	"abacus"	"r"	"!"	"a!us"	"-"
"ac"	0	0	"abacus"	"r"	"!"	"ab!us"	"-"
"baz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bau"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bas"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bauz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"baus"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"abacus"	0	0	"abacus"	"r"	"!"	"!"	"-"
"abacust"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"b"	0	0	"abbababa"	"r"	"!"	"a!!a!a!a"	"-"
"bogus"	0	0	""	"r"	"!"	""	"-"
""	0	0	"bogus"	"r"	"!"	"bogus"	"-"
""	0	0	""	"r"	"!"	""	"-"
"$"	0	0	"sausages"	"r"	"!"	"sausages!"	"-"
"s$"	0	0	"sausages"	"r"	"!"	"sausage!"	"-"
"e$"	0	0	"sausages"	"r"	"!"	"sausages"	"-"
"x$"	0	0	"sausages"	"r"	"!"	"sausages"	"-"
"^"	0	0	"abacus"	"r"	"!"	"!abacus"	"-"
"^a"	0	0	"abacus"	"r"	"!"	"!bacus"	"-"
"^ac"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"^b"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"a."	0	0	"abacus"	"r"	"!"	"!!us"	"-"
"a<bc>"	0	0	"abacus"	"r"	"!"	"!!us"	"-"
"<abc>"	0	0	"abacus"	"r"	"!"	"!!!!us"	"-"
"<ae-m>"	0	0	"jackdaws love my big sphinx of quartz"	"r"	"!"	"!!c!d!ws !ov! !y b!! sp!!nx o! qu!rtz"	"-"
"<^abc>"	0	0	"abacus"	"r"	"!"	"abac!!"	"-"
"\d"	0	0	"14 October, 1391."	"r"	"!"	"!! October, !!!!."	"-"
"\s"	0	0	"14 October, 1391."	"r"	"!"	"14!October,!1391."	"-"
"\S"	0	0	"14 October, 1391."	"r"	"!"	"!! !!!!!!!! !!!!!"	"-"
"b..gb..g"	0	0	"of bingbangbangbong type"	"r"	"!"	"of !! type"	"-"
"(b..g)\1"	0	0	"of bingbangbangbong type"	"r"	"!"	"of bing!bong type"	"-"
"b+"	0	0	"abba"	"r"	"!"	"a!a"	"-"
"b*"	0	0	"abba"	"r"	"!"	"!a!!a!"	"-"
"b*b"	0	0	"abba"	"r"	"!"	"a!a"	"-"
"b+b"	0	0	"abba"	"r"	"!"	"a!a"	"-"
"b+bb"	0	0	"abba"	"r"	"!"	"abba"	"-"
"b{2,3}"	0	0	"abbabbbabbbba"	"r"	"!"	"a!a!a!ba"	"-"
"b{3}"	0	0	"abbabbbabbbba"	"r"	"!"	"abba!a!ba"	"-"
"b{3,}"	0	0	"abbabbbabbbba"	"r"	"!"	"abba!a!a"	"-"
"b?bb"	0	0	"abba"	"r"	"!"	"a!a"	"-"
".*b"	0	0	"abba"	"r"	"!"	"!a"	"-"
"(.*)b"	0	0	"abba"	"r"	"!"	"!a"	"-"
".+b"	0	0	"abba"	"r"	"!"	"!a"	"-"
".+?b"	0	0	"abba"	"r"	"!"	"!ba"	"-"
"ab?"	0	0	"abecedary"	"r"	"!"	"!eced!ry"	"-"
"<abc>+"	0	0	"abacus"	"r"	"!"	"!us"	"-"
"<^abc>*"	0	0	"abacus"	"r"	"!"	"!a!b!a!c!!"	"-"
"b*"	0	0	""	"r"	"!"	"!"	"-"
"fish|fowl"	0	0	"neither fish nor fowl"	"r"	"!"	"neither ! nor !"	"-"
"fish|fowl|the"	0	0	"neither fish nor fowl"	"r"	"!"	"nei!r ! nor !"	"-"
"(fi|sh)"	0	0	"finally fish nor fowl"	"r"	"!"	"!nally !! nor fowl"	"-"
"(fi|sh)+"	0	0	"finally fish nor fowl"	"r"	"!"	"!nally ! nor fowl"	"-"
"(b|bc)d"	0	0	"abcdefg"	"r"	"!"	"a!efg"	"-"
"(b|bc|bcd)"	0	0	"abcdefg"	"r"	"!"	"a!cdefg"	"-"
"(b|bc|bcd)e"	0	0	"abcdefg"	"r"	"!"	"a!fg"	"-"
"(\s|f.*l)+"	0	0	"neither fish nor fowl"	"r"	"!"	"neither!"	"-"
"(?=abacus)ab"	0	0	"an abacus, an abcess, a gabby abacusmaster"	"r"	"!"	"an !acus, an abcess, a gabby !acusmaster"	"-"
"(?!abacus)ab"	0	0	"an abacus, an abcess, a gabby abacusmaster"	"r"	"!"	"an abacus, an !cess, a g!by abacusmaster"	"-"
"(?=\babacus)ab"	0	0	"an abacus, a drabacus, an abcess, a gabby abacusmaster"	"r"	"!"	"an !acus, a drabacus, an abcess, a gabby !acusmaster"	"-"
"(?=\babacus\b)ab"	0	0	"an abacus, a drabacus, an abcess, a gabby abacusmaster"	"r"	"!"	"an !acus, a drabacus, an abcess, a gabby abacusmaster"	"-"
"a"	0	0	"abacus"	"r"	"!"	"!b!cus"	"-"
"bac"	0	0	"abacus"	"r"	"!"	"a!us"	"-"
"ac"	0	0	"abacus"	"r"	"!"	"ab!us"	"-"
"baz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bau"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bas"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bauz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"baus"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"abacus"	0	0	"abacus"	"r"	"!"	"!"	"-"
"abacust"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"b"	0	0	"abbababa"	"r"	"!"	"a!!a!a!a"	"-"
"a"	0	0	"abacus"	"r"	"!"	"!b!cus"	"-"
"bac"	0	0	"abacus"	"r"	"!"	"a!us"	"-"
"ac"	0	0	"abacus"	"r"	"!"	"ab!us"	"-"
"baz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bau"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bas"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"bauz"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"baus"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"abacus"	0	0	"abacus"	"r"	"!"	"!"	"-"
"abacust"	0	0	"abacus"	"r"	"!"	"abacus"	"-"
"b"	0	0	"abbababa"	"r"	"!"	"a!!a!a!a"	"-"