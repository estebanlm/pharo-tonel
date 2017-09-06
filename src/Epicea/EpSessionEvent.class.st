"
When an image is launched, a session starts. When quits, the session ends. In the middle, it could be snapshoted multiple times. My subclasses represent such events.
"
Class {
	#name : #EpSessionEvent,
	#superclass : #EpEvent,
	#instVars : [
		'imageName'
	],
	#category : #Epicea-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionEvent class>>imageName: anImageName [
	^ self basicNew
		initializeWith: anImageName;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionEvent class>>new  [
	^ self imageName: Smalltalk image imagePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionEvent>>imageName [
	^ imageName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSessionEvent>>initializeWith: anImageName [
	self initialize.
	
	imageName := anImageName
]
