"
A SpecLayoutAddRow is an action representing the addition of a row to a layout

"
Class {
	#name : #SpecLayoutAddRow,
	#superclass : #SpecLayoutAdd,
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddRow class>>block: aBlock layoutFrame: aLayoutFrame [

	^ self new
			block: aBlock 
			layoutFrame: aLayoutFrame;
			yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddRow>>block: aBlock layoutFrame: aLayoutFrame [

	| row |
	row := SpecRowLayout composed.
	aBlock value: row.
	subwidget := row asArray.
	self layoutFrame: aLayoutFrame.
	self generateArguments
]
