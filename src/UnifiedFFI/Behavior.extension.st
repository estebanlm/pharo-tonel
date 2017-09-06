Extension {
	#name : #Behavior
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Behavior>>ffiBindingOf: aName [
	"answer a binding for a type name,
	by default use smalltalk name bindings"
	^ self bindingOf: aName
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Behavior>>ffiInstVarArgument: argName generator: generator [
	"Load the instance variable with given name" 

	(self allInstVarNames includes: argName) ifFalse: [ ^ nil ].
	^ FFIInstVarArgument new 
		argName: argName;
		yourself
]
