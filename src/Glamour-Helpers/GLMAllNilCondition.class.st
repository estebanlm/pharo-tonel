"
Used to test if all defined arguments of a condition are nil.

"
Class {
	#name : #GLMAllNilCondition,
	#superclass : #GLMCondition,
	#category : #Glamour-Helpers,
	#timestamp : 'AndreiChis 3/11/2015 23:58'
}

{
	#category : #glamour,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAllNilCondition>>glamourValueWithArgs: anArray  [
	 
	^anArray allSatisfy: [:each | each isNil]
]
