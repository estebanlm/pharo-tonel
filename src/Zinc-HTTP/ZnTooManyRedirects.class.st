"
ZnTooManyRedirects is signalled when an HTTP client has been following more redirects than allowed.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnTooManyRedirects,
	#superclass : #Error,
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 9/19/2011 09:59'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnTooManyRedirects>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]
