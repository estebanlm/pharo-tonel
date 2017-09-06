"
Notify when fie does not exist
"
Class {
	#name : #FileDoesNotExistException,
	#superclass : #FileException,
	#instVars : [
		'readOnly'
	],
	#category : #Files-Core,
	#timestamp : 'TorstenBergmann 2/3/2014 23:37'
}

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileDoesNotExistException>>defaultAction [
	"The default action taken if the exception is signaled."

	^ UIManager default fileDoesNotExistsDefaultAction: self

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileDoesNotExistException>>readOnly [
	^readOnly == true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileDoesNotExistException>>readOnly: aBoolean [
	readOnly := aBoolean
]
