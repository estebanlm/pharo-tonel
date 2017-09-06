"
ZnServerHandlerErrorEvent signals an error that occurred during handling by the delegate. This is considered a real error.
"
Class {
	#name : #ZnServerHandlerErrorEvent,
	#superclass : #ZnServerErrorEvent,
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:12'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerHandlerErrorEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Handler Error ';  print: exception
]
