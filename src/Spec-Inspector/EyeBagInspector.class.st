"
Specialized version of inspector showing occurrences of items of the bag
"
Class {
	#name : #EyeBagInspector,
	#superclass : #EyeCollectionInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeBagInspector>>addVariableFields: elements [

	self sortedKeys do: [ :key |
		elements add: (BagEyeElement host: self object index: key)]
]

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeBagInspector>>sortedKeys [

	^ [ [ self object valuesAndCounts keys sorted ] 
		on: Error 
		do: [ "case of non sortable keys" self object valuesAndCounts keys ] 
			] on: Error do: [ #() ]
]
