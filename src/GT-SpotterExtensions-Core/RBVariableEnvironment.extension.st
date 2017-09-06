Extension {
	#name : #RBVariableEnvironment
}

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
RBVariableEnvironment>>withClassesFixedForNautilus [
	instanceVariables ifEmpty: [ 
		classVariables keysAndValuesDo: [ :class :variables | 
			instanceVariables at: class ifAbsentPut: [ Set new ] ] ].

]
