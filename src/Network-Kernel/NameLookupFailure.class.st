"
Signals that a name lookup operation failed.

	hostName	hostName for which the name loopup failed

"
Class {
	#name : #NameLookupFailure,
	#superclass : #NetworkError,
	#instVars : [
		'hostName'
	],
	#category : #Network-Kernel,
	#timestamp : 'mir 5/12/2003 18:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure class>>hostName: aString [
	^ self new hostName: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure class>>signalFor: hostName [
	"Create and signal a NameLookupFailure for hostName"

	^ (self hostName: hostName) signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure>>defaultAction [
	"Backward compatibility"

	| response |
	response := UIManager default chooseFrom: #('Retry' 'Give Up') title: self printString.
	^ response = 2
		ifTrue: [ super defaultAction ]
		ifFalse: [ self retry ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure>>hostName [
	^ hostName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure>>hostName: aString [
	hostName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"

	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NameLookupFailure>>standardMessageText [
	"Generate a standard textual description"

	^ String
		streamContents: [ :stream | 
			stream << 'cannot resolve '.
			stream print: self hostName ]
]
