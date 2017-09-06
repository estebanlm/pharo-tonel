Extension {
	#name : #Float
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>packAsDoubleToArity: arity  [
	| rolledPointer |
		
	rolledPointer := self.
	1 to: arity do: [ :index | rolledPointer := rolledPointer pointerDouble ].
	^ rolledPointer	
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>packAsFloatToArity: arity  [
	| rolledPointer |
		
	rolledPointer := self.
	1 to: arity do: [ :index | rolledPointer := rolledPointer pointerFloat ].
	^ rolledPointer	
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>packToArity: arity  [
	self error: 'Use #rollAsFloatArity: or #rollAsDoubleArity:'
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>pointer  [
	"Floats in Pharo are 64bits (8 bytes) and that correspond directly with a double on C.
	 So 'default' behaviour will be to address it as a double (float is also available in case is 
	 needed)"
	^ self pointerDouble
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>pointerDouble [
	"sizeof(double)== 8"
	^ (ByteArray new: FFIFloat64 externalTypeSize)
		doubleAt: 1 put: self;
		yourself
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Float>>pointerFloat [
	"sizeof(float)== 4"
	^ (ByteArray new: FFIFloat32 externalTypeSize)
		floatAt: 1 put: self;
		yourself
]
