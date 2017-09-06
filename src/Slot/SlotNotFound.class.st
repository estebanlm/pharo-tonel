"
I am an exception to indicate that a slot is found in a layout.
"
Class {
	#name : #SlotNotFound,
	#superclass : #ClassBuilderError,
	#instVars : [
		'name',
		'targetClass'
	],
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound class>>signalForName: aSymbol [
	self new
		name: aSymbol;
		signal
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound class>>signalForName: aSymbol inClass: aClass [
	self new
		name: aSymbol;
		targetClass: aClass;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound>>messageText [
	^ 'Slot ''', name asString, ''' not found', (targetClass ifNil: [''] ifNotNil:[' in ', targetClass name])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound>>targetClass [
	^ targetClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotNotFound>>targetClass: aClass [
	targetClass := aClass
]
