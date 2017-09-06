"
I represent a rename of a class or a trait.
"
Class {
	#name : #EpBehaviorNameChange,
	#superclass : #EpBehaviorChange,
	#instVars : [
		'oldName',
		'newName',
		'behavior'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange class>>oldName: anOldName newName: aNewName class: aClass [

	^ self basicNew 
		initializeOldName: anOldName newName: aNewName class: aClass;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>accept: aVisitor [

	^ aVisitor visitBehaviorNameChange: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>behaviorAffected [
	^ self classAffected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>behaviorAffectedName [
	^ self classAffected name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>classAffected [

	^ behavior
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>initializeOldName: anOldName newName: aNewName class: aBehavior [

	self initialize.
	behavior := aBehavior asEpiceaRingDefinition.
	oldName := anOldName.
	newName := aNewName.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>newName [

	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorNameChange>>oldName [

	^ oldName
]
