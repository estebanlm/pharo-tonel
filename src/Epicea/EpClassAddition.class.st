"
I represent the creation of a class.
"
Class {
	#name : #EpClassAddition,
	#superclass : #EpClassChange,
	#instVars : [
		'class'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition class>>class: aClass [

	^ self basicNew 
		initializeClass: aClass;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition>>accept: aVisitor [

	^ aVisitor visitClassAddition: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition>>behaviorAffected [

	^ class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition>>behaviorAffectedName [

	^ class name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition>>classAdded [

	^ class 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassAddition>>initializeClass: aClass [
	self initialize.
	class := aClass asEpiceaRingDefinition
]
