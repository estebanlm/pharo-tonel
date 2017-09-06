"
AbstractFont defines the generic interface that all fonts need to implement.
"
Class {
	#name : #AbstractFont,
	#superclass : #Object,
	#category : #Graphics-Fonts,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont class>>emphasisStringFor: emphasisCode [
	"Answer a translated string that represents the attributes given in emphasisCode."

	| emphases |
	emphasisCode = 0 ifTrue: [ ^'Normal' translated ].

	emphases := (IdentityDictionary new)
		at: 1 put: 'Bold' translated;
		at: 2 put: 'Italic' translated;
		at: 4 put: 'Underlined' translated;
		at: 8 put: 'Narrow' translated;
		at: 16 put: 'StruckOut' translated;
		yourself.

	^String streamContents: [ :s | | bit |
		bit := 1.
		[ bit < 32 ] whileTrue: [ | code |
			code := emphasisCode bitAnd: bit.
			code isZero ifFalse: [ s nextPutAll: (emphases at: code); space ].
			bit := bit bitShift: 1 ].
		s position isZero ifFalse: [ s skip: -1 ].
	]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont class>>initialize [

  TextStyle addDependent: self.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont class>>update: anAspect [

	anAspect == #textDPIChanged ifTrue: [
		AbstractFont allSubInstancesDo: [ :font | font pixelsPerInchChanged ]].
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>approxWidthOfText: aText  [
	"Return the width of aText -- quickly, and a little bit dirty. Used by lists morphs containing Text objects to get a quick, fairly accurate measure of the width of a list item."
	| w |
	(aText isNil or: [ aText size = 0 ]) ifTrue: [ ^ 0 ].
	w := self widthOfString: aText asString.

	"If the text has no emphasis, just return the string size.  If it is empasized, 
    just approximate the width by adding about 20% to the width"
	((aText runLengthFor: 1) = aText size and: [ (aText emphasisAt: 1) = 0 ]) 
		ifTrue: [ ^ w ]
		ifFalse: [ ^ w * 6 // 5 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>ascent [

	self subclassResponsibility.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>ascentOf: aCharacter [

	^ self ascent.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>baseKern [
	^0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>basicAscentOf: aCharacter [

	^ self ascent.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>basicDescentOf: aCharacter [

	^ self descent.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>characterToGlyphMap [
	"Return the character to glyph mapping table. If the table is not provided the character scanner will query the font directly for the width of each individual character."
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>derivativeFonts [
	^#()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>descent [

	self subclassResponsibility.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>descentOf: aCharacter [

	^ self descent.

]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta [
	"Draw the given string from startIndex to stopIndex 
	at aPoint on the (already prepared) display context."
	^self subclassResponsibility
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta baselineY: baselineY [
	"Draw the given string from startIndex to stopIndex 
	at aPoint on the (already prepared) display context."
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>familyName [
	"Answer the name to be used as a key in the TextConstants dictionary."
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>height [
	"Answer the height of the receiver, total of maximum extents of 
	characters above and below the baseline."

	^self subclassResponsibility
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>installOn: aDisplayContext foregroundColor: foregroundColor backgroundColor: backgroundColor [
	"Install the receiver on the given DisplayContext (either BitBlt or Canvas) for further drawing operations."
	^self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>isFontSet [

	^ false.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>isRegular [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>isTTCFont [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>lineGrid [
	"Answer the relative space between lines"

	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>pixelSize [
	"Make sure that we don't return a Fraction"
	^ TextStyle pointsToPixels: self pointSize
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>pixelsPerInchChanged [
	"The definition of TextStyle class>>pixelsPerInch has changed. Do whatever is necessary."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>pointSize [
	self subclassResponsibility.
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>releaseCachedState [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>textStyle [
	^ TextStyle actualTextStyles detect:
		[:aStyle | aStyle fontArray includes: self] ifNone: [ TextStyle fontArray: { self } ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>textStyleName [
	"Answer the name to be used as a key in the TextConstants dictionary."
	^self familyName
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>validate [
	"Concrete classes should override this to provide validation"
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>widthOf: aCharacter [
	"Return the width of the given character"
	^self subclassResponsibility
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>widthOfString: aString [
	aString ifNil: [^0].
	^self widthOfString: aString from: 1 to: aString size.
"
	TextStyle default defaultFont widthOfString: 'zort' 21
"
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>widthOfString: aString from: firstIndex to: lastIndex  [
	"Measure the length of the given string between start and stop index"
	| resultX |
	resultX := 0.
	firstIndex 
		to: lastIndex
		do: [ :i | resultX := resultX + (self widthOf: (aString at: i)) ].
	^ resultX
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>widthOfStringOrText: aStringOrText [
    aStringOrText ifNil: [^0].
    ^aStringOrText isText
        ifTrue:[self approxWidthOfText: aStringOrText ]
        ifFalse:[self widthOfString: aStringOrText ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AbstractFont>>xTable [
	"Return the xTable for the font. The xTable defines the left x-value for each individual glyph in the receiver. If such a table is not provided, the character scanner will ask the font directly for the appropriate width of each individual character."
	^nil
]
