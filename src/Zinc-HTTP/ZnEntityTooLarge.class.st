"
ZnEntityTooLarge is signalled when too big an entity is read from a stream.

This is a resumable exception
"
Class {
	#name : #ZnEntityTooLarge,
	#superclass : #Error,
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 1/31/2012 12:35'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityTooLarge>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]
