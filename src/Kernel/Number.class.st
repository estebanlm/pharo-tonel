"
Class Number holds the most general methods for dealing with numbers. Subclasses Float, Fraction, and Integer, and their subclasses, provide concrete representations of a numeric quantity.

All of Number's subclasses participate in a simple type coercion mechanism that supports mixed-mode arithmetic and comparisons.  It works as follows:  If
	self<typeA> op: arg<typeB>
fails because of incompatible types, then it is retried in the following guise:
	(arg adaptTypeA: self) op: arg adaptToTypeA.
This gives the arg of typeB an opportunity to resolve the incompatibility, knowing exactly what two types are involved.  If self is more general, then arg will be converted, and viceVersa.  This mechanism is extensible to any new number classes that one might wish to add to Pharo.  The only requirement is that every subclass of Number must support a pair of conversion methods specific to each of the other subclasses of Number.

Implementation notes
----------------------------------
The implementation of #degreeCos and #degreeSin is such that results are exact for any multiple of 90.

Care is also taken to evaluate the sine between -90° and 90°, this will avoid #degreesToRadians and i386 FPU sine function to accumulate round off errors due to approximate representation of pi.
We can thus evaluate 240 degreeCos with at most 1 ulp error. It's not perfect, but better than previous implementation.

For cosine, we know that:
	cosd(x)=cosd(abs(x))
	cosd(x)=sind(90-x)
thus the trick is to evaluate:
	cosd(x)=sind(90-abs(x)) after appropriate modulo in [-180,180[
This way, we are sure to evaluate the sine between -90° and 90°
The #degreesToRadians and #sin are used rather than #degreeSin to avoid cycles.

For sine, it would be necessary to evaluate either
sind(x) if abs(x) <=90
or sind(180-x) if abs(x) >= 90
A possible implementation would be:
	| x |
	x := 90 + self \\ 360 - 90.
	x >= 180 ifTrue: [x := 180 - x].
	^x degreesToRadians sin
We prefer evaluating cosd(90-x) thus providing a branch free implementation.
"
Class {
	#name : #Number,
	#superclass : #Magnitude,
	#category : #Kernel-Numbers,
	#timestamp : '<historical>'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number class>>one [

	^1
]

{
	#category : #deprecated,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number class>>readExponent: baseValue base: base from: aStream [
	"Complete creation of a number, reading exponent from aStream. Answer the
	number, or nil if parsing fails.
	<number>(e|d|q)<exponent>>"

	| sign exp value |
	('edq' includes: aStream next) ifFalse: [^ nil].
	sign := ((aStream peek) == $-)
		ifTrue: [aStream next. -1]
		ifFalse: [1].
	(aStream atEnd or: [(aStream peek digitValue between: 0 and: 9) not])
		ifTrue: [^ nil]. "Avoid throwing an error"
	exp := (Integer readFrom: aStream base: 10) * sign.
	value := baseValue * (base raisedTo: exp).
	^ value

]

{
	#category : #deprecated,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number class>>readRemainderOf: integerPart from: aStream base: base withSign: sign [
	"Read optional fractional part and exponent or decimal scale, and return the final result"
	"Number readFrom: '3r-22.2'"

	| value fractionDigits fracpos fractionPart fraction pos v foundDecimal |
	value := integerPart.
	fractionDigits := 0.
	foundDecimal := false.
	(aStream peekFor: $.)
		ifTrue: ["<integer>.<fraction>"
			foundDecimal := true.
			(aStream atEnd not
					and: [aStream peek digitValue between: 0 and: base - 1])
				ifTrue: [fracpos := aStream position.
					fractionPart := Integer readFrom: aStream base: base.
					fraction := fractionPart asFloat
								/ (base raisedTo: aStream position - fracpos).
					fractionDigits := aStream position - fracpos.
					value := value asFloat + fraction]].

	pos := aStream position.
	(v := self readScaledDecimal: integerPart
			fractionPart: fractionPart
			digits: fractionDigits
			base: base
			sign: sign
			from: aStream)
		ifNil: [aStream position: pos]
		ifNotNil: [^ v "<number>s<scale>>"].

	pos := aStream position.
	(v := self readExponent: value base: base from: aStream)
		ifNil: [aStream position: pos.
			(foundDecimal and: [fractionDigits = 0])
				ifTrue: ["oops - just <integer>."
							aStream skip: -1.
							"un-gobble the period"
							^ value * sign]]
		ifNotNil: [value := v "<number>(e|d|q)<exponent>>"].

	(value isFloat
			and: [value = 0.0
					and: [sign = -1]])
		ifTrue: [^ Float negativeZero]
		ifFalse: [^ value * sign]
]

{
	#category : #deprecated,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number class>>readScaledDecimal: integerPart fractionPart: fractionPart digits: fractionDigits base: base sign: sign from: aStream [
	"Complete creation of a ScaledDecimal, reading scale from aStream. Answer
	a ScaledDecimal, or nil if parsing fails.
	<number>s[<scale>]"

	| scale decimalMultiplier decimalFraction |
	aStream atEnd ifTrue: [^ nil].
	(aStream next == $s) ifFalse: [^ nil].
	"<number>s<scale>"
	(aStream atEnd not and: [aStream peek digitValue between: 0 and: 9])
		ifTrue: [scale := Integer readFrom: aStream]
		ifFalse: [^ nil].
	scale 
		ifNil: ["<number>s"
			fractionDigits = 0
				ifTrue: ["<integer>s"
					scale := 0]
				ifFalse: ["<integer>.<fraction>s"
					scale := fractionDigits]].
	fractionPart 
		ifNil: [^integerPart * sign asScaledDecimal: scale]
		ifNotNil: [decimalMultiplier := base raisedTo: fractionDigits.
			decimalFraction := integerPart * decimalMultiplier + fractionPart * sign / decimalMultiplier.
			^decimalFraction asScaledDecimal: scale]
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>% aNumber [
	"modulo. Remainder defined in terms of //. Answer a Number with the 
	same sign as aNumber. e.g. 9\\4 = 1, -9\\4 = 3, 9\\-4 = -3, 0.9\\0.4 = 0.1."
	^ self \\ aNumber
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>* aNumber [
	"Answer the result of multiplying the receiver by aNumber."

	self subclassResponsibility
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>** exponent [
	" A shortcut methog for raisedTo: "
	^ self raisedTo: exponent
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>+ aNumber [
	"Answer the sum of the receiver and aNumber."

	self subclassResponsibility
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>- aNumber [
	"Answer the difference between the receiver and aNumber."

	self subclassResponsibility
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>/ aNumber [
	"Answer the result of dividing the receiver by aNumber."

	self subclassResponsibility
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>// aNumber [
	"Integer quotient defined by division with truncation toward negative 
	infinity. 9//4 = 2, -9//4 = -3. -0.9//0.4 = -3. \\ answers the remainder 
	from this division."

	^(self / aNumber) floor
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>@ y [
	"Primitive. Answer a Point whose x value is the receiver and whose y 
	value is the argument. Optional. No Lookup. See Object documentation 
	whatIsAPrimitive."

	<primitive: 18>
	^Point x: self y: y
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>\\ aNumber [
	"modulo. Remainder defined in terms of //. Answer a Number with the 
	same sign as aNumber. e.g. 9\\4 = 1, -9\\4 = 3, 9\\-4 = -3, 0.9\\0.4 = 0.1."

	^self - (self // aNumber * aNumber)
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>abs [
	"Answer a Number that is the absolute value (positive magnitude) of the 
	receiver."

	self < 0
		ifTrue: [^self negated]
		ifFalse: [^self]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToCollection: rcvr andSend: selector [
	"If I am involved in arithmetic with a Collection, return a Collection of
	the results of each element combined with me in that expression."

	^ rcvr collect: [:element | element perform: selector with: self]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToFloat: rcvr andCompare: selector [
	"If I am involved in comparison with a Float, convert rcvr to a
	Fraction. This way, no bit is lost and comparison is exact."
	
	rcvr isFinite
		ifFalse: [
			selector == #= ifTrue: [^false].
			selector == #~= ifTrue: [^true].
			rcvr isNaN ifTrue: [^ false].
			(selector = #< or: [selector = #'<='])
				ifTrue: [^ rcvr positive not].
			(selector = #> or: [selector = #'>='])
				ifTrue: [^ rcvr positive].
			^self error: 'unknow comparison selector'].

	^ rcvr asTrueFraction perform: selector with: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToFloat: rcvr andSend: selector [
	"If I am involved in arithmetic with a Float, convert me to a Float."
	^ rcvr perform: selector with: self asFloat
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToFraction: rcvr andSend: selector [
	"If I am involved in arithmetic with a Fraction, convert us and evaluate exprBlock."
	^ self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToInteger: rcvr andSend: selector [
	"If I am involved in arithmetic with a Integer, convert us and evaluate exprBlock."
	^ self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>adaptToPoint: rcvr andSend: selector [
	"If I am involved in arithmetic with a Point, convert me to a Point."
	^ rcvr perform: selector with: self@self
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>arcCos [
	"The receiver is the cosine of an angle. Answer the angle measured in 
	radians."

	^self asFloat arcCos
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>arcSin [
	"The receiver is the sine of an angle. Answer the angle measured in 
	radians."

	^self asFloat arcSin
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>arcTan [
	"The receiver is the tangent of an angle. Answer the angle measured in 
	radians."

	^self asFloat arcTan
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>arcTan: denominator [
	"The receiver is the tangent of an angle. Answer the angle measured in 
	radians."

	^(self asFloat) arcTan: denominator.
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asDuration [
 
 	^ Duration seconds: self asInteger
 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asFloat [
	"Answer a floating-point number approximating the receiver."

	self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asInteger [
	"Answer an Integer nearest the receiver toward zero."

	^self truncated
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asMargin [
	^ Margin fromNumber: self.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asNumber [
	^ self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asPoint [
	"Answer a Point with the receiver as both coordinates; often used to 
	supply the same value in two dimensions, as with symmetrical gridding 
	or scaling."

	^self @ self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asScaledDecimal [
	"Answer a scaled decimal number approximating the receiver."
	#Numeric.

	^ self asScaledDecimal: 8

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asScaledDecimal: scale [
	"Answer the receiver converted to a ScaledDecimal."
	
	^ ScaledDecimal newFromNumber: self scale: scale
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asSeconds [
	^ Duration milliSeconds: self * 1000
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asSmallAngleDegrees [
	"Return the receiver normalized to lie within the range (-180, 180)"

	| pos |
	pos := self \\ 360.
	pos > 180 ifTrue: [pos := pos - 360].
	^ pos

"#(-500 -300 -150 -5 0 5 150 300 500 1200) collect: [:n | n asSmallAngleDegrees]"
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asSmallPositiveDegrees [
	"Return the receiver normalized to lie within the range (0, 360)"

	^self \\ 360
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>ceiling [
       "Answer the integer nearest the receiver toward  infinity."

       | truncation |
       truncation := self truncated.
       self <= 0 ifTrue: [ ^ truncation ].
       ^ self = truncation
               ifTrue: [ truncation ]
               ifFalse: [ truncation + 1 ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>closeTo: num [
	"Tell whether the receiver and arguments are close from each."

	num isFloat ifTrue: [ ^ num closeTo: self asFloat ].
	^ [ self = num ] ifError: [ false ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>closeTo: num precision: aPrecision [
	"are these two numbers close?"

	num isFloat ifTrue: [ ^ num closeTo: self asFloat precision: aPrecision ].
	^ [ self = num ] ifError: [ false ]
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>copySignTo: aNumber [
	"Return a number with same magnitude as aNumber and same sign as self."

	^ self positive
		ifTrue: [aNumber abs]
		ifFalse: [aNumber withNegativeSign].
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>cos [
	"The receiver represents an angle measured in radians. Answer its cosine."

	^self asFloat cos
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>day [
 
 	^ self days
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>days [
 
 	^ Duration days: self
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>degreeCos [
	"Answer the cosine of the receiver taken as an angle in degrees."
	
	^ (90 - (180 + self \\ 360 - 180) abs) degreesToRadians sin
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>degreeSin [
	"Answer the sine of the receiver taken as an angle in degrees."
	
	^(90 - self) degreeCos
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>degreesToRadians [
	"The receiver is assumed to represent degrees. Answer the conversion to 
	radians."

	^self asFloat degreesToRadians
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>detentBy: detent atMultiplesOf: grid snap: snap [
	"Map all values that are within detent/2 of any multiple of grid to that multiple.  Otherwise, if snap is true, return self, meaning that the values in the dead zone will never be returned.  If snap is false, then expand the range between dead zones so that it covers the range between multiples of the grid, and scale the value by that factor."
	| r1 r2 |
	r1 := self roundTo: grid.  "Nearest multiple of grid"
	(self roundTo: detent) = r1 ifTrue: [^ r1].  "Snap to that multiple..."
	snap ifTrue: [^ self].  "...or return self"

	r2 := self < r1  "Nearest end of dead zone"
		ifTrue: [r1 - (detent asFloat/2)]
		ifFalse: [r1 + (detent asFloat/2)].
	"Scale values between dead zones to fill range between multiples"
	^ r1 + ((self - r2) * grid asFloat / (grid - detent))
"
	(170 to: 190 by: 2) collect: [:a | a detentBy: 10 atMultiplesOf: 90 snap: true] 	(170 to: 190 by: 2) collect: [:a | a detentBy: 10 atMultiplesOf: 90 snap: false]
	(3.9 to: 4.1 by: 0.02) collect: [:a | a detentBy: 0.1 atMultiplesOf: 1.0 snap: true] 	(-3.9 to: -4.1 by: -0.02) collect: [:a | a detentBy: 0.1 atMultiplesOf: 1.0 snap: false]
"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>even [
	"Answer whether the receiver is an even number."

	^self \\ 2 = 0
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>exp [
	"Answer the exponential of the receiver as a floating point number."

	^self asFloat exp
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>floor [
	"Answer the integer nearest the receiver toward negative infinity."

	| truncation |
	truncation := self truncated.
	self >= 0 ifTrue: [^truncation].
	self = truncation
		ifTrue: [^truncation]
		ifFalse: [^truncation - 1]
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>floorLog: radix [
	"Answer the floor of the log base radix of the receiver."

	^(self log: radix) floor
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>fractionPart [
	"Added for ANSI compatibility"
	^self - self integerPart
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>hour [
 
 	^ self hours
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>hours [
 
 	^ Duration hours: self
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>integerPart [
	"Added for ANSI compatibility"
	^self truncated
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>interpolateTo: aNumber at: param [
    ^  self * (1 - param) + (aNumber * param)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>isDivisibleBy: aNumber [
	aNumber = 0 ifTrue: [^ false].
	aNumber isInteger ifFalse: [^ false].
	^ (self \\ aNumber) = 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>isInfinite [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>isNaN [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>isNumber [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>isZero [
	^self = 0
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>ln [
	"Answer the natural log of the receiver."

	^self asFloat ln
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>log [
	"Answer the base-10 log of the receiver."

	^self asFloat log
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>log: aNumber [
	"Answer the log base aNumber of the receiver."

	^self ln / aNumber ln
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>milliSecond [
 
 	^ self milliSeconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>milliSeconds [
 
 	^ Duration milliSeconds: self
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>minute [
 
 	^ self minutes
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>minutes [
 
 	^ Duration minutes: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>nanoSecond [
 
 	^ self nanoSeconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>nanoSeconds [
 
 	^ Duration nanoSeconds: self.
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>negated [
	"Answer a Number that is the negation of the receiver."

	^0 - self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>negative [
	"Answer whether the receiver is mathematically negative."

	^ self < 0
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>nthRoot: aPositiveInteger [
	"Answer the nth root of the receiver."

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>odd [
	"Answer whether the receiver is an odd number."

	^self even == false
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>percent [

	^ self / 100
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>positive [
	"Answer whether the receiver is positive or equal to 0. (ST-80 protocol).
	See also strictlyPositive"

	^ self >= 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printOn: aStream [
	self printOn: aStream base: 10
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printOn: aStream base: base [
	"This method should print a representation of the number for the given base,
	excluding the base prefix (and the letter r for radix)"
	
	^self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printOn: aStream showingDecimalPlaces: placesDesired [
	"Print a representation of the receiver on aStream in decimal notation with prescribed number of places after decimal separator."

	| rounder rounded roundedFractionPart |
	placesDesired <= 0 ifTrue: [^ self rounded printOn: aStream].
	rounder := 10 raisedToInteger: placesDesired.
	rounded := self roundTo: rounder reciprocal.
	rounded negative ifTrue: [aStream nextPut: $-].
	rounded := rounded abs.
	rounded integerPart truncated printOn: aStream.
	aStream nextPut: $..
	roundedFractionPart := (rounded fractionPart * rounder) truncated.
	roundedFractionPart printOn: aStream base: 10 length: placesDesired padded: true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printShowingDecimalPlaces: placesDesired [
	"Print the receiver showing precisely the given number of places desired.  If placesDesired is positive, a decimal point and that many digits after the decimal point will always be shown.  If placesDesired is zero, a whole number will be shown, without a decimal point."

	^String new: placesDesired + 10 streamContents: [:aStream |
		self printOn: aStream showingDecimalPlaces: placesDesired]
"
23 printShowingDecimalPlaces: 2
23.5698 printShowingDecimalPlaces: 2
-234.567 printShowingDecimalPlaces: 5
23.4567 printShowingDecimalPlaces: 0
23.5567 printShowingDecimalPlaces: 0
-23.4567 printShowingDecimalPlaces: 0
-23.5567 printShowingDecimalPlaces: 0
100000000 printShowingDecimalPlaces: 1
0.98 printShowingDecimalPlaces: 5
-0.98 printShowingDecimalPlaces: 2
2.567 printShowingDecimalPlaces: 2
-2.567 printShowingDecimalPlaces: 2
0 printShowingDecimalPlaces: 2
"
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printString [
	^self printStringBase: 10
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>printStringBase: base [
	^ String streamContents:
		[:strm | self printOn: strm base: base]
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>quo: aNumber [
	"Integer quotient defined by division with truncation toward zero. 
	
	-9 quo: 4 = -2.
	-0.9 quo: 0.4 = -2. 
	
	rem: answers the remainder from this division."

	^(self / aNumber) truncated
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>radiansToDegrees [
	"The receiver is assumed to represent radians. Answer the conversion to 
	degrees."

	^self asFloat radiansToDegrees
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>raisedTo: aNumber [
	"Answer the receiver raised to aNumber."

	aNumber isInteger ifTrue: [
		"Do the special case of integer power"
		^ self raisedToInteger: aNumber].
	aNumber isFraction ifTrue: [
		"Special case for fraction power"
		^ (self nthRoot: aNumber denominator) raisedToInteger: aNumber numerator ].
	self < 0 ifTrue: [
		^ ArithmeticError signal: 'Negative numbers can''t be raised to float powers.' ].
	0 = aNumber ifTrue: [^ self class one].	"Special case of exponent=0"
	1 = aNumber ifTrue: [^ self].	"Special case of exponent=1"
	0 = self ifTrue: [				"Special case of self = 0"
		aNumber < 0
			ifTrue: [^ (ZeroDivide dividend: self) signal]
			ifFalse: [^ self]].
	^ (aNumber * self ln) exp		"Otherwise use logarithms"
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>raisedToInteger: anInteger [

	"The 0 raisedToInteger: 0 is an special case. In some contexts must be 1 and in others must
	be handled as an indeterminate form.
	I take the first context because that's the way that was previously handled.
	Maybe further discussion is required on this topic."
	
	|bitProbe result|

	anInteger negative ifTrue: [^(self raisedToInteger: anInteger negated) reciprocal].
	bitProbe := 1 bitShift: anInteger highBit - 1.
 	result := self class one.
  	[
		(anInteger bitAnd: bitProbe) = 0 ifFalse: [result := result * self].
       bitProbe := bitProbe bitShift: -1.
		bitProbe > 0 ]
	whileTrue: [result := result * result].
	
	^result
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>reciprocal [
	"Returns the reciprocal of self.
	In case self is 0 the / signals ZeroDivide"
	
	^1 / self
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>reduce [
    "If self is close to an integer, return that integer"
    ^ self
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>rem: aNumber [
	"Remainder defined in terms of quo:. Answer a Number with the same 
	sign as self. e.g. 9 rem: 4 = 1, -9 rem: 4 = -1. 0.9 rem: 0.4 = 0.1."

	^self - ((self quo: aNumber) * aNumber)
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>round: numberOfWishedDecimal [
	"Round the decimal part of the receiver to be limited to the number of wished decimal. Only leave a fixed amount of decimal"
   < expr: 10.12345 round: 2 result: 10.12 >
	< expr: 10.199999999 round: 2 result: 10.2 > 
	^ self subclassResponsibility
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>roundDownTo: aNumber [
	"Answer the next multiple of aNumber toward negative infinity that is nearest the receiver. 
	Examples:
               3.1479 roundDownTo: 0.01 -> 3.14
               3.1479 roundDownTo: 0.1 -> 3.1
               1923 roundDownTo: 10 -> 1920
               3.1479 roundDownTo: 0.005 -> 3.145
               -3.1479 roundDownTo: 0.01 -> -3.15"
	
	^(self / aNumber) floor * aNumber
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>roundTo: quantum [
	"Answer the nearest number that is a multiple of quantum."

	^(self / quantum) rounded * quantum
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>roundUpTo: aNumber [
	"Answer the next multiple of aNumber toward infinity that is nearest the receiver.
	Examples:
               3.1479 roundUpTo: 0.01 -> 3.15
               3.1479 roundUpTo: 0.1 -> 3.2
               1923 roundUpTo: 10 -> 1930
               3.1479 roundUpTo: 0.005 -> 3.15
               -3.1479 roundUpTo: 0.01 -> -3.14"

	^(self / aNumber) ceiling * aNumber
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>rounded [
	"Answer the integer nearest the receiver."

	^(self + (self sign / 2)) truncated
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>second [
 
 	^ self seconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>seconds [
 
 	^ Duration seconds: self
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>sign [
	"Answer 1 if the receiver is greater than 0, -1 if less than 0, else 0."

	self > 0 ifTrue: [^1].
	self < 0 ifTrue: [^-1].
	^0
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>sign: aNumber [
 	"Return a Number with the same sign as aNumber"
 
 	^ aNumber copySignTo: self.
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>sin [
	"The receiver represents an angle measured in radians. Answer its sine."

	^self asFloat sin
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>sqrt [
	"Answer the square root of the receiver."

	self subclassResponsibility
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>squared [
	"Answer the receiver multiplied by itself."

	^self * self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>storeOn: aStream [
	self printOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>storeOn: aStream base: base [
	"This method should print a representation of the number for the given base,
	including the base prefix (with letter r for radix)"
	
	^self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>storeStringBase: base [
	^ String streamContents: [:strm | self storeOn: strm base: base]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>strictlyPositive [
	"Answer whether the receiver is mathematically positive."

	^ self > 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>stringForReadout [
	^ self rounded printString
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>tan [
	"The receiver represents an angle measured in radians. Answer its 
	tangent."

	^self asFloat tan
]

{
	#category : #intervals,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>to: stop [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by 1."

	^Interval from: self to: stop by: 1
]

{
	#category : #intervals,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>to: stop by: step [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by step."

	^Interval from: self to: stop by: step
]

{
	#category : #intervals,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>to: stop by: step do: aBlock [
	"Normally compiled in-line, and therefore not overridable.
	Evaluate aBlock for each element of the interval (self to: stop by: 
step)."
	| nextValue |
	nextValue := self.
	step = 0 ifTrue: [self error: 'step must be non-zero'].
	step < 0
		ifTrue: [[stop <= nextValue]
				whileTrue: 
					[aBlock value: nextValue.
					nextValue := nextValue + step]]
		ifFalse: [[stop >= nextValue]
				whileTrue: 
					[aBlock value: nextValue.
					nextValue := nextValue + step]]
]

{
	#category : #intervals,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>to: stop do: aBlock [
	"Normally compiled in-line, and therefore not overridable.
	Evaluate aBlock for each element of the interval (self to: stop by: 1)."
	| nextValue |
	nextValue := self.
	[nextValue <= stop]
		whileTrue: 
			[aBlock value: nextValue.
			nextValue := nextValue + 1]
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>truncateTo: aNumber [
	"Answer the next multiple of aNumber toward zero that is nearest the receiver.
	Examples:
               3.1479 truncateTo: 0.01 -> 3.14
               3.1479 truncateTo: 0.1 -> 3.1
               1923 truncateTo: 10 -> 1920
               3.1479 truncateTo: 0.005 -> 3.145
               -3.1479 truncateTo: 0.01 -> -3.14"

	^(self quo: aNumber) * aNumber
]

{
	#category : #'truncation and round off',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>truncated [
	"Answer an integer nearest the receiver toward zero."

	^self quo: 1
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>week [
 
 	^ self weeks
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>weeks [
 
 	^ Duration weeks: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>withNegativeSign [
	"Answer a number with same magnitude than receiver and negative sign."
	^self abs negated
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>year [
 
 	^self years
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>years [
 
 	^ Duration years: self
]
