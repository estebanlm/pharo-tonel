"

"
Class {
	#name : #SlotLayoutEqualityTest,
	#superclass : #SlotSilentTest,
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>assertClassBuiltWith: blockToBuildAClass isEqualToClassBuiltWith: blockToBuildAnotherClass [
	
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			in: blockToBuildAClass ].
		
	anotherClass := self make: [ :builder | 
		builder 
			name: self anotherClassName;
			in: blockToBuildAnotherClass ].
	
	self assert: aClass classLayout equals: aClass classLayout.	
	self assert: aClass classLayout equals: anotherClass classLayout.
	self assert: aClass classLayout hash equals: anotherClass classLayout hash.
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>assertClassBuiltWith: blockToBuildAClass isNotEqualToClassBuiltWith: blockToBuildAnotherClass [
		
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			in: blockToBuildAClass ].
		
	anotherClass := self make: [ :builder | 
		builder 
			name: self anotherClassName;
			in: blockToBuildAnotherClass ].
	
	self assert: aClass classLayout ~= anotherClass classLayout.
	self assert: aClass classLayout hash ~= anotherClass classLayout hash.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>testLayoutEquals [

	self layoutClasses do: [:aLayoutClass |
		self 
			assertClassBuiltWith: [:builder | builder layoutClass: aLayoutClass ] 
			isEqualToClassBuiltWith: [:builder | builder layoutClass: aLayoutClass ] ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>testLayoutNotEquals [
 
	self layoutClasses do: [:aLayoutClass |
		(self layoutClasses copyWithout: aLayoutClass) do: [:anotherLayoutClass |
			self 
				assertClassBuiltWith: [:builder | builder layoutClass: aLayoutClass ] 
				isNotEqualToClassBuiltWith: [:builder | builder layoutClass: anotherLayoutClass ]]]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>testLayoutWithSlotsEquals [

	self layoutClassesWithSlots do: [:aLayoutClass |
		self 
			assertClassBuiltWith: [:builder | 
				builder 
					layoutClass: aLayoutClass;
					slots: { #field1}  ]
			isEqualToClassBuiltWith: [:builder | 
				builder 
					layoutClass: aLayoutClass;
					slots: { #field1}  ].]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotLayoutEqualityTest>>testLayoutWithSlotsNotEquals [

	self layoutClassesWithSlots do: [:aLayoutClass |
		self 
			assertClassBuiltWith: [:builder | 
				builder 
					layoutClass: aLayoutClass;
					slots: { #field1}  ]
			isNotEqualToClassBuiltWith: [:builder | 
				builder 
					layoutClass: aLayoutClass;
					slots: { #field2}  ]]
]
