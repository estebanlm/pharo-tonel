"

"
Class {
	#name : #PropertySlotTest,
	#superclass : #SlotSilentTest,
	#category : #Slot-Tests-Examples,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
PropertySlotTest>>testCreateClassWithPropertySlot [
	"Add instance variables using the builder interface"
	
	| propertySlot |
	
	propertySlot := #prop => PropertySlot.
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot}
		].

	self assert: (aClass hasSlot: propertySlot).
	self assert: (aClass classLayout hasSlot: (propertySlot instVarNamed: 'baseSlot'))
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
PropertySlotTest>>testCreateClassWithPropertySlotAddSecond [
	"Add instance variables using the builder interface"
	
	| propertySlot1 propertySlot2|
	
	propertySlot1 := #prop1 => PropertySlot.
	propertySlot2 := #prop2 => PropertySlot.
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot1}
		].

	self assert: (aClass hasSlot: propertySlot1).
	self assert: (aClass classLayout hasSlot: (propertySlot1 instVarNamed: 'baseSlot')).
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot1. propertySlot2}
		].
	
	self assert: (aClass hasSlot: propertySlot1).
	self assert: (aClass classLayout hasSlot: (propertySlot2 instVarNamed: 'baseSlot')).
	
	self assert:  (propertySlot1 instVarNamed: 'baseSlot') == (propertySlot2 instVarNamed: 'baseSlot').
	
	self assert: (aClass hasSlot: propertySlot2).
	self assert: (aClass classLayout hasSlot: (propertySlot2 instVarNamed: 'baseSlot')).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
PropertySlotTest>>testCreateClassWithTwoPropertySlots [
	"Add instance variables using the builder interface"
	
	| propertySlot1 propertySlot2 |
	
	propertySlot1 := #prop1 => PropertySlot.
	propertySlot2 := #prop2 => PropertySlot.
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot1 . propertySlot2 }
		].

	self assert: (aClass hasSlot: propertySlot1).
	self assert: (aClass classLayout hasSlot: (propertySlot1 instVarNamed: 'baseSlot')).
	
	self assert: (aClass hasSlot: propertySlot2).
	self assert: (aClass classLayout  hasSlot: (propertySlot2 instVarNamed: 'baseSlot'))
	
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
PropertySlotTest>>testRemovePropertySlot [
	
	| propertySlot |
	
	propertySlot := #prop => PropertySlot.
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot}
		].

	self assert: (aClass hasSlot: propertySlot).
	self assert: (aClass classLayout hasSlot: (propertySlot instVarNamed: 'baseSlot')).
	
	aClass := self make: [ :builder |
		builder 
			slots: {}
		].
	self deny: (aClass hasSlot: propertySlot).	
	self deny: (aClass classLayout hasSlot: (propertySlot instVarNamed: 'baseSlot')).
	self deny: (aClass classLayout hasSlotNamed: #'_propertyBaseSlot').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
PropertySlotTest>>testRemovePropertySlot2 [
	"add two property slots, remove one"
	
	| propertySlot1 propertySlot2 |
	
	propertySlot1 := #prop1 => PropertySlot.
	propertySlot2 := #prop2 => PropertySlot.
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot1 . propertySlot2 }
		].

	self assert: (aClass hasSlot: propertySlot1).
	self assert: (aClass classLayout hasSlot: (propertySlot1 instVarNamed: 'baseSlot')).
	
	self assert: (aClass hasSlot: propertySlot2).
	self assert: (aClass classLayout  hasSlot: (propertySlot2 instVarNamed: 'baseSlot')).
	
	aClass := self make: [ :builder |
		builder 
			slots: {propertySlot1}
		].
	
	self assert:	(aClass hasSlot: propertySlot1).
	self deny: 	(aClass hasSlot: propertySlot2).
	self assert:	(aClass classLayout hasSlotNamed:  #'_propertyBaseSlot'). 
		
	aClass := self make: [ :builder |
		builder 
			slots: {}
		].
	
	self deny:	(aClass hasSlot: propertySlot1).
	self deny: 	(aClass hasSlot: propertySlot2).
	self deny:	(aClass classLayout hasSlotNamed:  #'_propertyBaseSlot'). 
]
