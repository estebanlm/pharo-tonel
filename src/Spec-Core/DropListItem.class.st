"
A DropListItem is an item (wrapper) designed to fit into a DropList
"
Class {
	#name : #DropListItem,
	#superclass : #Object,
	#instVars : [
		'actionHolder',
		'model',
		'displayBlock',
		'icon'
	],
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem class>>named: label do: aBlock [

	^ self new
		action: aBlock;
		model: label;
		display: [ :e | e ];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem class>>on: anObject do: aBlock [

	^ self new
		action: aBlock;
		model: anObject;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>= another [

	self species = another species ifFalse: [ ^ false ].
	^ self label = another label and: [ self actionHolder = another actionHolder ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>action: aBlock [

	actionHolder value: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>actionHolder [
	
	^ actionHolder
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>display: aBlock [
	"aBlock - 1 optional argument, which is the underlying item; returns the string to be displayed"

	displayBlock := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>icon: anObject [
	icon := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>initialize [

	super initialize.

	actionHolder := [] asValueHolder.
	displayBlock := [ :e | e printString ].
	icon := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>label [
	
	^ displayBlock cull: model.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>label: anObject [
	"For compatibility with old raw-string usage. Send #display: instead"
	
	displayBlock := [ anObject ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>model [

	^ model.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>model: anObject [

	model := anObject.
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListItem>>value [
	"This way, I am polymorphic with nil"

	actionHolder value cull: self label cull: self
]
