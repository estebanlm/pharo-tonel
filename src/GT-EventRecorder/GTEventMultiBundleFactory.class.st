"
I know how to create GTEventMultiBundle object from a collection of GTEventBundle objects.
"
Class {
	#name : #GTEventMultiBundleFactory,
	#superclass : #Object,
	#instVars : [
		'multiBundles'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 11/15/2015 18:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory class>>default [
	^ self new
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory class>>fromBundles: aCollection  [
	^ self default fromBundles: aCollection
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory>>fromBundles: aCollection  [
	multiBundles := OrderedDictionary new.
	aCollection do: [ :aSingleOrMultiBundle | self synthetize: aSingleOrMultiBundle.].
	^ self multiBundles
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory>>multiBundles [
	^ multiBundles asOrderedCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory>>synthetize: aSingleOrMultiBundle [
	aSingleOrMultiBundle accept: self
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory>>visitMultiBundle: aMultiBundle [
	aMultiBundle bundles do: [ :eachSingleBundle |
		self visitSingleBundle: eachSingleBundle ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundleFactory>>visitSingleBundle: aSingleBundle [
	| multiBundle |
	multiBundle := multiBundles 
							at: aSingleBundle url 
							ifAbsentPut: [ GTEventMultiBundle new url: aSingleBundle url; yourself ].
	multiBundle add: aSingleBundle
]
