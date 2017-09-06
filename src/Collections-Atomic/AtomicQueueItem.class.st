"
i am a queue item , used by atomic queues.
All my new instances are circular i.e. next=self
"
Class {
	#name : #AtomicQueueItem,
	#superclass : #Object,
	#instVars : [
		'next',
		'object'
	],
	#category : #Collections-Atomic,
	#timestamp : 'Igor.Stasenko 10/16/2010 02:29'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>initialize [
	"make circular"
	super initialize.
	next := self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>isCircular [
	^ next == self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>makeCircular [
	"Make a receiver circular, i.e. point to itself,
	answer the old value of next variable. 
	Note, this operation should be atomic"
	
	| temp |

	" atomic swap here"
	temp := next.
	next := self.

	^ temp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>next [
	"Answer the value of next"

	^ next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>next: anObject [
	"Set the value of next"

	next := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>object [
	"Answer the value of object"

	^ object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicQueueItem>>object: anObject [
	"Set the value of object"

	object := anObject
]
