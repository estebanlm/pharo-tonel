Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*System-Platforms',
	#timestamp : ' 8/31/2017 07:16:13'
}
SmalltalkImage>>os [
	"Answer the object to query about os."
	
	^ OSPlatform current
]

{
	#category : #'*System-Platforms',
	#timestamp : ' 8/31/2017 07:16:13'
}
SmalltalkImage>>platform [
	"Answer the object to query about os."
	
	^ self os
]
