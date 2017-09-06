Extension {
	#name : #RBClassEnvironment
}

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
RBClassEnvironment>>withClassesFixedForNautilus [
	classes ifEmpty: [ 
		metaClasses do: [ :each | 
			classes add: each ] ]
]
