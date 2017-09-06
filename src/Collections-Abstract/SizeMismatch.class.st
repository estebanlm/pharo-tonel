"
I am SizeMismatch, an exception indicating that an operation was attempted
on two or more collections that don't match in size. 
"
Class {
	#name : #SizeMismatch,
	#superclass : #Error,
	#category : #Collections-Abstract,
	#timestamp : 'SvenVanCaekenberghe 4/18/2011 14:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
SizeMismatch>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:43'
}
SizeMismatch>>standardMessageText [
	"Generate a standard textual description"
	
	^ 'Collections sizes do not match'
]
