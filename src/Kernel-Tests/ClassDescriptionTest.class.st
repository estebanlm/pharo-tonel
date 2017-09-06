"
This is the unit test for the class ClassDescription. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org)
	- the sunit class category
"
Class {
	#name : #ClassDescriptionTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Classes,
	#timestamp : '<historical>'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testAllMethodCategoriesIntegratedThrough [
	"If this test fails, it may be because method protocols are sorted in #allMethodCategoriesIntegratedThrough. Take care that if the protocols of the class under test are already sorted, you won't see any problem."
	self assert: ((CompiledMethod selectorsInProtocol: 'testing') includes: #isAbstract).
	CompiledMethod allProtocolsUpTo: Object.
	self assert: ((CompiledMethod selectorsInProtocol: 'testing') includes: #isAbstract)
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testAllSlots [
	self assert: (Context allSlots size = 6).
	
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testDefinesSlotNamed [
	self assert: (Point definesSlotNamed: #x).
	self deny: (Point definesSlotNamed: #z).
	
	self assert: (Context definesSlotNamed: #stackp).
	self deny: (Context definesSlotNamed: #sender).
	
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testHasSlot [
	self assert: (Context hasSlot: (Context slotNamed: #sender)).
	self deny: (Context definesSlot: (Context slotNamed: #sender)).
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testHasSlotNamed [
	self assert: (Context hasSlotNamed: #sender).
	self assert: (Context hasSlotNamed: #method).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testMethods [
	self assert: Object methods = Object methodDict values.  
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testNumberOfMethods [
	self assert: (Point numberOfMethods = (Point localMethods size + Point class localMethods size)).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testOrganization [

	| aClassOrganizer |
	aClassOrganizer := ClassDescription organization.
	self assert: (aClassOrganizer isKindOf: ClassOrganization).
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testSlotNamed [
	self assert: ((Point slotNamed: #x) name = #x).

]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testSlotNames [
	self assert: (Point slotNames = #(x y)).
	
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testSlots [
	self assert: (Context slots size = 4).
	
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testprintHierarchy [
	| expected result |
	expected := '
ProtoObject #()
	Object #()

		ExampleForTest1 #()
			ExampleForTest11 #()
				ExampleForTest111 #()
				ExampleForTest112 #()
			ExampleForTest12 #()'.
	result := ExampleForTest1 printHierarchy.
	self assert: result equals: expected
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testprintSubclassesOnLevelFilterA [
	| expected result stream |
	expected := '
	ExampleForTest1 #()
		ExampleForTest11 #()
			ExampleForTest112 #()'.
	result := String new: expected size.
	stream := ReadWriteStream on: result.
	ExampleForTest1 printSubclassesOn: stream level: 1 filter: {ExampleForTest1. ExampleForTest11. ExampleForTest112}.
	self assert: result equals: expected
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testprintSubclassesOnLevelFilterB [
	| expected result stream |
	expected := '
	ExampleForTest1 #()
		ExampleForTest12 #()'.
	result := String new: expected size.
	stream := ReadWriteStream on: result.
	ExampleForTest1 printSubclassesOn: stream level: 1 filter: { ExampleForTest1. ExampleForTest12. ExampleForTest112 }.
	self assert: result equals: expected
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassDescriptionTest>>testprintSubclassesOnLevelFilterNil [
	| expected result stream |
	expected := '
	ExampleForTest1 #()
		ExampleForTest11 #()
			ExampleForTest111 #()
			ExampleForTest112 #()
		ExampleForTest12 #()'.
	result := String new: expected size.
	stream := ReadWriteStream on: result.
	ExampleForTest1 printSubclassesOn: stream level: 1 filter: nil.
	self assert: result equals: expected
]
