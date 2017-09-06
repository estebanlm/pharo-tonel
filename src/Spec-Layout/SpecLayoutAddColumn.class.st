"
A SpecLayoutAddColumn is an action representing the addition of a column to a layout
"
Class {
	#name : #SpecLayoutAddColumn,
	#superclass : #SpecLayoutAdd,
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddColumn class>>block: aBlock layoutFrame: aLayoutFrame [

	^ self new
			block: aBlock 
			layoutFrame: aLayoutFrame;
			yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddColumn>>block: aBlock layoutFrame: aLayoutFrame [

	| row |
	row := SpecColumnLayout composed.
	aBlock value: row.
	subwidget := row asArray.
	self layoutFrame: aLayoutFrame.
	self generateArguments
]
