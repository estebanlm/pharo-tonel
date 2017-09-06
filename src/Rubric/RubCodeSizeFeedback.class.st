"
I represent the colored feedback to alert a too long method
"
Class {
	#name : #RubCodeSizeFeedback,
	#superclass : #RubScrolledTextExtraSurface,
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:34'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback class>>key [
	^ #codeSizeFeedback
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>alertLimit [

	^ 2 * self warningLimit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>backgroundColor [
	"Return the current fillStyle of the receiver."

	| basicColor size |
	basicColor := Smalltalk ui theme backgroundColor.
	self paragraph ifNil: [ ^Color transparent ].
	size := self textSize.
	size >= self warningLimit
		ifTrue: [ 
			|  overshoot transitionSpan transitionColor |
			transitionSpan := self warningLimit.
			transitionColor := Color yellow mixed: 0.6 with: basicColor.
			size >= self alertLimit
				ifFalse: [ overshoot := size - self warningLimit ]
				ifTrue: [ 
					transitionSpan := self alertLimit - self warningLimit.
					basicColor := transitionColor mixed: 0.5 with: basicColor.
					transitionColor := (Color orange mixed: 0.5 with: Color red) mixed: 0.5 with: basicColor.
					overshoot := size - self alertLimit ].
			^ CompositeFillStyle
				fillStyles:
					{((GradientFillStyle
						ramp:
							{(0 -> transitionColor).
							(1 -> basicColor)})
						origin: (self bounds width / 2) asFloat @ self bounds bottom;
						direction: 0 @ (12 + (2 * self bounds height * overshoot / transitionSpan)) negated asFloat;
						normal: 0 @ 1;
						radial: false;
						yourself).
					((GradientFillStyle
						ramp:
							{(0 -> Smalltalk ui theme backgroundColor).
							(0.3 -> (Smalltalk ui theme backgroundColor alpha: 0.01))})
						origin: self bounds left @ (self bounds height / 2) asFloat;
						direction: self bounds width @ 0;
						normal: 1 @ 0;
						radial: false;
						yourself)} ].
	^ self normalColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>computedPositionFrom: aRectangle [
	^  ((aRectangle right min: self scrollBounds right) - (self computedWidthFrom: aRectangle)) @ aRectangle top

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>computedWidthFrom: aRectangle [
	^  (super computedWidthFrom: aRectangle) min: 50.

]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>defaultBackgroundColor [
	^ self backgroundColor 
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>drawOn: aCanvas [
	| font s |
	super drawOn: aCanvas.
	color = self normalColor
		ifTrue: [ ^ self ].
	font := self paragraph textStyle defaultFont.
	s := self textSize asString.
	aCanvas
		drawString: s
		in: (self bounds withTop: self bounds bottom - font height)
		font: font
		color: self stringColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>drawOnAthensCanvas: anAthensCanvas [
	| font s bnds |
	super drawOnAthensCanvas: anAthensCanvas.
	color = self normalColor
		ifTrue: [ ^ self ].
	font := self paragraph textStyle defaultFont.
	s := self textSize asString.
	bnds := self bounds withTop: self bounds bottom - font height.
	anAthensCanvas morphicDrawString: s in: bnds font: font color: self stringColor
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>extent: aPoint  [
	self updateColor.
	super extent: aPoint
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>ignoredCharacters [

	^ { Character space. Character tab. Character cr. $.. $;. $:. $'. $(. $) }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>normalColor [
	^ Color transparent
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>scrollerOffsetChanged [
	self updateColor.
	super scrollerOffsetChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>stringColor [
	| size |
	size := self textSize.
	self warningLimit negative ifTrue: [ ^ Color black ].
	^ size >= self warningLimit
			ifTrue: [
				size >= self alertLimit
					ifTrue: [ Color red ]
					ifFalse: [ Color orange ]]
			ifFalse: [ Color black ].
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>textChanged [
	self updateColor.
	super textChanged
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>textSize [
	| result count ignoredCharacters |
	result := 0.
	count := true.
	ignoredCharacters := self ignoredCharacters.
	self text string
		do: [ :char | 
			result > (self alertLimit * 3) 
				ifTrue: [ ^result ].
			(#($' $") includes: char)
				ifTrue: [ count := count not ]
				ifFalse: [ 
					((ignoredCharacters includes: char) not and: [ count ])
						ifTrue: [ result := result + 1 ] ] ].
	^ result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>updateColor [
	self color: self backgroundColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCodeSizeFeedback>>warningLimit [

	^ 350
]
