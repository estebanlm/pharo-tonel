Extension {
	#name : #RBRefactoring
}

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoring>>asEpiceaEvent [
	^ (EpGenericRefactoring canAccept: self)
		ifTrue: [ EpGenericRefactoring for: self ]
		ifFalse: [ EpUnknownRefactoring for: self ]
]

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoring>>propagateTransformation [
	"Perform the *secondary transformation* of the refactoring. Each refactoring performs main 
	transformations and secondary transformations. 
	For example, in a class rename, the main transformations may be removing the class and adding 
	it with another name. A secondary transformation in this case is fixing the references in 
	methods to the class."

	self subclassResponsibility
]
