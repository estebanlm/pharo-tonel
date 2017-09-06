"

"
Class {
	#name : #SlotErrorsTest,
	#superclass : #SlotSilentTest,
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>assertInvalidClassName: aName [

	self should: [
		self make: [ :builder | 
			builder name: aName ] ]
		raise: InvalidGlobalName.
	self flag: 'should remove class if not raised'.
		
	self should: [
		PharoClassInstaller 
			validateClassName: aName ]
		raise: InvalidGlobalName
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>expectedFailures  [

	^ #(testCannotBeRecompiled)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testCannotBeRecompiled [

	| superclass |
	superclass := self make: [ :builder | 
		builder 
			superclass: Object;
			name: self aClassName ].

	self make: [ :builder | 
		builder 
			superclass: superclass;
			name: self anotherClassName ].

	self 
		should: [ 
			self make: [ :builder | 
				builder 
					layoutClass: VariableLayout;
					name: self aClassName ] ]
		raise: Error
		description: 'Old class builder raises: X cannot be recompiled'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testClassNameMustBeCapitalized [

	self assertInvalidClassName: #aNotCapitalizedClassName
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testClassNameMustBeSymbol [

	self assertInvalidClassName: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testClassNameWithInvalidCharacter [

	self assertInvalidClassName: #'Invalid-ClassName'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testClassSlotDuplicationConflict [

	aClass := self make: [ :builder | 
		builder classSlots: { #a } ].

	self should: [ 
		self make: [ :builder | 
			builder 
				superclass: aClass;
				name: self anotherClassName;
				classSlots: { #a } ] ]
		raise: DuplicatedSlotName 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testClassSlotWithReservedName [

	#(#self #super #thisContext #true #false #nil) do: [:reservedName |
		self should: [ 
			self make: [ :builder | 
				builder classSlots: { reservedName } ] ]
			raise: InvalidSlotName ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testDangerousClassesConditions [

	| specialObjectsArrayItem |
	
	specialObjectsArrayItem := (Smalltalk specialObjectsArray select: [ :x | x isClass ]) anyOne name.

	self assert: (DangerousClassNotifier shouldNotBeRedefined: #ProtoObject).
	self assert: (DangerousClassNotifier shouldNotBeRedefined: specialObjectsArrayItem). 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testDangerousClassesEnabling [

	| savedExistingSystemSetting myExpectedError |

	savedExistingSystemSetting := DangerousClassNotifier enabled.

	DangerousClassNotifier disable.
	self assert: DangerousClassNotifier enabled not.
	DangerousClassNotifier disableDuring: [
      self assert: DangerousClassNotifier enabled not].
	self assert: DangerousClassNotifier enabled not.

	DangerousClassNotifier enable.
	self assert: DangerousClassNotifier enabled.	
	DangerousClassNotifier disableDuring: [
      self assert: DangerousClassNotifier enabled not].
	self assert: DangerousClassNotifier enabled.

	DangerousClassNotifier enable.
	DangerousClassNotifier disableDuring: [
		self deny: (DangerousClassNotifier check: #CompiledMethod)].
	myExpectedError := false.
	[ DangerousClassNotifier check: #CompiledMethod ] on: Warning do: [ myExpectedError := true  ].
	self assert: myExpectedError.

	savedExistingSystemSetting 
		ifTrue: [ DangerousClassNotifier enable ]
		ifFalse: [ DangerousClassNotifier disable ].
	self assert: DangerousClassNotifier enabled equals: savedExistingSystemSetting.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testDirectCircularHierarchyError [
	"Tests an error is raised when trying to create a heirarchy A<-A"
	
	| classA |
	classA := self make: [ :builder |
			builder 
				superclass: Object;
				name: self aClassName ].

	self should: [ 
		self make: [ :builder | 
			builder 
				superclass: classA;
				name: self aClassName ] ]
		raise: CircularHierarchyError 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testIndirectCircularHierarchyError [
	"Tests an error is raised when trying to create a heirarchy A<-B<-A"
	
	| classA classB |
	classA := self make: [ :builder |
			builder 
				superclass: Object;
				name: self aClassName ].

	classB := self make: [ :builder |
			builder 
				superclass: classA;
				name: self anotherClassName ].

	self should: [ 
		self make: [ :builder | 
			builder 
				superclass: classB;
				name: self aClassName ] ]
		raise: CircularHierarchyError 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testSlotDuplicationConflict [

	aClass := self make: [ :builder | 
		builder slots: { #a } ].

	self should: [ 
		self make: [ :builder | 
			builder 
				superclass: aClass;
				name: self anotherClassName;
				slots: { #a } ] ]
		raise: DuplicatedSlotName 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testSlotWithReservedName [

	#(#self #super #thisContext #true #false #nil) do: [:reservedName |
		self should: [ 
			self make: [ :builder | 
				builder slots: { reservedName } ] ]
			raise: InvalidSlotName ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotErrorsTest>>testValidateClassName		 [
		
	PharoClassInstaller 
		validateClassName: #GoodClassNameThatShouldNotExist
]
