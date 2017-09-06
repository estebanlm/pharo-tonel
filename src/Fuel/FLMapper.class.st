"
The purpose of my hierarchy is to map objects with clusters.
"
Class {
	#name : #FLMapper,
	#superclass : #Object,
	#instVars : [
		'next',
		'analysis'
	],
	#category : #Fuel-Mappers,
	#timestamp : 'MartinDias 8/11/2011 03:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>analysis: anAnalysis [

	analysis := anAnalysis.
	next ifNotNil: [ next analysis: anAnalysis ]
]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>clusterInstanceOf: aClusterClass keyInBucket: clusterKey factory: clusterFactory [

	| bucket |
	bucket := aClusterClass clusterBucketIn: analysis clusterization.
	^ bucket
		at: clusterKey
		ifAbsentPut: [ 
			clusterFactory value 
				traceWith: analysis;
				yourself ].

]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>clusterKeyedByClusterName: aClusterClass [

	^ self
		clusterKeyedByClusterName: aClusterClass 
		factory:  [ aClusterClass newAnalyzing ]
]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>clusterKeyedByClusterName: aClusterClass factory: clusterFactory [

	^ self
		clusterInstanceOf: aClusterClass
		keyInBucket: aClusterClass name
		factory: clusterFactory

]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>clusterKeyedByObjectClass: clusterClass class: objectClass [

	^ self 
		clusterInstanceOf: clusterClass 
		keyInBucket: objectClass 
		factory: [ clusterClass newAnalyzing: objectClass ]
]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>fuelAccept: aGeneralMapper [
	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>mapAndTrace: anObject [

	self subclassResponsibility
]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>mapAndTraceByClusterName: anObject to: aClusterClass [

	(self clusterKeyedByClusterName: aClusterClass)
		add: anObject traceWith: analysis

]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>mapAndTraceByObjectClass: anObject to: aClusterClass [

	(self clusterKeyedByObjectClass: aClusterClass class: anObject class)
		add: anObject traceWith: analysis

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMapper>>next: anObject [
	next := anObject
]
