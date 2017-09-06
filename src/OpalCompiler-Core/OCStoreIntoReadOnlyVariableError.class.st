"
Error when trying to assign to a non writeble Variable.
(method arguments). For backward compatibility this error does not signal if the compilation context is not  interactive.
"
Class {
	#name : #OCStoreIntoReadOnlyVariableError,
	#superclass : #OCSemanticError,
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'NicolaiHess 10/3/2014 21:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCStoreIntoReadOnlyVariableError>>description [
	"Return a textual description of the exception."

	^ String
		streamContents: [ :stream | 
			stream << super description asString.
			stream cr.
			stream << self methodClass asString.
			stream cr.
			stream << self methodNode asString ]
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCStoreIntoReadOnlyVariableError>>signal [
	compilationContext interactive
		ifFalse: [ ^ self crTrace ].
	^ super signal
]
