"
I am a RBRefactoring intended for prepagating another refactoring. We call to propagate a refactoring to redo just the secondary effects of such refactoring. 

For example, the propagation of a 'message rename' is to change the senders of the old selector to use the new selector. 
"
Class {
	#name : #EpRBPropagateRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'targetRefactoring'
	],
	#category : #Epicea-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring class>>target: aRefactoring  [
	^ self basicNew 
		initializeWith: aRefactoring;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring>>asEpiceaEvent [
	^ EpPropagateRefactoring target: targetRefactoring asEpiceaEvent
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring>>initializeWith: aRefactoring  [
	self initialize.
	targetRefactoring := aRefactoring 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring>>primitiveExecute [
	targetRefactoring propagateTransformation.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring>>setOption: aString toUse: aBlockClosure  [
	targetRefactoring setOption: aString toUse: aBlockClosure 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRBPropagateRefactoring>>whatToDisplayIn: aNautilusChangesBrowser  [
	^ targetRefactoring whatToDisplayIn: aNautilusChangesBrowser
]
