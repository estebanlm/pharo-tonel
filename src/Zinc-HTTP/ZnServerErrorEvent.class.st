"
ZnServerErrorEvent is a ZnServerLogEvent related to an exception that occurred.
"
Class {
	#name : #ZnServerErrorEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'exception'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerErrorEvent>>exception [
	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerErrorEvent>>exception: anObject [
	exception := anObject
]
