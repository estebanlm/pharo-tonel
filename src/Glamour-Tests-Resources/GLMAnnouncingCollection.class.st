"

"
Class {
	#name : #GLMAnnouncingCollection,
	#superclass : #Announcer,
	#instVars : [
		'collection'
	],
	#category : #Glamour-Tests-Resources,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>add: anObject [

	collection add: anObject.
	self announce: GLMItemAdded
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>add: newObject before: oldObject  [

	collection add: newObject before: oldObject.
	self announce: GLMItemAdded
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>add: newObject beforeOrLast: oldObject  [
	(collection includes: oldObject)
		ifTrue: [ collection add: newObject before: oldObject ]
		ifFalse: [ collection add: newObject ].
	self announce: GLMItemAdded
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>asOrderedCollection [
	^ self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>at: anObject [

	^collection at: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>collect: aBlock [
	^collection collect: aBlock
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>do: aBlock [

	^collection do: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>includes: anObject  [
	^collection includes: anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>indexOf: anElement [

	^ collection indexOf: anElement
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>initialize [
	super initialize.
	collection := OrderedCollection new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>isCollection [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>isEmpty [
	^ collection isEmpty
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>printString [
	^ collection printString 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>remove: anObject [

	collection remove: anObject.
	self announce: GLMItemRemoved
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>remove: anObject ifAbsent: aBlock [

	collection remove: anObject ifAbsent: aBlock.
	self announce: GLMItemRemoved
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>removeLast [

	collection removeLast.
	self announce: GLMItemRemoved
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>size [
	^ collection size
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAnnouncingCollection>>withIndexDo: aBlock [

	^collection withIndexDo: aBlock
]
