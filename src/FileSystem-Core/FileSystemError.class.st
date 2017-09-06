"
I am an abstract superclass for errors that may occur during filesystem operations.
"
Class {
	#name : #FileSystemError,
	#superclass : #Error,
	#instVars : [
		'reference'
	],
	#category : #FileSystem-Core-Kernel,
	#timestamp : 'cwp 11/18/2009 12:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemError class>>reference: aReference [
	^ self basicNew initializeWithReference: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemError class>>signalWith: aReference [
	^ (self reference: aReference) signal
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemError>>initializeWithReference: aReference [
	reference := aReference.
	messageText := aReference printString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemError>>isResumable [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemError>>reference [
	^ reference
]
