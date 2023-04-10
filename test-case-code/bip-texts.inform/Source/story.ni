[ Basic Inform test case code ]
[ File: BIP-Texts.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

The magic number is a number that varies. The magic number is 1102.

The magic text is a text that varies. The magic text is "N is now [the magic number]."

To begin:
	assess "jackdaws love my big sphinx of quartz.";
	assess "This is a tumble-down house, with a door/portal at one end.";
	assess "Shahbaz Khan replied in the high-pitched voice of the mountaineer:
		'Hast thou seen?'

		The answer came back: 'Yes. God deliver us from all evil spirits!'

		There was a pause, and then: 'Hafiz Ullah, I am alone! Come to me!'

		'Shahbaz Khan, I am alone also; but I dare not leave my post!'

		'That is a lie; thou art afraid.'

		A longer pause followed, and then: 'I am afraid. Be silent! They are
		below us still. Pray to God and sleep.'

		The troopers listened and wondered, for they could not understand
		what save earth and stone could lie below the watch-towers.";
	let T be the substituted form of the magic text;
	increase the magic number by 1;
	showme the magic text;
	showme T;

To assess (T - a text):
	showme the number of characters in T;
	showme the number of words in T;
	showme the number of punctuated words in T;
	showme the number of unpunctuated words in T;
	showme the number of lines in T;
	showme the number of paragraphs in T;
	showme character number 7 in T;
	showme word number 4 in T;
	showme punctuated word number 4 in T;
	showme unpunctuated word number 4 in T;
	showme line number 1 in T;
	showme paragraph number 1 in T;