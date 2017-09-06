"
A Stopwatch maintains a collection of timespans.
"
Class {
	#name : #Stopwatch,
	#superclass : #Object,
	#instVars : [
		'timespans',
		'state'
	],
	#category : #Kernel-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>activate [

	self isSuspended ifTrue:
		[self timespans add: 
			(Timespan starting: DateAndTime now duration: Duration zero).
		self state: #active]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>duration [

	| ts last |
	self isSuspended 
		ifTrue:
			[ (ts := self timespans) isEmpty ifTrue: 
				[ ts := { Timespan starting: DateAndTime now duration: Duration zero } ] ]
		ifFalse:
			[ last := self timespans last.
			ts := self timespans allButLast
				add: (last duration: (DateAndTime now - last start); yourself);
				yourself ].
		
	^ (ts collect: [ :t | t duration ]) sum

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>end [

	^ self timespans last next


]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>isActive [

	^ self state = #active

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>isSuspended [

	^ self state = #suspended


]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self state;
		nextPut: $:;
		print: self duration;
		nextPut: $).


]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>reActivate [

	self 
		suspend;
		activate.

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>reset [

	self suspend.
	timespans := nil.


]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>start [

	^ self timespans first start


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>state [

	^ state ifNil: [ state := #suspended ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>state: aSymbol [

	state := aSymbol

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>suspend [

	| ts |
	self isActive ifTrue:
		[ ts := self timespans last.
		ts duration: (DateAndTime now - ts start).
		self state: #suspended]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Stopwatch>>timespans [

	^ timespans ifNil: [ timespans := OrderedCollection new ]

]
