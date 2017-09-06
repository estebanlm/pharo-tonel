"
A prior conversion to an Array or OrderedCollection is not necessary when adding all elements to a collection.

"
Class {
	#name : #RBAsOrderedCollectionNotNeededRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAsOrderedCollectionNotNeededRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AsOrderedCollectionNotNeededRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAsOrderedCollectionNotNeededRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAsOrderedCollectionNotNeededRule>>initialize [
	super initialize.
	#('addAll:' 'removeAll:' 'includesAll:' 'copyWithoutAll:')
		do: [ :collectionMessage | 
			#('asArray' 'asOrderedCollection' 'asSortedCollection')
				do: [ :conversionMessage | 
					| baseString |
					baseString := '``@receiver ' , collectionMessage , ' ``@arg '.
					self rewriteRule replace: baseString , conversionMessage with: baseString ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAsOrderedCollectionNotNeededRule>>name [
	^ '#asOrderedCollection/#asArray not needed'
]
