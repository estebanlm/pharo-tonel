"
The titlebar area for and ExpanderMorph. Includes title label and expand/collapse button.
"
Class {
	#name : #ExpanderTitleMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'labelMorph',
		'buttonMorph',
		'expanded'
	],
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 13:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>adoptPaneColor: paneColor [
	"Update the fill styles, corner styles, label colour
	and expansion button indicator."
	
	super adoptPaneColor: paneColor.
	paneColor ifNil: [^self].
	self fillStyle: self normalFillStyle.
	self borderStyle baseColor: paneColor twiceDarker.
	self buttonMorph cornerStyle: self cornerStyle.
	self labelMorph color: paneColor contrastingColor.
	self changed: #expandLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>buttonMorph [
	"Answer the value of buttonMorph"

	^ buttonMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>buttonMorph: anObject [
	"Set the value of buttonMorph"

	buttonMorph := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>buttonWidth [
	"Answer based on scrollbar size."
	
	^(self theme scrollbarThickness + 3)
		max: self theme expanderTitleControlButtonWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>defaultBorderStyle [
	"Answer the default border style for the receiver."

	^BorderStyle raised width: 1
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>expandLabel [
	"Answer the label for the expand button."

	^AlphaImageMorph new image: (
		ScrollBar
			arrowOfDirection: (self expanded ifTrue: [#top] ifFalse: [#bottom])
			size: self buttonWidth - 3
			color: self paneColor darker)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>expanded [
	"Answer the value of expanded"

	^ expanded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>expanded: aBoolean [
	"Set the value of expanded"

	expanded := aBoolean.
	self
		changed: #expanded;
		changed: #expandLabel
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>extent: aPoint  [
	"Set the receiver's extent to value provided.
	Update the gradient fills."

	|answer|
	aPoint = self extent ifTrue: [^super extent: aPoint].
	answer := super extent: aPoint.
	self fillStyle isOrientedFill
		ifTrue: [self fillStyle: self normalFillStyle].
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>font [
	"Answer the label font"

	^((self labelMorph isKindOf: StringMorph) or: [self labelMorph isTextMorph])
		ifTrue: [self labelMorph font]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>font: aFont [
	"Set the label font"

	((self labelMorph isKindOf: StringMorph) or: [self labelMorph isTextMorph])
		ifTrue: [self labelMorph font: aFont]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		expanded: false;
		changeTableLayout;
		borderStyle: self defaultBorderStyle;
		layoutInset: (self theme expanderTitleInsetFor: self);
		listDirection: #leftToRight;
		listCentering: #center;
		wrapCentering: #center;
		buttonMorph: self newExpandButtonMorph;
		addMorph: self buttonMorph;
		labelMorph: self newLabelMorph;
		on: #mouseUp send: #toggleExpanded to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>labelMorph [
	"Answer the value of labelMorph"

	^ labelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>labelMorph: anObject [
	"Set the value of labelMorph.
	need to wrap to provide clipping!"

	labelMorph ifNotNil: [self removeMorph: labelMorph owner].
	labelMorph := anObject.
	labelMorph ifNotNil: [self addMorph: (
		Morph new
			color: Color transparent;
			changeTableLayout;
			layoutInset: 4 @ 0;
			listDirection: #leftToRight;
			listCentering: #center;
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			clipSubmorphs: true;
			addMorph: labelMorph)]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>newExpandButtonMorph [
	"Answer a new expand button."

	^(ControlButtonMorph
			on: self
			getState: nil
			action: #toggleExpanded
			label: #expandLabel)
		hResizing: #rigid;
		vResizing: #spaceFill;
		cornerStyle: self cornerStyle;
		extent: self buttonWidth asPoint
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>newLabelMorph [
	"Answer a new label morph for the receiver."

	^LabelMorph new
		hResizing: #spaceFill;
		vResizing: #shrinkWrap
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>normalFillStyle [
	"Return the normal fillStyle of the receiver."
	
	^self theme expanderTitleNormalFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>themeChanged [
	"Update the button corner style from default
	to match the receiver."
	
	super themeChanged.
	self buttonMorph cornerStyle: self cornerStyle
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>titleText [
	"Answer the text if the title morph is capable."

	^((self labelMorph isKindOf: StringMorph) or: [self labelMorph isTextMorph])
		ifTrue: [self labelMorph contents]
		ifFalse: ['']
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>titleText: aStringOrText [
	"Set the text if the title morph is capable."

	((self labelMorph isKindOf: StringMorph) or: [self labelMorph isTextMorph])
		ifTrue: [self labelMorph contents: aStringOrText]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderTitleMorph>>toggleExpanded [
	"Toggle the expanded state."

	self expanded: self expanded not
]
