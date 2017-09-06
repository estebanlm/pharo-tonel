"
I am an abstract Spec widget managing two ButtonModel.

I provide shortcuts to set easier the buttons
-  firstIcon:secondIcon: that take two name of icon and set the buttons with the corresponding icons.
- firstLabel:secondLabel: to set labels.
- firstAction:secondAction: to set blocks to perform.

I provide two layout on my class side, vertical and horizontal.
"
Class {
	#name : #AbstractTwoButtons,
	#superclass : #ComposableModel,
	#instVars : [
		'firstButton',
		'secondButton'
	],
	#category : #Spec-PolyWidgets-Support,
	#timestamp : 'Spirita 7/25/2016 15:47'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons class>>abstractExample [
	| example |
	example := self new.
	example
		title: self name asString , ' example';
		extent: 100 @ 100.
	^ example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons class>>horizontal [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #firstButton;
				add: #secondButton ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons class>>vertical [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #firstButton;
				add: #secondButton ];
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>firstAction: firstActionBlock secondAction: secondActionBlock [
	self firstButton action: firstActionBlock.
	self secondButton action: secondActionBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>firstButton [
	^ firstButton
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>firstIcon: firstIconName secondIcon: secondIconName [
	self firstButton icon: (self iconNamed: firstIconName).
	self secondButton icon: (self iconNamed: secondIconName)
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>firstLabel: firstLabel secondLabel: secondLabel [
	self firstButton label: firstLabel.
	self secondButton label: secondLabel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>initializeButtons [
self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>initializeWidgets [
	firstButton := self instantiate: ButtonModel.
	secondButton := self instantiate: ButtonModel.
	self initializeButtons.
	self focusOrder
		add: firstButton;
		add: secondButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
AbstractTwoButtons>>secondButton [
	^ secondButton
]
