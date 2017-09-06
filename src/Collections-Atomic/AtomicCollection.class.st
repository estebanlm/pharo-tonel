"
I am just a base abstract class,
containing common behavior for various queue types
"
Class {
	#name : #AtomicCollection,
	#superclass : #Object,
	#category : #Collections-Atomic,
	#timestamp : 'Igor.Stasenko 10/16/2010 03:54'
}

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>copy [
	^ self errorDontCopy
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>deepCopy [
	^ self errorDontCopy
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>errorDontCopy [
	"copying a structure, involved in concurrent operations is a bad idea"
	^ self error: 'Copying not available'
]

{
	#category : #'debug support',
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>interrupt [
	"simulate interrupt , for debugging purposes only"
	Processor yield
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>newItem [
	"override in subclass, if you need to instantiate queue items of different class or initialize them in some specific way"
	^ AtomicQueueItem new
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>signalAddedNewItem [
	"Optional, override in subclass(es) to signal that new item available in queue.
	Default implementation does nothing"
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>signalNoMoreItems [
	"Optional, override in subclass(es) to signal that queue is currently empty.
	Default implementation does nothing"
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>waitForNewItems [
	"Override in subclass. By default, yield current process.
	If you run more than one process, which popping items from queue,
	then there is no guarantee, that after wait, #next won't block the queue"
	^ self yield
]

{
	#category : #yielding,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicCollection>>yield [
	"Yield the current process.
	Used internally by spin loops, once detected that 
	current process can't make any progress
	without some external event to happen"
	Processor yield
]
