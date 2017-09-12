"
Notify when fie does not exist
"
Class {
	#name : #FileDoesNotExistException,
	#superclass : #FileException,
	#instVars : [
		'readOnly'
	],
	#category : #Files-Core
}

{ #category : #exceptiondescription }
FileDoesNotExistException >> defaultAction [
	"The default action taken if the exception is signaled."

	^ UIManager default fileDoesNotExistsDefaultAction: self

]

{ #category : #accessing }
FileDoesNotExistException >> readOnly [
	^readOnly == true
]

{ #category : #accessing }
FileDoesNotExistException >> readOnly: aBoolean [
	readOnly := aBoolean
]
