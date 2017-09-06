"
Report exception as a property (critique) which can be debuged afterwards
"
Class {
	#name : #ReLogExceptionStrategy,
	#superclass : #ReExceptionStrategy,
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 7/16/2017 16:58'
}

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReLogExceptionStrategy class>>handle: anException about: anEntity forProppertiesDo: aBlock [

	aBlock value: (
		ReExceptionProperty
			for: anEntity
			with: anException)
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReLogExceptionStrategy class>>strategyDescription [

	^ 'Report exception as a property (critique) which can be debuged afterwards.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReLogExceptionStrategy class>>strategyTitle [

	^ 'Log Exception'
]
