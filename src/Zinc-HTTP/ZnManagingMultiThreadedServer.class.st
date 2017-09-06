"
ZnManagingMultiThreadedServer is a ZnMultiThreadedServer that manages the socket stream connections used by the worker threads that are spawned.

  ZnManagingMultiThreadedServer startDefaultOn: 1701.

I keep track of all the connections that I spawn so that I can close them when I am stopped.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnManagingMultiThreadedServer,
	#superclass : #ZnMultiThreadedServer,
	#instVars : [
		'lock',
		'connections'
	],
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>closeConnections [
	self connections isEmpty ifTrue: [ ^ self ].
	self lock critical: [
		self connections do: [ :each | 
			self logConnectionClosed: each.
			[ each close ] 
				on: Exception 
				do: [ ] ].
		self connections removeAll ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>closeSocketStream: socketStream [
	super closeSocketStream: socketStream.
	self lock critical: [ 
		self connections remove: socketStream ifAbsent: [ ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>connections [
	^ connections ifNil: [ connections := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>lock [
	^ lock ifNil: [ lock := Mutex new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>socketStreamOn: socket [
	| socketStream |
	socketStream := super socketStreamOn: socket.
	self lock critical: [ 
		self connections add: socketStream ].
	^ socketStream
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnManagingMultiThreadedServer>>stop: unregister [
	super stop: unregister.
	self closeConnections
]
