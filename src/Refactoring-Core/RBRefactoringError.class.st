"
The receiver is signaled whenever a precondition of a refactoring is violated. The action block, if defined, might help the user to resolve the issue.
"
Class {
	#name : #RBRefactoringError,
	#superclass : #Error,
	#instVars : [
		'actionBlock'
	],
	#category : #Refactoring-Core-Support,
	#timestamp : 'lr 10/5/2010 16:17'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringError class>>signal: aString with: aBlock  [
	^ self new
		actionBlock: aBlock;
		signal: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringError>>actionBlock [
	^ actionBlock
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringError>>actionBlock: aBlock  [
	actionBlock := aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringError>>isResumable [
	^ true
]
