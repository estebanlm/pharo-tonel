"

"
Class {
	#name : #IncrementalSliderMorph,
	#superclass : #MorphicModel,
	#instVars : [
		'sliderMorph',
		'getValueSelector',
		'setValueSelector',
		'getEnabledSelector'
	],
	#category : #Morphic-Widgets-Scrolling,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph class>>on: anObject getValue: getSel setValue: setSel [
	"Answer a new instance of the receiver with
	the given selectors as the interface."

	^self new
		on: anObject
		getValue: getSel
		setValue: setSel
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph class>>on: anObject getValue: getSel setValue: setSel min: min max: max quantum: quantum [
	"Answer a new instance of the receiver with
	the given selectors as the interface."

	^self new
		min: min;
		max: max;
		quantum: quantum;
		on: anObject
		getValue: getSel
		setValue: setSel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>buttons [
	"Answer the buttons."

	^{self firstSubmorph. self lastSubmorph}
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>decrement [
	"Decrement the value."

	self value: self value - self quantum
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>defaultSliderFillStyle [
	"Answer the hue gradient."

	^(GradientFillStyle colors: {Color white. Color black})
		origin: self topLeft;
		direction: (self bounds isWide
					ifTrue: [self width@0]
					ifFalse: [0@self height])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>enabled [
	"Answer whether the receiver is enabled for user input."

	^self sliderMorph
		ifNil: [super enabled]
		ifNotNil: [:sm | sm enabled]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>enabled: aBoolean [
	"Set whether the receiver is enabled for user input."

	self sliderMorph ifNotNil: [:sm | sm enabled: aBoolean].
	self
		changed: #enabled;
		changed: #minEnabled;
		changed: #maxEnabled
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>extent: aPoint [
	"Set the button width to match the height."

	self extent = aPoint ifTrue: [^self].
	super extent: aPoint.
	self updateOrientation: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>getEnabledSelector [
	"Answer the value of getEnabledSelector"

	^ getEnabledSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>getEnabledSelector: aSymbol [
	"Set the value of getEnabledSelector"

	getEnabledSelector := aSymbol.
	self updateEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>getValueSelector [
	"Answer the value of getValueSelector"

	^ getValueSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>getValueSelector: anObject [
	"Set the value of getValueSelector"

	getValueSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>increment [
	"Increment the value."

	self value: self value + self quantum
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self sliderMorph: self newSliderMorph.
	self
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 0;
		borderWidth: 0;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderColor: Color transparent;
		addMorphBack: self newDecrementButton;
		addMorphBack: self sliderMorph;
		addMorphBack: self newIncrementButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>max [
	"Answer the max value."

	^(self sliderMorph ifNil: [^0]) max
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>max: aNumber [
	"Set the max value."

	(self sliderMorph ifNil: [^self]) max: aNumber
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>maxEnabled [
	"Answer whether the maximum button should be enabled."

	^self enabled and: [self notAtMax]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>min [
	"Answer the min value."

	^(self sliderMorph ifNil: [^0]) min
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>min: aNumber [
	"Set the min value."

	(self sliderMorph ifNil: [^self]) min: aNumber
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>minEnabled [
	"Answer whether the minimum button should be enabled."

	^self enabled and: [self notAtMin]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>minExtent [
	"Must answer a fixed small size here to
	allow auto orientation to work."
	
	|superMin|
	superMin := super minExtent.
	^(24 max: superMin x) @ (24 max: superMin y)
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>newButtonLabel: direction ofSize: size [
	"Answer a new label for an inc/dec button."

	^AlphaImageMorph new
		image: (ScrollBar
				arrowOfDirection: direction
				size: size
				color: self paneColor darker)
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>newDecrementButton [
	"Answer a new decrement button."

	^(self theme builder
		newButtonFor: self
		action: #decrement
		getEnabled: #minEnabled
		label: (self newButtonLabel: #left ofSize: 24)
		help: nil)
		vResizing: #spaceFill;
		width: 64;
		roundedCorners: #(1 2);
		setProperty: #wantsKeyboardFocusNavigation toValue: false;
		on: #mouseStillDown send: #decrement to: self
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>newIncrementButton [
	"Answer a new increment button."

	^(self theme builder
		newButtonFor: self
		action: #increment
		getEnabled: #maxEnabled
		label: (self newButtonLabel: #right ofSize: 24)
		help: nil)
		vResizing: #spaceFill;
		width: 64;
		roundedCorners: #(3 4);
		setProperty: #wantsKeyboardFocusNavigation toValue: false;
		on: #mouseStillDown send: #increment to: self
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>newSliderMorph [
	"Answer a new morph for the slider."

	|slider|
	slider := self theme builder
		newBracketSliderFor: self
		getValue: #value
		setValue: #value:
		min: 0
		max: 100
		quantum: 1
		getEnabled: #enabled
		help: nil.
	slider fillStyle: self defaultSliderFillStyle.
	^slider
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>notAtMax [
	"Answer whether the value is not at the maximum,"

	^self value < self max
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>notAtMin [
	"Answer whether the value is not at the minimum,"

	^self value > self min
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>on: anObject getValue: getSel setValue: setSel [
	"Use the given selectors as the interface."

	self
		model: anObject;
		getValueSelector: getSel;
		setValueSelector: setSel;
		updateValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>quantum [
	"Answer the quantum value."

	^(self sliderMorph ifNil: [^0]) quantum
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>quantum: aNumber [
	"Set the quantum value."

	(self sliderMorph ifNil: [^self]) quantum: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>setValueSelector [
	"Answer the value of setValueSelector"

	^ setValueSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>setValueSelector: anObject [
	"Set the value of setValueSelector"

	setValueSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>sliderMorph [
	"Answer the value of sliderMorph"

	^ sliderMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>sliderMorph: anObject [
	"Set the value of sliderMorph"

	sliderMorph := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>update: aSymbol [
	"Update the value."
	
	super update: aSymbol.
	aSymbol = self getValueSelector
		ifTrue: [^self updateValue].
	aSymbol = self getEnabledSelector
		ifTrue: [^self updateEnabled]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>updateEnabled [
	"Update the enablement state."

	self model ifNotNil: [
		self getEnabledSelector ifNotNil: [
			self enabled: (self model perform: self getEnabledSelector)]]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>updateOrientation: aPoint [
	"Set the layout for the new extent."

	|butts|
	butts := self buttons.
	aPoint x >= aPoint y
		ifTrue: [self listDirection: #leftToRight.
				butts first
					roundedCorners: #(1 2);
					hResizing: #rigid;
					vResizing: #spaceFill;
					width: aPoint y;
					label: (self newButtonLabel: #left ofSize: aPoint y // 2).
				butts last
					roundedCorners: #(3 4);
					hResizing: #rigid;
					vResizing: #spaceFill;
					width: aPoint y;
					label: (self newButtonLabel: #right ofSize: aPoint y // 2)]
		ifFalse: [self listDirection: #topToBottom.
				butts first
					roundedCorners: #(1 4);
					hResizing: #spaceFill;
					vResizing: #rigid;
					height: aPoint x;
					label: (self newButtonLabel: #top ofSize: aPoint x // 2).
				butts last
					roundedCorners: #(2 3);
					hResizing: #spaceFill;
					vResizing: #rigid;
					height: aPoint x;
					label: (self newButtonLabel: #bottom ofSize: aPoint x // 2)]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>updateValue [
	"Update the value."
	
	self model ifNotNil: [
		self getValueSelector ifNotNil: [
			self sliderMorph ifNotNil: [:sm |
				sm scaledValue: self value.
			self changed: #minEnabled; changed: #maxEnabled]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>value [
	"Answer the slider value."

	^self getValueSelector
		ifNil: [(self sliderMorph ifNil: [^0]) scaledValue]
		ifNotNil: [self model
					ifNil: [(self sliderMorph ifNil: [^0]) scaledValue]
					ifNotNil: [self model perform: self getValueSelector]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IncrementalSliderMorph>>value: aNumber [
	"Set the slider value."

	(self sliderMorph ifNil: [^self]) scaledValue: aNumber.
	self model ifNotNil: [
		self setValueSelector ifNotNil: [
			self model perform: self setValueSelector with: self sliderMorph scaledValue]].
	self changed: #minEnabled; changed: #maxEnabled
]
