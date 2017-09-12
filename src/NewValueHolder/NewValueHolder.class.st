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
	#category : #NewValueHolder
}

{ #category : #'instance creation' }
NewValueHolder class >> value: contents [

	^ self new
		rawValue: contents;
		yourself
]

{ #category : #announcements }
NewValueHolder >> addDependent: aDependent [

	self error: 'Former API, should be changed'.
]

{ #category : #private }
NewValueHolder >> handleCircularReferencesWhile: aBlock [
	"Used to handle circular references as explained in the class comment"

	lock ifTrue: [ ^ self ].
	lock := true.
	
	aBlock ensure: [ lock := false ].
]

{ #category : #initialization }
NewValueHolder >> initialize [

	super initialize.
	
	announcer := Announcer new.
	lock := false.
]

{ #category : #printing }
NewValueHolder >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPutAll: '[ '; 
		print: self value;
		nextPutAll: ' ]'
]

{ #category : #accessing }
NewValueHolder >> rawValue: aValue [

	value := aValue
]

{ #category : #accessing }
NewValueHolder >> value [

	^ value
]

{ #category : #accessing }
NewValueHolder >> value: anObject [
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		value := anObject.
		self valueChanged: oldValue ].

	^ value
]

{ #category : #accessing }
NewValueHolder >> valueChanged [
	
	announcer announce: (ValueChanged newValue: value)
]

{ #category : #accessing }
NewValueHolder >> valueChanged: oldValue [
	
	announcer announce: (ValueChanged oldValue: oldValue newValue: value)
]

{ #category : #accessing }
NewValueHolder >> valueChanged: oldValue to: newValue [
	
	announcer announce: (ValueChanged oldValue: oldValue newValue: newValue)
]

{ #category : #announcements }
NewValueHolder >> whenChangedDo: aBlock [
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

{ #category : #announcements }
NewValueHolder >> whenChangedSend: aSelector [ to: aReceiver

	announcer when: ValueChanged send: aSelector to: aReceiver
]
