"
I represent a service that may change the contents of a directory.
Such changes include:
* file creation
* file deletion
* file modification
"
Class {
	#name : #FileModifyingSimpleServiceEntry,
	#superclass : #SimpleServiceEntry,
	#category : #System-FileRegistry,
	#timestamp : 'nk 11/26/2002 12:03'
}

{
	#category : #'performing service',
	#timestamp : ' 8/31/2017 07:16:48'
}
FileModifyingSimpleServiceEntry>>performServiceFor: anObject [
	| retval |
	retval := super performServiceFor: anObject.
	self changed: #fileListChanged.
	^retval	"is this used anywhere?"
]
