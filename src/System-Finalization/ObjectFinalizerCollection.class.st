"
An ObjectFinalizerCollection is simple collection which is intended to hold ObjectFinalizers and be used by WeakRegistry.
"
Class {
	#name : #ObjectFinalizerCollection,
	#superclass : #OrderedCollection,
	#category : #System-Finalization,
	#timestamp : 'ul 2/26/2010 14:23'
}

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:47'
}
ObjectFinalizerCollection>>finalize [
	"Finalize all elements in this collection. The elements are expected to be ObjectFinalizers, but can be any object which understands #finalize."

	self do: #finalize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
ObjectFinalizerCollection>>hasMultipleExecutors [
	^ true
]
