"
STONReference holds a forward reference to another object during materialization.

"
Class {
	#name : #STONReference,
	#superclass : #Object,
	#instVars : [
		'index'
	],
	#category : #STON-Core,
	#timestamp : 'SvenVanCaekenberghe 1/22/2012 20:13'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference class>>index: integer [
	^ self new
		index: integer;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>= anObject [
	^ self class == anObject class and: [ self index = anObject index ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>hash [
	^ index hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>index: integer [
	index := integer
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>isStonReference [
	^ true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONReference>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(; print: index; nextPut: $)
]
