"
I represent the X86_64 architecture, using the SystemV ABI.

Parameters passed in integer registers: RDI RSI RDX RCX R8 R9
Parameters passed in floating point registers: XMM0 to XXM7, inclusive
Some small structures are split and passed in registers, according to an algorithm described in the ABI.

These ABI details are very important to keep in mind for receiving callbacks.
"
Class {
	#name : #FFI_x86_64_SystemV,
	#superclass : #FFI_x86_64,
	#category : #UnifiedFFI,
	#timestamp : 'RonieSalgado 2/13/2017 21:12'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV class>>isActive [
	^ Smalltalk vm wordSize = 8 and: [ OSPlatform current isWindows not ]
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV>>areStructuresSplitIntoRegisters [
	^ true
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV>>computeStructureRegisterPassingLayout: aStructureClass [
	| layout |
	aStructureClass structureSize > self maxStructureSizeToPassInRegisters ifTrue: [ ^ nil ].
	layout := aStructureClass flatStructureLayout sysVAMD64PostProcess.
	^ layout isPassedInMemory ifTrue: [ nil ] ifFalse: [ layout ]
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV>>floatRegisterCountForParameterPassing [
	^ 8
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV>>integerRegisterCountForParameterPassing [
	^ 6
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_x86_64_SystemV>>maxStructureSizeToPassInRegisters [
	"Four eightbytes according to the ABI documentation."
	^ 16
]
