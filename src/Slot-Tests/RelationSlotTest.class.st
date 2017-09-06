"

"
Class {
	#name : #RelationSlotTest,
	#superclass : #TestCase,
	#category : #Slot-Tests-Associations,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RelationSlotTest>>testDefinition [

	| s1 s2 |
	
	s1 := ToManyRelationSlot named: #people inverse: #x inClass: #SlotExamplePerson.
	s2 := #people => ToManyRelationSlot inverse: #x inClass: #SlotExamplePerson.
	
	self assert: s1 = s2.
	self assert: s1 hasInverse 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RelationSlotTest>>testDefinitionWithClass [

	| s1 s2 |
	
	s1 := #people => ToManyRelationSlot inverse: #x inClass: #SlotExamplePerson.
	s2 := #people => ToManyRelationSlot inverse: #x inClass: SlotExamplePerson.
	
	self assert: s1 = s2.
	self assert: s1 hasInverse 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RelationSlotTest>>testDefinitionWithoutInverse [

	| slot |
	
	slot := #people => ToManyRelationSlot inClass: #SlotExamplePerson.
	self deny: slot hasInverse
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RelationSlotTest>>testEquals [

	| s1 s2 |
	
	s1 := ToManyRelationSlot named: #slot inverse: #x inClass: #SlotExamplePerson.
	s2 := ToManyRelationSlot named: #slot inverse: #x inClass: #SlotExamplePerson.
	
	self assert: s1 = s2.
	self assert: s1 hash = s2 hash.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RelationSlotTest>>testNotEquals [

	| s1 s2 |
	
	s1 := ToManyRelationSlot named: #slot inverse: #x inClass: #SlotExamplePerson.
	s2 := ToManyRelationSlot named: #slot inverse: #y inClass: #SlotExamplePerson.
	
	self deny: s1 = s2.

]
