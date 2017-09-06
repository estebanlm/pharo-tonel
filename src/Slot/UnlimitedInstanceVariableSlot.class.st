"
We store state in a hidden array. Contrary to normal instance variables the number is unlimited.
"
Class {
	#name : #UnlimitedInstanceVariableSlot,
	#superclass : #Slot,
	#instVars : [
		'baseSlot',
		'offset',
		'baseSlotSize'
	],
	#category : #Slot-Examples,
	#timestamp : 'md 7/17/2015 14:07'
}

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>calculateOffset: aClass [
	| ivarSlots  calculatedOffset |
	"first we get all boolean slots and sort them by index"
	ivarSlots := aClass allSlots select: [ :each | each isKindOf: self class ].
	ivarSlots := ivarSlots select: [ :each | each offset isNotNil ].
	ivarSlots sort: [ :a :b | a offset < b offset ]. 
	ivarSlots ifEmpty: [ ^1 ]. "we are the first one!"

	"now we find the first spot where the next offset is not yet taken"
	calculatedOffset := (ivarSlots withIndexCollect: [ :each :myIndex | myIndex ->each offset ]) 
		findFirst: [ :each | each key ~= each value ].
	calculatedOffset = 0  "no hole found: use the next index after the last slot"
		ifTrue: [ ^ ivarSlots last offset + 1].
	^calculatedOffset
	
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>emitStore: methodBuilder [
	| tempName |

	tempName := Object new.
	methodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushInstVar: baseSlot index;
		pushLiteral: offset;
		pushTemp: tempName;
		send: #at:put:
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>emitValue: methodBuilder [

		methodBuilder
			pushInstVar: baseSlot index;
			pushLiteral: offset;
			send: #at:
			
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>growBaseSlot: aClass [
	baseSlot default: (baseSlot default grownBy: 1)
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>installingIn: aClass [
	super installingIn: aClass.
	offset := self calculateOffset: aClass.
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>layoutChanged: aClass [
	super layoutChanged: aClass.
	"we check on the slot level as the slot is hidden"
	(baseSlot notNil and: [aClass classLayout hasSlotNamed: baseSlot name]) ifTrue: [
		baseSlot := aClass classLayout slotNamed: baseSlot name. "make sure we all use the same baseSlot"
		self growBaseSlot: aClass.
		^self. ].
	"here we need to be more clever: if a subclass defines it, 
	move the difiniton here"
	self flag: #TBD.
	aClass addSlot: (baseSlot := #'_ivarArrayBaseSlot' => BaseSlot default: (Array new: 1)).
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>offset [
	^offset
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>read: anObject [
	^(baseSlot read: anObject) at: offset
		
]

{
	#category : #TODO,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>todo [
	'
    - adding a slots in between --> offsets need to be updated?
	 - removing slot in the middle	
	 - adding slot higher in the hierarchy: move baseselot (same as in TODO for DictionarySlot)
	 - instance migration?
	'
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnlimitedInstanceVariableSlot>>write: aValue to: anObject [
	^(baseSlot read: anObject) at: offset put: aValue.
	
]
