"
This error is signalled whenever there is a non recoverable error during refactorings.
"
Class {
	#name : #RBRefactoringFailure,
	#superclass : #RBRefactoringError,
	#category : #Refactoring-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringFailure>>isResumable [
	^ false
]
