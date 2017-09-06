"
I provide convenience methods to create morphs.
"
Class {
	#name : #EpMorphFactory,
	#superclass : #Object,
	#classInstVars : [
		'defaultInstance'
	],
	#category : #EpiceaBrowsers-UI-Common,
	#timestamp : 'MartinDias 8/11/2016 23:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory class>>default [
	^ defaultInstance ifNil: [ defaultInstance := self new ]
]

{
	#category : #strings,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>emphasizedStringFor: aString [

	| morph |
	morph := aString asMorph
		emphasis: 1;
		yourself.

	"Hack: emphazised string has 3 blank pixels at the end"
	morph width: (morph width - 3). "pffff"
		
	^ morph
]

{
	#category : #strings,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>pillWith: aString  [
	
	^ (self wrapping: aString)
		borderWidth: 1;
		borderColor: (self textColor alpha: 0.5);
		useRoundedCorners;
		yourself
]

{
	#category : #generic,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>rowWithAll: someMophs [

	^ Morph new
		changeTableLayout;
		color: Color transparent;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		listDirection: #leftToRight;
		cellInset: 2;
		addAllMorphs: someMophs;
		yourself
]

{
	#category : #strings,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>secondaryStringFor: aString [

	^ self stringFor: aString color: self secondaryTextColor
]

{
	#category : #colors,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>secondaryTextColor [

	^ Smalltalk ui theme caretColor mixed: 0.5 with: Color gray
]

{
	#category : #generic,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>semiTransparent: aForm  [

	^ AlphaImageMorph new 
		image: aForm; 
		alpha: 0.5; 
		yourself
]

{
	#category : #generic,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>smallGap [

	^ self wrapping: ''
]

{
	#category : #colors,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>softerTextColor [

	^ self textColor mixed: 0.1 with: Color gray
]

{
	#category : #strings,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>stringFor: aString color: aColor [

	^ aString asMorph
		color: aColor;
		yourself
]

{
	#category : #colors,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>textColor [

	^ Smalltalk ui theme textColor
]

{
	#category : #strings,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphFactory>>wrapping: aMorphOrString [

	^ Morph new
		changeTableLayout;
		color: Color transparent;
		addMorphBack: aMorphOrString asMorph;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 2@0;
		yourself
]
