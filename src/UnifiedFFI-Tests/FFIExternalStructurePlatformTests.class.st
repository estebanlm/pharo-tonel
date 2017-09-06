"

"
Class {
	#name : #FFIExternalStructurePlatformTests,
	#superclass : #TestCase,
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>is32bits [
	^ Smalltalk vm wordSize = 4
	
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>is64bits [
	^ Smalltalk vm wordSize = 8
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>testStructureHasCorrectOffsets32bits [
	self is32bits ifFalse: [ ^ self skip ].
	
	FFITestStructureByPlatform compiledSpec. "Ensure fields are initialized"
	self assert: (FFITestStructureByPlatform classPool at: #OFFSET_LONG) equals: 1.
	self assert: (FFITestStructureByPlatform classPool at: #OFFSET_POINTER) equals: 5
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>testStructureHasCorrectOffsets64bits [
	self is64bits ifFalse: [ ^ self skip ].
	
	FFITestStructureByPlatform compiledSpec. "Ensure fields are initialized"
	self assert: (FFITestStructureByPlatform classPool at: #OFFSET_LONG) equals: 1.
	self assert: (FFITestStructureByPlatform classPool at: #OFFSET_POINTER) equals: 9
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>testStructureHasCorrectSize32bits [
	self is32bits ifFalse: [ ^ self skip ].
	
	self 
		assert: (FFIExternalType sizeOf: FFITestStructureByPlatform) 
		equals: 8
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructurePlatformTests>>testStructureHasCorrectSize64bits [
	self is64bits ifFalse: [ ^ self skip ].
	
	self 
		assert: (FFIExternalType sizeOf: FFITestStructureByPlatform) 
		equals: 16
]
