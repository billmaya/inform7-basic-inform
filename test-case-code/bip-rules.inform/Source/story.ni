[ Basic Inform test case code ]
[ File: BIP-Rules.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

This is the watching paint dry rule:
	say "You watch some paint dry.";

Grading is a number based rulebook.
Grading 5: say "It's five. What can I say?" instead.
Grading an odd number (called N): say "There's something odd about [N]." instead.
Grading a number (called N): say "Just [N]." instead.

The strange behavior rules is a rulebook producing a text.

Strange behavior:
	rule succeeds with result "Shazam!".

The even stranger behavior rules is a number based rulebook producing a text.

Even stranger behavior for a number (called N):
	rule succeeds with result "Shazam! There are [N in words] puff[s] of smoke.".

Judging is a number based rulebook.

This is the dismal rule:
	say "I fail, I fail.";
	rule fails;

This is the happy rule:
	say "I succeed, I succeed.";
	rule succeeds;

Judging 3:
	say "I look at 3 en passant.";
	make no decision.

Judging 4:
	say "I'm going to pass 4.";
	rule succeeds.

Judging 5:
	say "I'm going to fail 5.";
	rule fails.

Judging a number (called N):
	if N is even:
		abide by the dismal rule;
	say "So, we seem to have [N].";
	if N is odd:
		abide by the happy rule;
	say "So, we seem to be still here.";

Inspecting is a number based rulebook.

Inspecting rules have outcomes unsatisfactory (failure), adequate (success - the default) and superlative (success).

Inspecting an even number:
	adequate;

Inspecting an odd number:
	unsatisfactory;

Inspecting 8:
	superlative;

To begin:
	showme the watching paint dry rule;
	follow the watching paint dry rule;
	showme the grading rules;
	repeat with N running from 1 to 10:
		say "Grading [N]: ";
		follow the grading rulebook for N;
	showme the strange behavior rules;
	showme the text produced by the strange behavior rules;
	showme the even stranger behavior rules;
	showme the text produced by the even stranger behavior rules for 31;
	repeat with N running from 1 to 10:
		say "Judging [N] now.";
		follow the judging rulebook for N;
		if rule succeeded:
			say "(Well, so that succeeded.)[paragraph break]";
		if rule failed:
			say "(Well, so that failed.)[paragraph break]";
	repeat with N running from 1 to 10:
		say "Inspecting [N]: ";
		follow the inspecting rulebook for N;
		say "[outcome of the rulebook].";