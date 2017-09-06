"
This filter only accepts code changes that would produce a change if applied in current image.
"
Class {
	#name : #EpImpactCodeChangeFilter,
	#superclass : #EpFilter,
	#instVars : [
		'environment'
	],
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'MartinDias 4/17/2017 16:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter class>>title [

	^ 'Hide changes if apply operation is redundant'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter>>= other [

	^ self class = other class
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter>>accepts: anOmEntry [

	anOmEntry content isCodeChange ifFalse: [ ^false ].

	^ anOmEntry content accept: (EpHasImpactVisitor inEnvironment: environment)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter>>environment: anEnvironment [
	
	environment := anEnvironment
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter>>hash [

	^ self class hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpImpactCodeChangeFilter>>title [
	
	^ self class title
]
