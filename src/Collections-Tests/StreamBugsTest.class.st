Class {
	#name : #StreamBugsTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Streams
}

{ #category : #accessing }
StreamBugsTest >> testReadWriteStreamNextNBug [
	| aStream |
	aStream := ReadWriteStream on: String new.
	aStream nextPutAll: 'Hello World'.
	aStream next: 5
]
