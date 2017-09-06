"
FLPointCluster is an optional class that optimizes Point instances, since there are a lot of instances in the system, it makes sense to optimize them. We take advantage of bytecode optimizations done by Pharo for messages like #@, #x and #y. In addition, we avoid the overhead of class reshape, etc. 
"
Class {
	#name : #FLPointCluster,
	#superclass : #FLOptimizedObjectCluster,
	#category : #Fuel-Clusters-Optionals,
	#timestamp : 'MarianoMartinezPeck 9/8/2011 22:33'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointCluster>>materializeInstanceWith: aDecoder [
	"Since in Pharo #@ is associated with a special bytecode, it is faster than doing  Point basicNew"
	^ 0@0 
	
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointCluster>>materializeReferencesOf: aPoint with: aDecoder [

		aPoint setX: aDecoder nextEncodedReference setY: aDecoder nextEncodedReference.	

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointCluster>>referencesOf: aPoint do: aBlock [

	aBlock value: aPoint x.
	aBlock value: aPoint y.
	
]
