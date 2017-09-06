"
I represent a addition of a method in a class or a trait.
"
Class {
	#name : #EpMethodAddition,
	#superclass : #EpMethodChange,
	#instVars : [
		'method'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition class>>method: aCompiledMethod [
	
	^ self basicNew
		initializeMethod: aCompiledMethod;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>accept: aVisitor [

	^ aVisitor visitMethodAddition: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>affectedPackageName [

	^ method package
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>initializeMethod: aCompiledMethod [

	self initialize.
	method := aCompiledMethod asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>methodAdded [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>methodAffected [

	^ self methodAdded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>protocol [

	^ method protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>selector [

	^ method selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodAddition>>sourceCode [

	^ method sourceCode
]
