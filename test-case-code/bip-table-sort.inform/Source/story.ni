[ Basic Inform test case code ]
[ File: BIP-TableSort.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Table of Selected Numbers
numeric		alphabetic
4			"four"
3			"three"
154			"one hundred and fifty-four"
27			"twenty-seven"
9			"nine"
with 4 blank rows

Table of Somewhat Blanked Numbers
numeric
--
3
--
-647
1
32739
--
4
2

[32739 is the "blank cell probable indicator" value, on the Z-machine]

Table of Indices
index	correspondence
12 	 "twelve"
57 	 "fifty-seven"
81 	 "eighty-one"
99 	 "ninety-nine"
65	 "sixty-five"
-- 	 "blank 1"
16	 "sixteen"

Table of Indices (continued)
index	correspondence
21	 "twenty-one"
-- 	 "blank 2"
1000 	 "one thousand"
--  	"blank 3"
17  	"seventeen"

Table of Original Numbers
numeric
--
3
--
-647
1
-17827
-26563
-20179
18762
-16515
-22471
12180
-22418
222
-6938
19572
5315
-1754
7488
13215
9461
24003
-21279
-139
1401
6708
-9749
-8134
-24518
-29866
16033
-8514
22626
-20146
-25219
-13061
2993
8547
15018
-19349
-2984
-70
-936
-3844
16492
-19004
-501
-419
12225
25436
-7994
7949
15898
15368
23181
8010
9951
-5324
-9187
-6677
294
613
-29384
19583
5034
29220
-21183
-20686
13633
25841
-9159
-27817
23626
16641
13180
-27502
23626
-1871
-25440
-3478
12034
-5175
-4201
-4943
21370
28553
676
15325
-16102
21453
-18487
17263
27017
-11317
12015
-23466
-16236
-9704
-23312
9550
-22958
-508
26598
6315
12119
1501
-10144
-27999
27152
-25961
-3642
23659
22722
18916
14915
12860
-15237
-7807
1288
-8042
6064
17428
26240
19776
20822
-27429
4201
8444
19460
9668
12615
25232
17978
-19371
24079
-24292
475
19217
7660
9423
-29443
-26083
17814
21295
-1732
-17440
-15545
-13224
7940
6732
-8280
19442
-17643
27370
-28606
-9066
29381
6606
23647
-4461
11794
-14733
-12092
-13333
-9392
-28810
28526
-1966
-17512
-26871
19073
-26911
16817
-16117
9188
-23780
-14427
-19114
21564
9700
4088
-8699
-27486
-21381
3607
-24093
-11846
21455
-29834
13458
14698
-12743
-23823
-17918
-10988
-11180
5323
-25587
306
14645
-13254
4923
24677
-29019
5208
32739
--
4
2

Table of Duplicate Numbers
numeric
--
3
--
-647
1
-17827
-26563
-20179
18762
-16515
-22471
12180
-22418
222
-6938
19572
5315
-1754
7488
13215
9461
24003
-21279
-139
1401
6708
-9749
-8134
-24518
-29866
16033
-8514
22626
-20146
-25219
-13061
2993
8547
15018
-19349
-2984
-70
-936
-3844
16492
-19004
-501
-419
12225
25436
-7994
7949
15898
15368
23181
8010
9951
-5324
-9187
-6677
294
613
-29384
19583
5034
29220
-21183
-20686
13633
25841
-9159
-27817
23626
16641
13180
-27502
23626
-1871
-25440
-3478
12034
-5175
-4201
-4943
21370
28553
676
15325
-16102
21453
-18487
17263
27017
-11317
12015
-23466
-16236
-9704
-23312
9550
-22958
-508
26598
6315
12119
1501
-10144
-27999
27152
-25961
-3642
23659
22722
18916
14915
12860
-15237
-7807
1288
-8042
6064
17428
26240
19776
20822
-27429
4201
8444
19460
9668
12615
25232
17978
-19371
24079
-24292
475
19217
7660
9423
-29443
-26083
17814
21295
-1732
-17440
-15545
-13224
7940
6732
-8280
19442
-17643
27370
-28606
-9066
29381
6606
23647
-4461
11794
-14733
-12092
-13333
-9392
-28810
28526
-1966
-17512
-26871
19073
-26911
16817
-16117
9188
-23780
-14427
-19114
21564
9700
4088
-8699
-27486
-21381
3607
-24093
-11846
21455
-29834
13458
14698
-12743
-23823
-17918
-10988
-11180
5323
-25587
306
14645
-13254
4923
24677
-29019
5208
32739
--
4
2

To insertion-sort (T - table name) in (TC - table column) order:
	(- TableSort({T}, {TC}, 1, InsertionSortAlgorithm); -).

To in-place-merge-sort (T - table name) in (TC - table column) order:
	(- TableSort({T}, {TC}, 1, InPlaceMergeSortAlgorithm); -).

To begin:
	sort the Table of Selected Numbers in numeric order;
	showme the contents of the Table of Selected Numbers;
	sort the Table of Selected Numbers in reverse alphabetic order;
	showme the contents of the Table of Selected Numbers;
	sort the Table of Somewhat Blanked Numbers in numeric order;
	showme the contents of the Table of Somewhat Blanked Numbers;
	sort the Table of Somewhat Blanked Numbers in reverse numeric order;
	showme the contents of the Table of Somewhat Blanked Numbers;
    sort the Table of Indices in index order;
	showme the contents of the Table of Indices;
    sort the Table of Indices in reverse index order;
	showme the contents of the Table of Indices;
	insertion-sort the Table of Original Numbers in numeric order;
	showme the contents of the Table of Original Numbers;
	in-place-merge-sort the Table of Duplicate Numbers in numeric order;
	showme the contents of the Table of Duplicate Numbers;
	sort the Table of Selected Numbers in random order;
	showme the contents of the Table of Selected Numbers;
