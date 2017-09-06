"
Pass the exception on, allowing handlers up the stach to deal with it, or open the debugger if there are no handlers.
"
Class {
	#name : #RePassExceptionStrategy,
	#superclass : #ReExceptionStrategy,
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 7/16/2017 16:58'
}

{
	#category : #'error handing',
	#timestamp : ' 8/31/2017 05:26:37'
}
RePassExceptionStrategy class>>handle: anException about: anEntity forProppertiesDo: aBlock [

	anException pass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePassExceptionStrategy class>>strategyDescription [

	^ 'Pass the exception on, allowing handlers up the stach to deal with it, or open the debugger if there are no handlers.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePassExceptionStrategy class>>strategyTitle [

	^ 'Pass Exception'
]
