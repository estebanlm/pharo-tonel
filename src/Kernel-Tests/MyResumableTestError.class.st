"
A resumable error for tests
"
Class {
	#name : #MyResumableTestError,
	#superclass : #Error,
	#category : #Kernel-Tests-Exception
}

{ #category : #'exception description' }
MyResumableTestError >> isResumable [

	^true
]
