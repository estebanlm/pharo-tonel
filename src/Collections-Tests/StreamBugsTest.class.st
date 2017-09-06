"

"
Class {
	#name : #StreamBugsTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Streams,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
StreamBugsTest>>testReadWriteStreamNextNBug [
	| aStream |
	aStream := ReadWriteStream on: String new.
	aStream nextPutAll: 'Hello World'.
	aStream next: 5
]
