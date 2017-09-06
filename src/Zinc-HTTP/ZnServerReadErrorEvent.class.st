"
ZnServerReadErrorEvent signals an error during the reading of a request. These errors are considered mostly benign and the connection gets closed.

"
Class {
	#name : #ZnServerReadErrorEvent,
	#superclass : #ZnServerErrorEvent,
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:13'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerReadErrorEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Read Error ';  print: exception
]
