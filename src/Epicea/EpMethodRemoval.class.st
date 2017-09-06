"
I represent a removal of a method in a class or a trait.
"
Class {
	#name : #EpMethodRemoval,
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
EpMethodRemoval class>>method: aCompiledMethod [

	^ self basicNew
		initializeWithMethod: aCompiledMethod;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>accept: aVisitor [

	^ aVisitor visitMethodRemoval: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>affectedPackageName [

	^ method package
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>initializeWithMethod: aCompiledMethod [

	self initialize.
	method := aCompiledMethod asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>methodAffected [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>methodRemoved [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>protocol [

	^ method protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>selector [

	^ method selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodRemoval>>sourceCode [

	^ method sourceCode
]
