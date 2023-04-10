[ Basic Inform test case code ]
[ File: Privacy.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

[This shows our private definition of "RunTimeProblem" existing independently
of the public one in BasicInformKit, which is shown functioning when the
division by 0 occurs.]

To begin:
	disclaim;
	showme 1 divided by 0.

Include (-
+private [ RunTimeProblem;
	"Hey, there's no problem here.";
];
-).

To disclaim: (- RunTimeProblem(); -).
