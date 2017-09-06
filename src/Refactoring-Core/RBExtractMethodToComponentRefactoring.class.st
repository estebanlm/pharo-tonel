"
I am a refactoring for extracting code fragments to a new method. 

Similar to RBExtractMethodRefactoring, but you can choose to which component (instance or agument variable) the new method is added. 
As such, the new method arguments will include an additional argument for the sender.
Based on the instance variable you chosed for this method I will guess the class where to add this method, but you can change this class or add more classes.

"
Class {
	#name : #RBExtractMethodToComponentRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'selector',
		'extractionInterval',
		'extractedMethodSelector'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 8/6/2016 14:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring class>>extract: anInterval from: aSelector in: aClass  [
	^self new
		extract: anInterval
		from: aSelector
		in: aClass
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring class>>model: aRBSmalltalk extract: anInterval from: aSelector in: aClass  [
	^(self new)
		model: aRBSmalltalk;
		extract: anInterval
			from: aSelector
			in: aClass;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>extract: anInterval from: aSelector in: aClass  [
	class := self classObjectFor: aClass.
	selector := aSelector.
	extractionInterval := anInterval
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>extractMethod [
	| refactoring |
	refactoring := RBExtractMethodRefactoring 
				model: self model
				extract: extractionInterval
				from: selector
				in: class.
	refactoring setOption: #methodName
		toUse: 
			[:ref :methodName | 
			extractedMethodSelector := ref 
						uniqueMethodNameFor: methodName arguments size.
			methodName
				selector: extractedMethodSelector;
				yourself].
	self performComponentRefactoring: refactoring
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>inlineForwarder [
	| refactoring |
	refactoring := RBInlineAllSendersRefactoring 
				model: self model
				sendersOf: extractedMethodSelector
				in: class.
	refactoring setOption: #inlineExpression toUse: [:ref :string | true].
	self performComponentRefactoring: refactoring
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>moveMethod [
	| variable refactoring |
	variable := self selectVariableToMoveMethodTo: extractedMethodSelector
				class: class.
	variable isNil ifTrue: [self refactoringFailure: 'Did not extract method'].
	refactoring := RBMoveMethodRefactoring 
				model: self model
				selector: extractedMethodSelector
				class: class
				variable: variable.
	self performComponentRefactoring: refactoring
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>preconditions [
	^RBCondition empty
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' extract: '.
	extractionInterval storeOn: aStream.
	aStream
		nextPutAll: ' from: #';
		nextPutAll: selector;
		nextPutAll: ' in: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExtractMethodToComponentRefactoring>>transform [
	self
		extractMethod;
		moveMethod;
		inlineForwarder
]
