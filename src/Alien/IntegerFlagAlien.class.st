"
A class to wrap the inIoProcessEvents flag in the WIndows VM.
"
Class {
	#name : #IntegerFlagAlien,
	#superclass : #Alien,
	#type : #bytes,
	#category : #Alien-Win32,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien class>>forInIoProcessEventsFlag [
	^self
		atAddress: self primInIOProcessEventsFlagAddress
		dataSize: 4
]

{
	#category : #primitives-Windows-VM-specific,
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien class>>primInIOProcessEventsFlagAddress "^<Integer>" [
	"Answer the address of the Windows-VM-specific int inIoProcessEvents flag.
	 See platforms/win32/vm/sqWin32Window.c
	 and platforms/Cross/plugins/IA32ABI/ia32abicc.c."
	<primitive: 'primInIOProcessEventsFlagAddress' module: 'IA32ABI' error: errorCode>
	^self primitiveFailed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien>>decrement [
	| value |
	(value := self value) > 0 ifTrue:
		[self value: value - 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien>>increment [
	self value: self value + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien>>value [
	^self signedLongAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IntegerFlagAlien>>value: anInteger [
	self signedLongAt: 1 put: anInteger
]
