[ Basic Inform test case code ]
[ File: BIP-RelationAdjectives.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Vague connection relates various numbers to various numbers.

Sturdy connection relates one number to various numbers.

Feeble connection relates various numbers to one number.

Tenuous connection relates one number to one number.

Joining relates numbers to each other.

Pairing relates one number to another.

Clumping relates numbers to each other in groups.

To check out (R - a relation):
	showme R;
	showme whether or not R is empty;
	showme whether or not R is equivalence;
	showme whether or not R is symmetric;
	showme whether or not R is one-to-one;
	showme whether or not R is one-to-various;
	showme whether or not R is various-to-one;
	showme whether or not R is various-to-various;

To begin:
	showme vague connection relation;
	showme whether or not the vague connection relation is empty;
	now vague connection relation relates 55 to 17;
	check out the vague connection relation;
	check out the sturdy connection relation;
	check out the feeble connection relation;
	check out the tenuous connection relation;
	check out the pairing relation;
	check out the joining relation;
	check out the clumping relation;