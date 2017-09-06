"
I am a class holding any object inside its unique instance variable. 
Each time the instance variable value changes, an announcement is emitted. 

The instance variable is accessed through `value` and `value:` while the registration is done by `whenChangedDo: aBlock`. 

In addition, infinite loops of propagation are prevented. 
Use case: you have two lists A, and B, and you want to keep their selection synchronised. 
So when A selection changes, you set B selection. 
But since B selection changes, you set A selection, and so on… 

This case is prevented by the use of a `lock` variable.
"
Class {
	#name : #NewValueHolder,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'lock',
		'value'
	],
	#category : #NewValueHolder,
	#timestamp : 'PeterUhnak 3/5/2016 11:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder class>>value: contents [

	^ self new
		rawValue: contents;
		yourself
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>addDependent: aDependent [

	self error: 'Former API, should be changed'.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>handleCircularReferencesWhile: aBlock [
	"Used to handle circular references as explained in the class comment"

	lock ifTrue: [ ^ self ].
	lock := true.
	
	aBlock ensure: [ lock := false ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>initialize [

	super initialize.
	
	announcer := Announcer new.
	lock := false.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPutAll: '[ '; 
		print: self value;
		nextPutAll: ' ]'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>rawValue: aValue [

	value := aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>value [

	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>value: anObject [
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		value := anObject.
		self valueChanged: oldValue ].

	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>valueChanged [
	
	announcer announce: (ValueChanged newValue: value)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>valueChanged: oldValue [
	
	announcer announce: (ValueChanged oldValue: oldValue newValue: value)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>valueChanged: oldValue to: newValue [
	
	announcer announce: (ValueChanged oldValue: oldValue newValue: newValue)
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>whenChangedDo: aBlock [
	"Culled block [ :newValue :oldValue :announcement :announcer | ]"

	| block |
	block := [ :announcement :ann | 
	aBlock
		cull: announcement newValue
		cull: announcement oldValue
		cull: announcement
		cull: ann ].
	announcer when: ValueChanged do: block
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolder>>whenChangedSend: aSelector to: aReceiver [

	announcer when: ValueChanged send: aSelector to: aReceiver
]
