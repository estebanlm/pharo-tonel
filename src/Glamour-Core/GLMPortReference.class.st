"
A PortReference is used in Transmissions to bahavior that is specific to a Transmission instance.
"
Class {
	#name : #GLMPortReference,
	#superclass : #Object,
	#instVars : [
		'port'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 1/5/2010 22:18'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortReference>>port  [
	 
	^port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortReference>>port: aPort [
	port := aPort
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortReference>>postCopy  [
	port := port copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortReference>>printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: Character space;
		nextPutAll: self identityHash printString;
		nextPutAll: ' ('.
	port printOn: aStream.
	aStream nextPut: $)
]
