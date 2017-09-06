"
I represent i386 architectures.
"
Class {
	#name : #FFI_i386,
	#superclass : #FFIArchitecture,
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_i386 class>>isActive [
	^ Smalltalk vm wordSize = 4
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_i386>>floatRegisterSize [
	^ 8
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_i386>>integerRegisterSize [
	^ 4
]

{
	#category : #'default abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFI_i386>>returnSingleFloatsAsDoubles [
	^ true
]
