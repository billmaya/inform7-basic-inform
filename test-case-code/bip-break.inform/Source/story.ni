[ Basic Inform test case code ]
[ File: BIP-Break.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	repeat with M running from 1 to 10:
		if M is 5:
			next;
		showme M;
		if M is 7:
			break;
	let K be 0;
	while K is less than 20:
		increment K;
		if K is 5:
			next;
		showme K;
		if K is 7:
			break;
 