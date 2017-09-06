"
I represent a change in a code entity.
"
Class {
	#name : #EpCodeChange,
	#superclass : #EpEvent,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>affectedPackageName [

	^ self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>doesOverride: aCodeChange  [

	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCodeChange>>isCodeChange [

	^ true
]
