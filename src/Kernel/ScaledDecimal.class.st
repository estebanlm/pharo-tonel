"
ScaledDecimal implement a special kind of Fraction that prints in decimal notation.
It uses a limited number of digits (scale) after the decimal separation dot and round the result.
Note that a ScaledDecimal does not printOn: exactly, however it will storeOn: exactly because the full precision fraction is kept in memory.

This is mostly usefull with denominators being powers of 10.
"
Class {
	#name : #ScaledDecimal,
	#superclass : #Fraction,
	#instVars : [
		'scale'
	],
	#category : #Kernel-Numbers,
	#timestamp : 'nice 5/16/2009 20:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal class>>newFromNumber: aNumber scale: anInteger [
	| aFraction |
	aFraction := aNumber asFraction.
	^aFraction isFraction
		ifTrue: [self new setNumerator: aFraction numerator denominator: aFraction denominator scale: anInteger]
		ifFalse: [self new setNumerator: aFraction denominator: 1 scale: anInteger]
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>* aNumber [
	aNumber class = self class ifTrue: [^self asFraction * aNumber asFraction asScaledDecimal: (scale max: aNumber scale)].
	^self coerce: self asFraction * aNumber
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>+ aNumber [
	aNumber class = self class ifTrue: [^self asFraction + aNumber asFraction asScaledDecimal: (scale max: aNumber scale)].
	^self coerce: self asFraction + aNumber
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>- aNumber [
	aNumber class = self class ifTrue: [^self asFraction - aNumber asFraction asScaledDecimal: (scale max: aNumber scale)].
	^self coerce: self asFraction - aNumber
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>/ aNumber [
	aNumber class = self class ifTrue: [^self asFraction / aNumber asFraction asScaledDecimal: (scale max: aNumber scale)].
	^self coerce: self asFraction / aNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>< aNumber [
	aNumber class = self class ifTrue: [^self asFraction < aNumber asFraction].
	^self asFraction < aNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>><= aNumber [
	aNumber class = self class ifTrue: [^self asFraction <= aNumber asFraction].
	^self asFraction <= aNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>= aNumber [
	aNumber class = self class ifTrue: [^self asFraction = aNumber asFraction].
	^self asFraction = aNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>> aNumber [
	aNumber class = self class ifTrue: [^self asFraction > aNumber asFraction].
	^self asFraction > aNumber
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>>= aNumber [
	aNumber class = self class ifTrue: [^self asFraction >= aNumber asFraction].
	^self asFraction >= aNumber
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>adaptToFraction: rcvr andSend: selector [
	"If I am involved in arithmetic with a Fraction, convert it to a ScaledDecimal."

	^(rcvr asScaledDecimal: scale) perform: selector with: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>adaptToInteger: rcvr andSend: selector [
	"If I am involved in arithmetic with an Integer, convert it to a ScaledDecimal."

	^(rcvr asScaledDecimal: scale) perform: selector with: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>asFraction [
	"Convert the receiver to a Fraction.
	Avoid using numerator / denominator to save a useless and costly gcd: computation"

	^denominator = 1
		ifTrue: [numerator]
		ifFalse: [Fraction numerator: numerator denominator: denominator]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>coerce: aNumber [
	"Note: this quick hack could be replaced by double dispatching"
	
	aNumber class = self class ifTrue: [^self class newFromNumber: aNumber scale: (scale max: aNumber scale)].
	(aNumber isFraction or: [aNumber isInteger]) ifTrue: [^self class newFromNumber: aNumber scale: scale].
	^aNumber
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>isFraction [
	"Though kind of Fraction, pretend we are not a Fraction to let coercion works correctly"
	
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>isLiteral [
	"Answer if this number could be a well behaved literal.
	Well, it would only if evaluating back to self.
	This is not the case of all ScaledDecimals.
	Some have an infinite precision and would need an infinite number of digits to print literally.
	Try for example (3.00s2 reciprocal)."
	
	^denominator = 1 "first test trivial case before engaging arithmetic"
		or: ["Exactly we should test:
				(numerator * (10 raisedTo; scale)) \\ denominator = 0.
				But since we can assume fraction is reduced already this will be simply:"
			(10 raisedTo: scale) \\ denominator = 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>isSelfEvaluating [
    "Not all scaled decimal are self evaluating, because they print rounded digits."
    ^self isLiteral
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>literalEqual: other [
	"Testing equality is not enough.
	It is also necessary to test number of decimal places (scale).
	Otherwise we cannot compile both literals 0.5s1 and 0.50s2 in the same method"
	
	^(super literalEqual: other) and: [self scale = other scale]
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>negated [
	^self class newFromNumber: super negated scale: scale
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>nthRoot: anInteger [
	"Answer the nth root of the receiver.
	Preserve receiver class and scale if answer is exact.
	Otherwise, answer a Float to denote inexactness."
	| nthRoot |
	nthRoot := self asFraction nthRoot: anInteger.
	^nthRoot isFloat
		ifTrue: [nthRoot]
		ifFalse: [nthRoot asScaledDecimal: scale]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>printOn: aStream [
	"Append an approximated representation of the receiver on aStream.
	Use prescribed number of digits after decimal point (the scale) using a rounding operation if not exact"
	
	self printOn: aStream showingDecimalPlaces: scale.

	"Append a scale specification so that the number can be recognized as a ScaledDecimal"
	aStream nextPut: $s; print: scale.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>printOn: aStream base: base [
	base = 10 ifFalse: [self error: 'ScaledDecimals should be printed only in base 10'].
	^self printOn: aStream
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>raisedTo: aNumber [
	^self coerce: (super raisedTo: aNumber)
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>raisedToInteger: aNumber [
	^self class newFromNumber: (super raisedToInteger: aNumber) scale: scale
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>reciprocal [
	^self class newFromNumber: super reciprocal scale: scale
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>scale [
	^scale
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>setNumerator: n denominator: d scale: s [

	self setNumerator: n denominator: d.
	scale := s
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>sqrt [
	"Answer the square root of the receiver.
	Preserve receiver class and scale if answer is exact.
	Otherwise, answer a Float to denote inexactness."
	| squareRoot |
	squareRoot := self asFraction sqrt.
	^squareRoot isFloat
		ifTrue: [squareRoot]
		ifFalse: [squareRoot asScaledDecimal: scale]
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>squared [
	^self class newFromNumber: super squared scale: scale
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ScaledDecimal>>storeOn: aStream [
	"ScaledDecimal sometimes have more digits than they print (potentially an infinity).
	In this case, do not use printOn: because it would loose some extra digits"
	
	self shouldBePrintedAsLiteral
		ifTrue: [self printOn: aStream]
		ifFalse: [aStream
			nextPut: $(;
		 	store: numerator;
			nextPut: $/;
			store: denominator;
			nextPut: $s;
			store: scale;
			nextPut: $)]
]
