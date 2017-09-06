"
I am a node in Hiedra tests and examples.
"
Class {
	#name : #HiTestNode,
	#superclass : #Object,
	#instVars : [
		'content',
		'parents',
		'owner',
		'origin'
	],
	#category : #HiedraTests,
	#timestamp : 'MartinDias 3/30/2016 23:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode class>>content: anObject [
	^ self basicNew
		initializeWithContent: anObject;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode class>>content: anObject parents: aCollection [
	^ (self content: anObject)
		parents: aCollection;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>content [
	^ content
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>initializeWithContent: anObject [
	self initialize.
	content := anObject.
	parents := #().
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>origin [
	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>origin: aHiNode  [
	origin := aHiNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>parents [
	
	^ parents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>parents: anObject [
	
	parents := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HiTestNode>>printOn: aStream  [

	super printOn: aStream.	
	
	aStream 
		nextPut: $(;
		print: content;
		nextPutAll: '->';
		print: parents asArray;
		nextPut: $).
]
