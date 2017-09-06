"
I'm a base class for different kind of architectures. 
My children implement different architecture-dependent functionality.
"
Class {
	#name : #FFIArchitecture,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture class>>forCurrentArchitecture [
	^ (self allSubclasses detect: #isActive) uniqueInstance
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture class>>isActive [
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture class>>new [
	self error: 'Use #forCurrentArchitecture'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture class>>uniqueInstance [
	self = FFIArchitecture 
		ifTrue: [ self error: 'I''m an abstract class, use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>areStructuresSplitIntoRegisters [
	^ false
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>computeStructureRegisterPassingLayout: aStructureClass [
	^ nil
	
]

{
	#category : #types,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>externalLongType [
	^ ExternalType long
]

{
	#category : #types,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>externalULongType [
	^ ExternalType ulong
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>floatRegisterCountForParameterPassing [
	^ 0
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>floatRegisterSize [
	self subclassResponsibility
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>integerRegisterCountForParameterPassing [
	^ 0
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>integerRegisterSize [
	self subclassResponsibility
]

{
	#category : #types,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>longType [
	^ FFIInt32
]

{
	#category : #types,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>longTypeSize [
	^ self externalLongType byteSize
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>maxStructureSizeToPassInRegisters [
	^ 0
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>returnSingleFloatsAsDoubles [
	self subclassResponsibility
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>shadowCallSpaceSize [
	^ 0
]

{
	#category : #types,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIArchitecture>>ulongType [
	^ FFIUInt32
]
