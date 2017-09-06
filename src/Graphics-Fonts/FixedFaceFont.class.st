"
I am a font for special purpose like password or fallback.
I can show same form whenever someone requests any character.

Variable displaySelector is future use to show a form dynamically.
(Although it would be unnecessary...)
"
Class {
	#name : #FixedFaceFont,
	#superclass : #AbstractFont,
	#instVars : [
		'baseFont',
		'substitutionCharacter',
		'displaySelector'
	],
	#category : #Graphics-Fonts,
	#timestamp : 'tak 12/22/2004 01:45'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>ascent [
	^baseFont ascent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>baseFont [
	^baseFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>baseFont: aFont [
	baseFont := aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>baseKern [
	^baseFont baseKern
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>characterFormAt: character  [
	^ baseFont characterFormAt: substitutionCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>descent [
	^baseFont descent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>descentKern [
	^baseFont descentKern
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayErrorOn: aCanvas length: length at: aPoint kern: kernDelta  [
	| maskedString |
	maskedString := String new: length.
	maskedString atAllPut: substitutionCharacter.
	^ baseFont
		displayString: maskedString
		on: aCanvas
		from: 1
		to: length
		at: aPoint
		kern: kernDelta
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayErrorOn: aCanvas length: length at: aPoint kern: kernDelta baselineY: baselineY [
	| maskedString |
	maskedString := String new: length.
	maskedString atAllPut: substitutionCharacter.
	^ baseFont
		displayString: maskedString
		on: aCanvas
		from: 1
		to: length
		at: aPoint
		kern: kernDelta
		baselineY: baselineY
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayPasswordOn: aCanvas length: length at: aPoint kern: kernDelta  [
	| maskedString |
	maskedString := String new: length.
	maskedString atAllPut: substitutionCharacter.
	^ baseFont
		displayString: maskedString
		on: aCanvas
		from: 1
		to: length
		at: aPoint
		kern: kernDelta
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayPasswordOn: aCanvas length: length at: aPoint kern: kernDelta baselineY: baselineY [
	| maskedString |
	maskedString := String new: length.
	maskedString atAllPut: substitutionCharacter.
	^ baseFont
		displayString: maskedString
		on: aCanvas
		from: 1
		to: length
		at: aPoint
		kern: kernDelta
		baselineY: baselineY
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta  [
	| size |
	size := stopIndex - startIndex + 1.
	^ self perform: displaySelector withArguments: (Array with: aDisplayContext with: size with: aPoint with: kernDelta with: aPoint y + self ascent).
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta baselineY: baselineY [
	| size |
	size := stopIndex - startIndex + 1.
	^ self perform: displaySelector withArguments: (Array with: aDisplayContext with: size with: aPoint with: kernDelta with: baselineY).
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta from: fromFont  [
	| destPoint |
	destPoint := self
				displayString: aString
				on: aBitBlt
				from: startIndex
				to: stopIndex
				at: aPoint
				kern: kernDelta.
	^ Array with: stopIndex + 1 with: destPoint
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>displayString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta from: fromFont baselineY: baselineY [
	| destPoint |
	destPoint := self
				displayString: aString
				on: aBitBlt
				from: startIndex
				to: stopIndex
				at: aPoint
				kern: kernDelta
				baselineY: baselineY.
	^ Array with: stopIndex + 1 with: destPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>emphasized: emph [
	^self class new baseFont: (baseFont emphasized: emph)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>errorFont [
	displaySelector := #displayErrorOn:length:at:kern:baselineY:.
	substitutionCharacter := $?.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>familyName [
	^baseFont familyName, '-pw'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>fontSize: aNumber  [
	self baseFont: (StrikeFont familyName: baseFont familyName size: aNumber) copy
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>glyphInfoOf: aCharacter into: glyphInfoArray [

	^ baseFont glyphInfoOf: substitutionCharacter into: glyphInfoArray.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>height [
	^baseFont height
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>initialize [
	super initialize.
	baseFont := TextStyle defaultFont.
	self passwordFont
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>installOn: aDisplayContext foregroundColor: foregroundColor backgroundColor: backgroundColor [
	^baseFont installOn: aDisplayContext foregroundColor: foregroundColor backgroundColor: backgroundColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>lineGrid [
	^baseFont lineGrid
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>maxAscii [
	^ SmallInteger maxVal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>passwordCharacter [
	^$*
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>passwordFont [
	displaySelector := #displayPasswordOn:length:at:kern:baselineY:.
	substitutionCharacter := $*
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>pointSize [
	^baseFont pointSize
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>releaseCachedState [
	baseFont releaseCachedState.
]

{
	#category : #measuring,
	#timestamp : ' 8/31/2017 05:26:13'
}
FixedFaceFont>>widthOf: aCharacter  [
	^ baseFont widthOf: substitutionCharacter
]
