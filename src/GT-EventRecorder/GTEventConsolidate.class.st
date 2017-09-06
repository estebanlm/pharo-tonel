"
I consolidate GTEventCollector objects into one or more collectors according to their URL and category. That way we can pack together data, that belongs to the same application (= URL and category) and we can save them together on the server side as one bundle.

For the Collaborators Part: 
- GTEventCollector objects that I consolidate
- GTEventRecorder that uses me before packing process.

Public API and Key Messages

- collectors: set a collection of collectors that should be consolidated
- consolidated returns collection of GTEventCollector objects.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	collectors:		<OrderedCollection>

"
Class {
	#name : #GTEventConsolidate,
	#superclass : #Object,
	#instVars : [
		'collectors'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 11/17/2015 14:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventConsolidate>>collectors: aCollection  [
	collectors := aCollection
]

{
	#category : #'accessing - computed',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventConsolidate>>consolidated [
	| consolidatedCollectors |
	consolidatedCollectors := OrderedDictionary new.
	collectors do: [ :eachCollector | | aCollector |
		aCollector := consolidatedCollectors 
								at: (eachCollector url printString, '/', eachCollector category) asSymbol
								ifAbsentPut: [ GTEventCollector new 
														url: eachCollector url; 
														category: eachCollector category;
														yourself ].
		eachCollector bundle do: [ :eachEvent | aCollector add: eachEvent ] ].
	^ consolidatedCollectors asArray
]
