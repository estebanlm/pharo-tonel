"
Exception for signaling login failures of protocol clients.

"
Class {
	#name : #LoginFailedException,
	#superclass : #ProtocolClientError,
	#category : #Network-Protocols,
	#timestamp : 'mir 5/12/2003 17:57'
}

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:57'
}
LoginFailedException>>isResumable [
	"Resumable so we can give the user another chance to login"

	^true
]
