"
I'm a class using two shared pools. 
"
Class {
	#name : #ClassMultiplePoolUser,
	#superclass : #Object,
	#pools : [
		'PoolDefiner',
		'PoolDefiner2'
	],
	#category : #Kernel-Tests-Classes,
	#timestamp : 'StephaneDucasse 12/13/2011 15:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassMultiplePoolUser class>>author [

	^ Author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassMultiplePoolUser class>>gloups [

	^ Gloups
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassMultiplePoolUser class>>variableInPoolDefiner2 [

	^ VariableInPoolDefiner2
]
