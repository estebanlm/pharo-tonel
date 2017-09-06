"
A warning for an undeclared variable in a method of a class
"
Class {
	#name : #UndeclaredVariableWarning,
	#superclass : #Warning,
	#instVars : [
		'name',
		'selector',
		'class'
	],
	#category : #Compiler-Support,
	#timestamp : 'TorstenBergmann 1/31/2014 11:16'
}

{
	#category : #exceptionDescription,
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariableWarning>>defaultAction [
	"The user should be notified of the occurrence of an exceptional occurrence and
	 given an option of continuing or aborting the computation. The description of the
	 occurrence should include any text specified as the argument of the #signal: message."
	
	selector ifNotNil: [self crTrace: class name, '>>', selector, ' ']
			ifNil: [self traceCr:''].
	self traceCr: '(' , name , ' is Undeclared) '.
	^true
]

{
	#category : #exceptionDescription,
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariableWarning>>defaultResumeValue [
	"Answer the value that by default should be returned if the exception is resumed"
	^true
]

{
	#category : #exceptionDescription,
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariableWarning>>messageText [
	^ String streamContents: [ :s | 
		selector 
			ifNotNil: [ s print: class; nextPutAll:  '>>'; print: selector; space]
			ifNil: [ s cr ].
		s nextPut: $(; print: name; nextPutAll: ' is Undeclared) ' ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
UndeclaredVariableWarning>>name: aString selector: aSymbolOrNil class: aBehavior [
	name := aString.
	selector := aSymbolOrNil.
	class := aBehavior
]
