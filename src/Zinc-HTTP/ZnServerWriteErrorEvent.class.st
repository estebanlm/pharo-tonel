"
ZnServerWriteErrorEvent signals an error during the writing of a response. These errors are considered mostly benign and the connection gets closed.

"
Class {
	#name : #ZnServerWriteErrorEvent,
	#superclass : #ZnServerErrorEvent,
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:13'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerWriteErrorEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Write Error ';  print: exception
]
