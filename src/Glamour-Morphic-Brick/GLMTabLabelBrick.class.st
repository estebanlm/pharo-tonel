"
A GLMTabLabelTurboBrick is  single resizable Tab Label used in LazyTabGroupMorph.

Instance Variables
	normalLabel:		<Object>
	selectedLabel:		<Object>
	tabSelector:		<Object>

normalLabel
	- xxxxx

selectedLabel
	- xxxxx

tabSelector
	- xxxxx

"
Class {
	#name : #GLMTabLabelBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'tabSelector',
		'normalLabel',
		'selectedLabel'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : 'AliakseiSyrel 10/17/2014 10:06'
}

{
	#category : #brick-tab-label-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>beNormal [

	self removeAllBricks.
	self addBrickBack: self normalLabel.
	self themer tabLabelThemer normalStyleFor: self.
	self changed
]

{
	#category : #brick-tab-label-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>beSelected [

	self removeAllBricks.
	self addBrickBack: self selectedLabel.
	self themer tabLabelThemer selectedStyleFor: self.
	self changed
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>deselect [
	self owner ifNil: [ ^ self ].
	self layoutProperties minWidth: 0.
	self owner doLayoutForce
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>font: aFont [

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>initialize [
	super initialize.
	
	self enable
]

{
	#category : #brick-tab-label-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>isSelected [
	"Answer whether the tab is selected."

	^ self tabSelector
		ifNil: [ false ]
		ifNotNil: [ :selector | selector selectedTab == self]
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>label [
	"Answer the label contents."

	^ self isSelected
		ifTrue: [ self selectedLabel userString ifNil: [ self firstSubmorph ] ]
		ifFalse: [ self normalLabel userString ifNil: [ self firstSubmorph ] ]
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>label: aBrick [
	"Change the label contents"
	
	self label: aBrick selected: aBrick
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>label: aBrick selected: aSelectedBrick [
	"Change the label contents"

	aBrick vSpaceFill.
	aSelectedBrick vSpaceFill.
	
	self maxWidth: aBrick layout maxWidth.
	
	self
		normalLabel: aBrick;
		selectedLabel: aSelectedBrick;
		selected: self isSelected.
	"in case label was changed"
	self doLayoutForce
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>normalLabel [

	^ normalLabel
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>normalLabel: anObject [

	normalLabel := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>select [
	self owner ifNil: [ ^ self ].
	self minWidth: [ self owner width min: (self hasSubbricks
		ifTrue: [ (self label layout maxWidth brickValue: self label) ]
		ifFalse: [ 0 ]) ].
	self owner doLayoutForce
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>selected: aBoolean [
	"Use the appropriate label."

	self isSelected
		ifTrue: [ self beSelected ]
		ifFalse: [ self beNormal ]
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>selectedLabel [

	^ selectedLabel
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>selectedLabel: anObject [

	selectedLabel := anObject
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>tabSelector [

	^ tabSelector
]

{
	#category : #brick-tab-label-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>tabSelector: anObject [

	tabSelector := anObject
]

{
	#category : #theme,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTabLabelBrick>>themeChanged [
	self isSelected
		ifTrue: [ self themer tabLabelThemer selectedStyleFor: self ]
		ifFalse: [ self themer tabLabelThemer normalStyleFor: self ].
	super themeChanged
]
