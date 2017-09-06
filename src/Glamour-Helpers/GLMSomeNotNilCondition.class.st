"
Used to test if at least a defined  arguments of a condition is not nil.

"
Class {
	#name : #GLMSomeNotNilCondition,
	#superclass : #GLMCondition,
	#category : #Glamour-Helpers,
	#timestamp : 'AndreiChis 3/11/2015 23:59'
}

{
	#category : #glamour,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSomeNotNilCondition>>glamourValueWithArgs: anArray  [
	 
	^anArray anySatisfy: [:each | each notNil]
]
