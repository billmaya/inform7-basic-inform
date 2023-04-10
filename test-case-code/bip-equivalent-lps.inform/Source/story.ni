[ Basic Inform test case code ]
[ File: BIP-EquivalentLPs-G.txt ]
[ URL: https://github.com/ganelson/inform/tree/master/inform7/Tests/Test%20Basic ]

Length is a kind of value.

1.0m (in metric units, in m) or 1 meter (in meters, singular) or 1 metre
(in metres, singular) or 2 meters (in meters, plural) or 2 metres (in
metres, plural) specifies a length.

1mm (in metric units, in mm) or 1 millimeter (in millimeters,
singular) or 1 millimetre (in millimetres, singular) or 2 millimeters
(in millimeters, plural) or 2 millimetres (in millimetres, plural)
specifies a length scaled down by 1000.

1cm (in metric units, in cm) or 1 centimeter (in centimeters,
singular) or 1 centimetre (in centimetres, singular) or 2 centimeters
(in centimeters, plural) or 2 centimetres (in centimetres, plural)
specifies a length scaled down by 100.

1km (in metric units, in km) or 1 kilometer (in kilometers, singular)
or 1 kilometre (in kilometres, singular) or 2 kilometers (in
kilometers, plural) or 2 kilometres (in kilometres, plural) specifies
a length scaled up by 1000.

1 quarter (in conceptual units, in quarters, singular) or 2 quarters (in conceptual units, in quarters, plural) specifies a length equivalent to 24mm.
1 pencil (in conceptual units, in pencils, singular) or 2 pencils (in conceptual units, in pencils, plural) specifies a length equivalent to 18cm.
1 bathtub (in conceptual units, in bathtubs, singular) or 2 bathtubs (in conceptual units, in bathtubs, plural) specifies a length equivalent to 152cm.
1 Olympic swimming pool (in conceptual units, in Olympic swimming pools, singular) or 2 Olympic swimming pools (in conceptual units, in Olympic swimming pools, plural) specifies a length equivalent to 50 meters. 
1 Empire state building (in conceptual units, in Empire State buildings, singular) or 2 Empire State buildings (in conceptual units, in Empire State buildings, plural) specifies a length equivalent to 443m.

To begin:
	let N be 1mm;
	while N < 50km:
		say "[N] is [N in conceptual units].";
		now N is 10 times N;
