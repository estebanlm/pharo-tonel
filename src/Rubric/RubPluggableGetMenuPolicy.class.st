"
I am used to get the correct menu of common text areas
"
Class {
	#name : #RubPluggableGetMenuPolicy,
	#superclass : #RubGetMenuPolicy,
	#instVars : [
		'getMenuSelector',
		'menuProvider'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:02'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>getMenuSelector [
	^ getMenuSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>getMenuSelector: aSymbol [
	getMenuSelector := aSymbol
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>lookupMenu [
	(getMenuSelector isNil or: [ menuProvider isNil ])
		ifTrue: [ ^ super lookupMenu ].
	^ (WeakMessageSend receiver: menuProvider selector: getMenuSelector) cull: MenuMorph new cull: false
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>lookupShiftMenu [
	(getMenuSelector isNil or: [ menuProvider isNil ])
		ifTrue: [ ^ super lookupMenu ].
	^ (WeakMessageSend receiver: menuProvider selector: getMenuSelector) cull: MenuMorph new cull: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>menuProvider [
	^ menuProvider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPluggableGetMenuPolicy>>menuProvider: anObject [
	menuProvider := anObject
]
