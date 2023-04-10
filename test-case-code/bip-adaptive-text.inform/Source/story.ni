[ Basic Inform test case code ]
[ File: BIP-AdaptiveText.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To carry is a verb.
To whinge is a verb.
To give is a verb.

To begin:
	examine the verb imply;
	examine the verb carry;
	examine the verb whinge;
	examine the verb give;
	examine the verb have;
	showme the meaning of the verb carry;

To examine (V - a verb):
	say "[V] has infinitive '[infinitive of V]'.";	
	say "[V] has past participle '[past participle of V]'.";	
	say "[V] has present participle '[present participle of V]'.";	
	say "He [adapt V] something.";
	say "He [negate V] something.";
	repeat with T running through grammatical tenses:
		say "[T]: [adapt V in T].";
		say "[T]: [negate V in T].";
	repeat with NV running through narrative viewpoints:
		say "[NV]: [adapt V from NV].";
		say "[NV]: [negate V from NV].";
	repeat with T running through grammatical tenses:
		repeat with NV running through narrative viewpoints:
			say "[T], [NV]: [adapt V in T from NV].";
			say "[T], [NV]: [negate V in T from NV].";
