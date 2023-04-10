[ Basic Inform test case code ]
[ File: BIP-Exponentials-G.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

To begin:
	showme logarithm of e;
	showme logarithm of 1;
	showme logarithm of 1000;
	showme logarithm of exponential of 7.12;
	showme logarithm to base 10 of 1000000;
	showme logarithm to base 10 of 350;
	showme logarithm to base 2 of 256;
	showme exponential of 0;
	showme exponential of 1;
	showme exponential of -10;
	showme exponential of 10;
	showme exponential of logarithm of 7.12;
	say "x = log (pi^2): ";
	let x be given by x = log (pi^2) where x is a real number;
	showme x;
	say "x = log pi^2: ";
	let x be given by x = log pi^2;
	showme x;
	say "x = (log pi)^2: ";
	let x be given by x = (log pi)^2;
	showme x;
	say "x = log(pi^2): ";
	let x be given by x = log(pi^2);
	showme x;
	say "x = 2 log pi: ";
	let x be given by x = 2 log pi;
	showme x;
	say "x = exp(exp(0)): ";
	let x be given by x = exp(exp(0));
	showme x;
	say "x = exp exp 0: ";
	let x be given by x = exp exp 0;
	showme x;
	say "log x = 1: ";
	let x be given by log x = 1;
	showme x;
	say "log x = 0: ";
	let x be given by log x = 0;
	showme x;
	say "exp x = e: ";
	let x be given by exp x = e;
	showme x;