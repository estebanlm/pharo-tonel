"

"
Class {
	#name : #SlotClassBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'aClass',
		'instance',
		'anotherClass',
		'yetAnotherClass',
		'yetYetAnotherClass'
	],
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>aCategory [
	^ 'SlotTestsTmp'
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>aClassName [
	^ #SlotTestsClassA
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>anotherCategory [
	^ 'SlotTestsTmp-Another'
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>anotherClassName [
	^ #SlotTestsClassB
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>assertTraitIntegrity [
	self assert: TOne traitUsers isHealthy.
	self assert: TOne classTrait traitUsers isHealthy.
	self assert: TTwo traitUsers isHealthy.
	self assert: TTwo classTrait traitUsers isHealthy.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>cleanUpTrait: trait [
	"During development some tests might invalidate the trait internal state.
	To avoid follow-up failures we reset the trait state here as good as possible."
	
	trait traitUsers removeAll.
	trait classTrait traitUsers removeAll.
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>layoutClasses [
	^ { ByteLayout. WordLayout. FixedLayout. VariableLayout. WeakLayout }
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>layoutClassesWithSlots [
	^ { FixedLayout. VariableLayout. WeakLayout }
]

{
	#category : #helpers-building,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>make: anUnaryBlock [
	"I build a class for testing, providing basic default values, but eventually customized by the received unary block."

	^PharoClassInstaller make: [:builder|
		builder
			superclass: Object;
			name: self aClassName;
			layoutClass: FixedLayout;
			category: self aCategory.
		anUnaryBlock value: builder
		].
]

{
	#category : #helpers-building,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>makeWithLayout: aClassLayout [
	^self makeWithLayout: aClassLayout andSlots: {}
]

{
	#category : #helpers-building,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>makeWithLayout: aClassLayout andSlots: someSlots [
	"
	I create a class using the Slot class builder given a class layout and a collection of slots.
	"

	^self make: [:builder|
		builder
			layoutClass: aClassLayout;
			slots: someSlots
		].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>tearDown [
	"We remove the classes that could have been created during test run"
	super tearDown.

	SystemAnnouncer uniqueInstance suspendAllWhile: [
		{ self aClassName. self anotherClassName. self yetAnotherClassName. self yetYetAnotherClassName } do: [ :each | 
			Smalltalk globals 
				at: each 
				ifPresent: [ :class | class removeFromSystem ]]].

	SystemAnnouncer uniqueInstance unsubscribe: self.
	
	self 
		cleanUpTrait: TOne;
		cleanUpTrait: TTwo.
		
	Smalltalk organization removeCategory: self aCategory.
	(RPackageOrganizer default 
		packageNamed: self aCategory
		ifAbsent: [ ^ self ]) 
		unregister.
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>yetAnotherClassName [
	^ #SlotTestsClassC
]

{
	#category : #helpers-names,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotClassBuilderTest>>yetYetAnotherClassName [
	^ #SlotTestsClassD
]
