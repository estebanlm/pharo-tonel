"
I am ZnLogEvent, the base class of a log events emitted by elements of the Zinc HTTP Components framework.

I add a timestamp and a simple id attribute. The id can wrap around and should only be used to distinguish between events that have the same timestamp.

ZnLogEvents are distributed as Announcement through a singleton Announcer that I maintain.

I have a small convenience API to log to the Transcript or open a simple GUI on the emitted log events.
"
Class {
	#name : #ZnLogEvent,
	#superclass : #Announcement,
	#instVars : [
		'timestamp',
		'id'
	],
	#classVars : [
		'IdCounter',
		'LogEventAnnouncer'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/11/2014 14:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>announcer [
	^ LogEventAnnouncer ifNil: [ LogEventAnnouncer := Announcer new ]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>initialize [
	IdCounter := 0.
	self environment 
		at: #SessionManager 
		ifPresent: [ :manager | manager default registerNetworkClassNamed: self name ]
		ifAbsent: [ Smalltalk addToStartUpList: self ]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>logToTranscript [
	self stopLoggingToTranscript.
	^ self announcer when: ZnLogEvent do: [ :event | Transcript crShow: event ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>nextId [
	"This should be thread safe because SmallInteger 
	arithmetic primitives cannot be interrupted"
	
	^ IdCounter := IdCounter + 1
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>open [
	^ self announcer inspect
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>startUp [
	"Reset the id counter"
	
	IdCounter := 0
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent class>>stopLoggingToTranscript [
	self announcer unsubscribe: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>announcer [
	^ self class announcer
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>emit [
	self announcer announce: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>id [
	^ id
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>initialize [
	super initialize.
	timestamp := DateAndTime now.
	id := self nextId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>nextId [
	^ self class nextId
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>printContentsOn: stream [
	"Subclasses should implement this to add output"
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>printOn: stream [
	timestamp printYMDOn: stream.
	stream space.
	timestamp printHMSOn: stream. 
	stream space.
	id \\ 1000 printOn: stream base: 10 length: 3 padded: true.
	self printContentsOn: stream
]

{
	#category : #beacon,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>printOneLineContentsOn: stream [
	self printContentsOn: stream
]

{
	#category : #beacon,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>printOneLineOn: stream [
	self printOn: stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLogEvent>>timestamp [
	^ timestamp
]
