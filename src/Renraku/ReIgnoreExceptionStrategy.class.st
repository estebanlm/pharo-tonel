"
Ignore the exception silently and continue the execution
"
Class {
	#name : #ReIgnoreExceptionStrategy,
	#superclass : #ReExceptionStrategy,
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 7/16/2017 16:58'
}

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIgnoreExceptionStrategy class>>handle: anException about: anEntity forProppertiesDo: aBlock [

	"do nothing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIgnoreExceptionStrategy class>>strategyDescription [

	^ 'Ignore the exception silently and continue the execution'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReIgnoreExceptionStrategy class>>strategyTitle [

	^ 'Ignore Exception'
]
