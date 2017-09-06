"
I describe a font.
"
Class {
	#name : #LogicalFont,
	#superclass : #AbstractFont,
	#instVars : [
		'realFont',
		'emphasis',
		'familyName',
		'fallbackFamilyNames',
		'pointSize',
		'stretchValue',
		'weightValue',
		'slantValue',
		'derivatives',
		'boldDerivative',
		'italicDerivative',
		'boldItalicDerivative'
	],
	#classInstVars : [
		'all'
	],
	#category : #FontInfrastructure,
	#timestamp : 'LaurentLaffont 6/8/2011 22:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>all [
	^all ifNil:[
		all := WeakSet new
			addAll: self allInstances;
			yourself]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>familyName: familyName fallbackFamilyNames: fallbackFamilyNames pointSize: pointSize  [
	
	^self familyName: familyName fallbackFamilyNames: fallbackFamilyNames pointSize: pointSize stretchValue: 5 weightValue: 400 slantValue: 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>familyName: familyName fallbackFamilyNames: fallbackFamilyNames pointSize: pointSize stretchValue: stretch weightValue: weight slantValue: slant [

	"^self all asArray"
	"^(self all collect:[:each | each]) asArray"
	^self all
		detect:[:each |
			each familyName = familyName and:[
			each fallbackFamilyNames = fallbackFamilyNames and:[
			each pointSize = pointSize and:[
			each weightValue = weight and:[
			each stretchValue = stretch and:[
			each slantValue = slant]]]]]]
		ifNone:[
			self  new
				familyName: familyName; 
				fallbackFamilyNames: fallbackFamilyNames;
				pointSize: pointSize; 
				weightValue:weight;
				stretchValue: stretch;
				slantValue: slant;
				yourself]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>familyName: familyName pointSize: pointSize  [
	
	^self familyName: familyName fallbackFamilyNames: nil pointSize: pointSize stretchValue: 5 weightValue: 400 slantValue: 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>familyName: familyName pointSize: pointSize stretchValue: stretch weightValue: weight slantValue: slant [

	^self familyName: familyName fallbackFamilyNames: nil pointSize: pointSize stretchValue: stretch weightValue: weight slantValue: slant
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>initialize [
	SessionManager default
		registerGuiClassNamed: self name
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>new [
	
	^self all add: super new
]

{
	#category : #shutdown,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>shutDown: quitting  [

	self  allSubInstances do: [:i | i clearRealFont].
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantBackslanted [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantBook [
	^0
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantCursive [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantInclined [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantItalic [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantKursiv [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantNormal [
	^0
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantOblique [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantRegular [
	^0
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantRoman [
	^0
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantSlanted [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>slantUpright [
	^0
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>squeakSlantItalic [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>squeakStretchCondensed [
	^8
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>squeakWeightBold [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchCompact [
	^4
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchCompressed [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchCondensed [
	^3
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExpanded [
	^7
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExtended [
	^7
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExtraCompressed [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExtraCondensed [
	^2
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExtraExpanded [
	^8
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchExtraExtended [
	^8
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchNarrow [
	^4
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchRegular [
	^5
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchSemiCondensed [
	^4
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchSemiExpanded [
	^6
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchSemiExtended [
	^6
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchUltraCompressed [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchUltraCondensed [
	^1
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchUltraExpanded [
	^9
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchUltraExtended [
	^9
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>stretchWide [
	^6
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightBlack [
	^900
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightBold [
	^700
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightDemi [
	^600
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightDemiBold [
	^600
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightExtraBlack [
	^950
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightExtraBold [
	^800
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightExtraLight [
	^200
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightExtraThin [
	^100
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightHeavy [
	^900
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightLight [
	^300
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightMedium [
	^500
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightNord [
	^900
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightRegular [
	^400
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightSemiBold [
	^600
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightThin [
	^100
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightUltra [
	^800
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightUltraBlack [
	^950
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightUltraBold [
	^800
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightUltraLight [
	^200
]

{
	#category : #'emphasis values',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont class>>weightUltraThin [
	^100
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>ascent [
	^self realFont ascent
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>baseKern [
	^self realFont baseKern
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>characterFormAt: aCharacter [
	^self realFont characterFormAt: aCharacter
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>characterToGlyphMap [
	"Provided only for accelerating text scanning thru primitive 103 - see super."
	^self realFont characterToGlyphMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>clearRealFont [
	realFont := nil
]

{
	#category : #derivatives,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>derivativeFont: newFont [
	"add aFont as derivative, answer new basefont"
	(self isRegular and: [newFont isRegular not]) ifTrue: [
		self derivativeFontsAt: newFont emphasis put: newFont.
		^self].
	"new font is base, copy everything over"
	self isRegular
		ifFalse: [newFont derivativeFontsAt: self emphasis put: self].
	self derivativeFonts do: [:f |
		newFont derivativeFontsAt: f emphasis put: f].
	derivatives := nil.
	^newFont
]

{
	#category : #derivatives,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>derivativeFont: newFont mainFont: ignore [
	self derivativeFont: newFont
]

{
	#category : #derivatives,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>derivativeFonts [

	derivatives ifNil: [^ #()].
	^derivatives copyWithout: nil
]

{
	#category : #derivatives,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>derivativeFontsAt: index put: aFont [

	derivatives ifNil:[derivatives := Array new: 32].
	derivatives at: index put: aFont
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>descent [
	^self realFont descent
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>descentKern [
	^self realFont descentKern
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>displayStrikeoutOn: aGrafPort from: aPoint to: aPoint3  [
	^self realFont displayStrikeoutOn: aGrafPort from: aPoint to: aPoint3 
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta [
	^self realFont displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>displayString: aWideString on: aGrafPort from: aSmallInteger to: aSmallInteger4 at: aPoint kern: aSmallInteger6 baselineY: aSmallInteger7  [
	^self realFont displayString: aWideString on: aGrafPort from: aSmallInteger to: aSmallInteger4 at: aPoint kern: aSmallInteger6 baselineY: aSmallInteger7 
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>displayUnderlineOn: aGrafPort from: aPoint to: aPoint3  [
	^self realFont displayUnderlineOn: aGrafPort from: aPoint to: aPoint3 
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>emphasis [
	"Answer the squeak emphasis code for the receiver.
	1=bold, 2=italic, 3=bold-italic etc"
	| answer |
	answer := 0.
	self isBoldOrBolder ifTrue:[answer := answer + self class squeakWeightBold].
	self isItalicOrOblique ifTrue:[answer := answer + self class squeakSlantItalic].
	^answer
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>emphasis: code [
	
	^self emphasized: code
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>emphasisString [
	^AbstractFont emphasisStringFor: emphasis
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>emphasized: code [
	| validCode newWeight newSlant answer validCodeMask |
	"we only handle bold and italic here since underline/strikeout are drawn separately"
	validCodeMask := self class squeakWeightBold bitOr: self class squeakSlantItalic.
	validCode := code bitAnd: validCodeMask.
	validCode = 0
		ifTrue: [ ^ self ].
	newWeight := (validCode anyMask: self class squeakWeightBold)
		ifTrue: [ self class weightBold max: weightValue ]
		ifFalse: [ weightValue ].
	newSlant := ((validCode anyMask: self class squeakSlantItalic) and: [ self isItalicOrOblique not ])
		ifTrue: [ self class slantItalic ]
		ifFalse: [ slantValue ].
	(weightValue = newWeight and: [ slantValue = newSlant ])
		ifTrue: [ ^ self ].
	(weightValue ~= newWeight and: [ slantValue ~= newSlant ])
		ifTrue: [ boldItalicDerivative ifNotNil: [ ^ boldItalicDerivative ] ]
		ifFalse: [ 
			weightValue ~= newWeight
				ifTrue: [ boldDerivative ifNotNil: [ ^ boldDerivative ] ].
			slantValue ~= newSlant
				ifTrue: [ italicDerivative ifNotNil: [ ^ italicDerivative ] ] ].
	answer := self class
		familyName: familyName
		fallbackFamilyNames: fallbackFamilyNames
		pointSize: pointSize
		stretchValue: stretchValue
		weightValue: newWeight
		slantValue: newSlant.
	(weightValue ~= newWeight and: [ slantValue ~= newSlant ])
		ifTrue: [ ^ boldItalicDerivative := answer ].
	weightValue ~= newWeight
		ifTrue: [ ^ boldDerivative := answer ].
	slantValue ~= newSlant
		ifTrue: [ ^ italicDerivative := answer ].
	^ answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>fallbackFamilyNames [
	^fallbackFamilyNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>fallbackFamilyNames: aSequencableCollection [
	fallbackFamilyNames := aSequencableCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>familyName [
	^familyName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>familyName: aString [
	familyName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>familyNames [
	"Answer an array containing the receiver's familyName
	followed by any fallbackFamilyNames"
	|answer|
	answer := {familyName}.
	fallbackFamilyNames ifNotNil:[
		answer := answer, fallbackFamilyNames].
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>familySizeFace [
	"should have default in AbstractFont"
	^{self familyName. self pointSize. self emphasis}
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>findRealFont [
	"for now just get a strike"
	"^((TextStyle named: StrikeFont defaultFontKey) fontOfPointSize: pointSize)
		emphasized: emphasis"
	^LogicalFontManager current bestFontFor: self
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>fontArray [
	| real | 
	real := self realFont.
	^real isFontSet 
		ifTrue: [real fontArray] 
		ifFalse: [{self}]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>forceBold [
	weightValue := (self weightValue max: 700).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>forceItalicOrOblique [
	self slantValue = 0 ifTrue:[slantValue := 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>forceNotBold [
	"anything other than bold (700) is not changed.
	we only remove boldness that can be put back with 
	a TextAttribute bold."
	
	self weightValue = 700 
		ifTrue:[weightValue := 400].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>forceNotItalic [
	"leave oblique style in place"
	slantValue = 1 ifTrue:[slantValue := 0].
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>hasDistinctGlyphsForAll: asciiString [
	
	^self realFont hasDistinctGlyphsForAll: asciiString
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>hasGlyphsForAll: asciiString [
	
	^self realFont hasGlyphsForAll: asciiString
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>height [
	^self realFont height
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>initialize: aFont [

	familyName := aFont familyName.
	emphasis := aFont emphasis.
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>installOn: a foregroundColor: b backgroundColor: c [
	^self realFont installOn: a foregroundColor: b backgroundColor: c
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isBold [
	^self isBoldOrBolder
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isBoldOrBolder [
	^(weightValue ifNil:[400]) >= 700
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isItalic [
	^self isItalicOrOblique
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isItalicOrOblique [
	slantValue ifNil:[slantValue := 0].
	^slantValue = 1 or:[slantValue = 2]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isRegular [
	^emphasis = 0
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isSubPixelPositioned [
	"Answer true if the receiver is currently using subpixel positioned
	glyphs, false otherwise. This affects how padded space sizes are calculated
	when composing text. 
	Currently, only FreeTypeFonts are subPixelPositioned, and only when not
	Hinted"
	
	^self realFont isSubPixelPositioned
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isSymbolFont [
	
	^self realFont isSymbolFont
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>isTTCFont [
	^self realFont isTTCFont
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>kerningLeft: leftChar right: rightChar [
	^self realFont kerningLeft: leftChar right: rightChar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>lineGrid [

	^realFont lineGrid 
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>linearWidthOf: aCharacter [
	^self realFont linearWidthOf: aCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>maxAscii [
	"???
	what to do if realFont happens to be a StrikeFontSet?"
	^SmallInteger maxVal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>pointSize [
	^pointSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>pointSize: aNumber [
	pointSize := aNumber
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>printOn: aStream [
	super printOn: aStream.
	aStream
		cr;
		nextPutAll: ' familyName: ';
		nextPutAll: familyName asString;
		cr;
		nextPutAll: ' emphasis: ';
		nextPutAll: emphasis asString;
		cr;
		nextPutAll: ' pointSize: ';
		nextPutAll: pointSize asString;
		cr;
		nextPutAll: ' realFont: ';
		nextPutAll: realFont asString;
		nextPutAll: ' weight: ';
		nextPutAll: weightValue asString;
		nextPutAll: ' stretch: ';
		nextPutAll: stretchValue asString;
		nextPutAll: ' slant: ';
		nextPutAll: slantValue asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>realFont [
	realFont ifNil:[ realFont := self findRealFont ].
	realFont validate.
	^ realFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>setEmphasis: code [

	emphasis := code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>slantValue [
	"Answer the value of slantValue"

	^ slantValue ifNil:[slantValue := 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>slantValue: anObject [
	"Set the value of slantValue"

	slantValue := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>storeOn: aStream [

	aStream 
		nextPutAll: 'LogicalFont';
		nextPutAll: '
		familyName: '; nextPutAll: self familyName printString ;
		nextPutAll: '
		pointSize: '; nextPutAll: self pointSize asString;
		nextPutAll: '
		stretchValue: '; nextPutAll: self stretchValue asString;
		nextPutAll: '
		weightValue: '; nextPutAll: self weightValue asString;
		nextPutAll: '
		slantValue: '; nextPutAll: self slantValue asString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>stretchValue [
	"Answer the value of stretchValue"

	^ stretchValue ifNil:[stretchValue := 5]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>stretchValue: anObject [
	"Set the value of stretchValue"

	stretchValue := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>weightValue [
	"Answer the value of weightValue"

	^ weightValue ifNil:[weightValue := 400]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>weightValue: anObject [
	"Set the value of weightValue"

	weightValue := anObject
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>widthAndKernedWidthOfLeft: leftCharacter right: rightCharacterOrNil into: aTwoElementArray [
	^self realFont widthAndKernedWidthOfLeft: leftCharacter right: rightCharacterOrNil into: aTwoElementArray
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>widthOf: anObject [
	^self realFont widthOf: anObject
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>widthOfString: aString [
	^self realFont widthOfString: aString
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>widthOfString: aString from: startIndex to: stopIndex [
	^self realFont widthOfString: aString from: startIndex to: stopIndex
]

{
	#category : #'forwarded to realFont',
	#timestamp : ' 8/31/2017 05:26:12'
}
LogicalFont>>xTable [
	"Provided only for accelerating text scanning thru primitive 103 - see super."
	^self realFont xTable
]
