"
An Exit is an exception that quit the image without saving with a given success status.

Exit signalFaillure: 'something went wrong'
"
Class {
	#name : #Exit,
	#superclass : #Exception,
	#instVars : [
		'status'
	],
	#category : #System-CommandLine,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>failure [
	^ self status: 1
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>signalFailure [
 	^ self failure signal
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>signalFailure: aMessage [
 	^ self failure signal: aMessage
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>signalSuccess [
 	^self success signal
]

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>signalSuccess: aMessage  [
 	^self success signal: aMessage
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>status: aPositiveInteger [
	^ self new
		status: aPositiveInteger;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit class>>success [
	^ self status: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>defaultAction [
 	self messageText isEmpty
		ifFalse: [ self printMessage ].
	Smalltalk exit: self status
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>isSuccess [
	^self status = 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>printMessage [
	|stderr|
	stderr := VTermOutputDriver stderr.
	self isSuccess ifFalse: [ stderr red ].
	stderr
		nextPutAll: self messageText; lf;
		clear.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>printOn: aStream [
	super printOn: aStream.
	aStream space print: self status.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>status [
	^ status
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
Exit>>status: anInteger [
	status := anInteger .
]
