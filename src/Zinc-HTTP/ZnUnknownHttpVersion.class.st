"
ZnUnknownHttpVersion is signalled when an unknown/unsupported HTTP version is found.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnUnknownHttpVersion,
	#superclass : #ZnParseError,
	#instVars : [
		'version'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'DamienPollet 8/4/2011 14:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpVersion class>>version: version [
	^ self new
		version: version;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpVersion>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpVersion>>version: anObject [
	version := anObject
]
