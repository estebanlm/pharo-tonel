"
I represent a modification of a method in a class or a trait.
"
Class {
	#name : #EpMethodModification,
	#superclass : #EpMethodChange,
	#instVars : [
		'oldMethod',
		'newMethod'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification class>>oldMethod: anOldMethod newMethod: aNewMethod [

	^ self basicNew
		initializeWithOldMethod: anOldMethod
		newMethod: aNewMethod;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>accept: aVisitor [

	^ aVisitor visitMethodModification: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>affectedPackageName [

	^ self newMethod package
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>initializeWithOldMethod: anOldMethod newMethod: aNewMethod [

	self initialize.
	oldMethod := anOldMethod asEpiceaRingDefinition.
	newMethod := aNewMethod asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>methodAffected [
	
	^ newMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>newMethod [

	^ newMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>newProtocol [

	^ newMethod protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>newSourceCode [

	^ newMethod sourceCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>oldMethod [

	^ oldMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>oldProtocol [

	^ oldMethod protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodModification>>oldSourceCode [

	^ oldMethod sourceCode
]
