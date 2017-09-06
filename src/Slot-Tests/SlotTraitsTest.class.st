"

"
Class {
	#name : #SlotTraitsTest,
	#superclass : #SlotSilentTest,
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testClassWithClassTrait [

	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	
	aClass := self make: [ :builder | 
		builder classTraitComposition: TOne ].
	
	self assert: TOne traitUsers asArray equals: { aClass class }.
	self assert: TOne classTrait traitUsers isEmpty.
	
	self assert: (aClass class canUnderstand: #one).
	self assert: aClass one equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testClassWithTrait [

	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	
	aClass := self make: [ :builder | 
		builder traitComposition: TOne ].
	
	self assert: TOne traitUsers asArray equals: { aClass }.
	self assert: TOne classTrait traitUsers isEmpty.
	
	self assert: (aClass canUnderstand: #one).
	self assert: aClass new one equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testClassWithTrait2 [

	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	
	aClass := self make: [ :builder | 
		builder traitComposition: TOne classTrait ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers asArray equals: { aClass }.
	
	self deny: (aClass canUnderstand: #one).
	self assert: (aClass canUnderstand: #classOne).
	self assert: aClass new classOne equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testModifyClassTraitComposition [
	"Tests that when modifing the trait composition on class-side, the old methods are removed from the method dictionary, and the new ones are added."

	self make: [ :builder | 
		builder classTraitComposition: TOne ].

	aClass := self make: [ :builder | 
		builder classTraitComposition: TTwo ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	self assert: TTwo traitUsers asArray equals: { aClass class }.
	self assert: TTwo classTrait traitUsers isEmpty.
	
	self deny: (aClass class canUnderstand: #one).
	self deny: (aClass class canUnderstand: #classOne).
	self assert: (aClass class canUnderstand: #two).
	aClass classLayout checkIntegrity.


	aClass := self make: [ :builder | 
		builder classTraitComposition: { } ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	self assert: TTwo traitUsers isEmpty.
	self assert: TTwo classTrait traitUsers isEmpty.
	aClass classLayout checkIntegrity.
	
	self deny: (aClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #classOne).
	self deny: (aClass canUnderstand: #two).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testModifyTraitComposition [
	"Tests that when modifing the trait composition, the old methods are removed from the method dictionary, and the new ones are added."
	
	self make: [ :builder | 
		builder traitComposition: TOne ].

	aClass := self make: [ :builder | 
		builder traitComposition: TTwo ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	self assert: TTwo traitUsers asArray equals: { aClass }.
	"self assert: TTwo classTrait traitUsers isEmpty."
	aClass classLayout checkIntegrity.
	
	self deny: (aClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #classOne).
	self assert: (aClass canUnderstand: #two).
	
	
	aClass := self make: [ :builder | 
		builder traitComposition: { } ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	self assert: TTwo traitUsers isEmpty.
	self assert: TTwo classTrait traitUsers isEmpty.
	aClass classLayout checkIntegrity.
	
	self deny: (aClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #classOne).
	self deny: (aClass canUnderstand: #two).
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testRemoveClassTrait [
	"Tests that when removing a trait from class-side, its methods are removed from the method dictionary."

	aClass := self make: [ :builder | 
		builder classTraitComposition: TOne ].

	aClass := self make: [ :builder | 
		builder classTraitComposition: {} ].
	
	self deny: (aClass class canUnderstand: #one).
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testRemoveTrait [
	"Tests that when removing a trait from a class, its methods are removed from the method dictionary."
	
	self make: [ :builder | 
		builder traitComposition: TOne ].
	
	aClass := self make: [ :builder | 
		builder traitComposition: {} ].
	
	self assert: TOne traitUsers isEmpty.
	self assert: TOne classTrait traitUsers isEmpty.
	self deny: (aClass canUnderstand: #one).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testTraitUsersAfterClassReshape [

	aClass := self make: [ :builder | 
		builder
			name: self aClassName ].

	anotherClass := self make: [ :builder | 
		builder
			name: self anotherClassName;
			superclass: aClass;
			traitComposition: TOne;
			classTraitComposition: TOne classTrait + TTwo ].
	
	self assert: TOne traitUsers asArray equals: { anotherClass }.
	self assert: TOne classTrait traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo classTrait traitUsers asArray equals: { }.
	
	self deny: (aClass canUnderstand: #one).
	self assert: (anotherClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #two).
	self assert: (anotherClass class canUnderstand: #two).
	
	
	"reshape the super class"
	aClass := self make: [ :builder | 
		builder
			name: self aClassName;
			slots: #( x y z ) ].
		
	self assert: TOne traitUsers asArray equals: { anotherClass }.
	self assert: TOne classTrait traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo classTrait traitUsers asArray equals: { }.
	
	self deny: (aClass canUnderstand: #one).
	self assert: (anotherClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #two).
	self assert: (anotherClass class canUnderstand: #two).


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotTraitsTest>>testTraitUsersAfterMetaclassReshape [

	aClass := self make: [ :builder | 
		builder
			name: self aClassName ].

	anotherClass := self make: [ :builder | 
		builder
			name: self anotherClassName;
			superclass: aClass;
			traitComposition: TOne;
			classTraitComposition: TOne classTrait + TTwo ].
	
	
	self assert: TOne traitUsers asArray            equals: { anotherClass }.
	self assert: TOne classTrait traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo traitUsers asArray            equals: { anotherClass class }.
	self assert: TTwo classTrait traitUsers asArray equals: { }.
	
	self deny: (aClass canUnderstand: #one).
	self assert: (anotherClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #two).
	self assert: (anotherClass class canUnderstand: #two).
	
	"reshape the super class"
	aClass := self make: [ :builder | 
		builder
			name: self aClassName;
			classSlots: #( x y z ) ].
		
	
	self assert: TOne traitUsers asArray            equals: { anotherClass }.
	self assert: TOne classTrait traitUsers asArray equals: { anotherClass class }.
	self assert: TTwo traitUsers asArray            equals: { anotherClass class }.
	self assert: TTwo classTrait traitUsers asArray equals: { }.
	
	self deny: (aClass canUnderstand: #one).
	self assert: (anotherClass canUnderstand: #one).
	self deny: (aClass class canUnderstand: #two).
	self assert: (anotherClass class canUnderstand: #two).


]
