"
The path segment is path building block.
Path is formed from list of connected path segments. At building stage, there is no container nor separately defined ""path"" object, just a linked list of segments.
Later the segments are accumulated in backend-specific path object, and the way how it is organized may vary.

My (sub)instances usually are not created directly by user, but instead by instance
of AthensPathBuilder.
Therefore, all my subclasses are considered private and implementation detail.
"
Class {
	#name : #AthensPathSegment,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>accept: aVisitor [
	self subclassResponsibility 
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>convertWith: anObject [
	self subclassResponsibility
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>do: aBlock [
	| segment |
	
	segment := self.
	
	[  aBlock value: segment. segment := segment next. segment notNil ] whileTrue.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>isCubic [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>isMove [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>next [

	^ next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>next: anObject [

	next := anObject
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>sendCommandsTo: aBuilder [

	self do: [ :segment |
		segment sendCommandTo: aBuilder
	]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>size [
	"answer 1 + the number of segments next to receiver"
	
	| segment count |
	segment := self.
	count := 0.
	[ segment notNil ] whileTrue: [  count := count + 1. segment := segment next ].

	^ count.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegment>>visitWith: visitor [

	self subclassResponsibility
]
