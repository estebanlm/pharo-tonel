"
Somewhere in the override hierarchy there is a pragma that tells that this method should explicitly return a value

"
Class {
	#name : #ReReturnMethodRule,
	#superclass : #ReAbstractRule,
	#category : #Renraku-Rules,
	#timestamp : 'YuriyTymchuk 1/18/2016 17:13'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReturnMethodRule class>>checksMethod [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReturnMethodRule>>check: aMethod forCritiquesDo: aCriticBlock [
	(aMethod overriddenMethods anySatisfy: [ :method |
		method hasPragmaNamed: #shouldReturn. ])
			ifFalse: [ ^ self ].
	
	aMethod ast lastIsReturn ifTrue: [ ^ self ].
	
	aCriticBlock cull: (self critiqueFor: aMethod)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReturnMethodRule>>group [

	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReturnMethodRule>>name [

	^ 'Method should explicitly return a value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReturnMethodRule>>severity [

	^ #error
]
