"
urce: 22651600
"
Class {
	#name : #Unix32Platform,
	#superclass : #UnixPlatform,
	#category : #System-Platforms,
	#timestamp : 'EstebanLorenzano 3/6/2017 17:15'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Unix32Platform class>>isActivePlatform [
	^ (self currentPlatformName = 'unix') and: [ Smalltalk vm wordSize = 4 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Unix32Platform>>isUnix32 [
	^ true
]
