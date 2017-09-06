"
Specially themed label used for tab selector items. 
"
Class {
	#name : #TabLabelMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'tabSelector',
		'normalLabel',
		'selectedLabel'
	],
	#category : #Morphic-Widgets-PolyTabs,
	#timestamp : 'gvc 9/23/2008 11:49'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>adoptPaneColor: paneColor [
	"Use the theme for fillStyle and border."
	
	super adoptPaneColor: paneColor.
	paneColor ifNil: [^self].
	self fillStyle: self fillStyleToUse.
	self borderStyle: self borderStyleToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>borderStyleToUse [
	"Answer the borderStyle that should be used for the receiver."
	
	^self isSelected
		ifTrue: [self theme tabLabelSelectedBorderStyleFor: self]
		ifFalse: [self theme tabLabelNormalBorderStyleFor: self]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>extent: aPoint [
	"Set the extent of the receiver.
	Update the pane color for size dependent fill/border styles."

	super extent: aPoint.
	self adoptPaneColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>fillStyleToUse [
	"Answer the basic fill style for the receiver."

	^self isSelected
		ifTrue: [self selectedFillStyle] 
		ifFalse: [self normalFillStyle]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>focusBounds [
	"Answer the bounds for drawing the focus indication."

	^(self bounds width < 6 or: [self bounds height < 6])
		ifTrue: [super focusBounds]
		ifFalse: [super focusBounds insetBy: (2@2 corner: 2@0)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>font: aFont [
	"Set the label font"

	self normalLabel allMorphsDo: [:m |
		(m respondsTo: #font:) ifTrue: [m font: aFont]].
	self selectedLabel allMorphsDo: [:m |
		(m respondsTo: #font:) ifTrue: [m font: aFont]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>initialize [
	"Initialize the receiver."
	
	super initialize.
	self fillStyle: self fillStyleToUse.
	self borderStyle: self borderStyleToUse
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>isSelected [
	"Answer whether the tab is selected."

	^self tabSelector
		ifNil: [false]
		ifNotNil: [:selector | selector selectedTab == self]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>isVisible [
	"Answer whether the tab is currently visible."

	^self tabSelector
		ifNil: [false]
		ifNotNil: [:selector | selector visibleTabs includes: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>label [
	"Answer the label contents."

	^self isSelected
		ifTrue: [self selectedLabel userString ifNil: [self firstSubmorph]]
		ifFalse: [self normalLabel userString ifNil: [self firstSubmorph]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>label: aStringOrMorph [
	"Change the label contents"

	|l|
	l := aStringOrMorph isMorph
		ifTrue: [aStringOrMorph]
		ifFalse: [(self theme buttonLabelForText: aStringOrMorph)
					vResizing: #shrinkWrap;
					hResizing: #shrinkWrap].
	self
		normalLabel: l;
		selectedLabel: l;
		selected: self isSelected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>label: aStringOrMorph selected: selectedStringOrMorph [
	"Change the label contents"

	|l s|
	l := aStringOrMorph isMorph
		ifTrue: [aStringOrMorph]
		ifFalse: [(self theme buttonLabelForText: aStringOrMorph)
					vResizing: #shrinkWrap;
					hResizing: #shrinkWrap].
	s:= selectedStringOrMorph isMorph
		ifTrue: [selectedStringOrMorph]
		ifFalse: [(self theme buttonLabelForText: selectedStringOrMorph)
					vResizing: #shrinkWrap;
					hResizing: #shrinkWrap].
	self
		normalLabel: l;
		selectedLabel: s;
		selected: self isSelected
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>minWidth [
	"Consult the theme also."

	^super minWidth max: self theme buttonMinWidth
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>normalFillStyle [
	"Return the normal fillStyle of the receiver."
	
	^self theme tabLabelNormalFillStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>normalLabel [

	^ normalLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>normalLabel: anObject [

	normalLabel := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>selected: aBoolean [
	"Use the appropriate label."

	self removeAllMorphs.
	self isSelected
		ifTrue: [self addMorph: self selectedLabel]
		ifFalse: [self addMorph: self normalLabel]
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>selectedFillStyle [
	"Return the selected fillStyle of the receiver."
	
	^self theme tabLabelSelectedFillStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>selectedLabel [

	^ selectedLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>selectedLabel: anObject [

	selectedLabel := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>tabSelector [

	^ tabSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabLabelMorph>>tabSelector: anObject [

	tabSelector := anObject
]
