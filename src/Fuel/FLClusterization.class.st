"
I manage the clusters collected during the analysis step of serialization.
"
Class {
	#name : #FLClusterization,
	#superclass : #Object,
	#instVars : [
		'baselevelBucket',
		'substitutionsBucket',
		'globalsBucket',
		'metalevelInstanceSideBucket',
		'metalevelClassSideBucket',
		'primitivesBucket',
		'postBaselevelBucket'
	],
	#category : #Fuel-Core,
	#timestamp : 'MartinDias 8/29/2011 19:12'
}

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>baselevelBucket [
	
	^ baselevelBucket
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>clusterBuckets [
	"Answer a new collection with all the clusters that have been collected in trace. Note that order is imporant."

	^ OrderedCollection new 
		add: globalsBucket;
		add: primitivesBucket;
		add: metalevelClassSideBucket;
		add: metalevelInstanceSideBucket;
		add: baselevelBucket;
		add: postBaselevelBucket;
		add: substitutionsBucket;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>clusters [
	
	^self clusterBuckets flatCollect: [:c | c ].

]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>fuelAccept: aGeneralMapper [
	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>globalsBucket [
	
	^ globalsBucket 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>initialize [

	super initialize.
	primitivesBucket := IdentityDictionary new.
	baselevelBucket := IdentityDictionary new.
	globalsBucket := IdentityDictionary new.
	metalevelInstanceSideBucket := IdentityDictionary new.
	metalevelClassSideBucket := IdentityDictionary new.
	substitutionsBucket := IdentityDictionary new.
	postBaselevelBucket := IdentityDictionary new.

]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>metalevelClassSideBucket [
	
	^ metalevelClassSideBucket
]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>metalevelInstanceSideBucket [
	
	^ metalevelInstanceSideBucket 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>objectCount [

	^self clusterBuckets sum: [ :aClusterBucket | 
		aClusterBucket
			inject: 0 
			into: [ :sum :aCluster | sum + aCluster objects size ] ].
]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>postBaselevelBucket [
	
	^ postBaselevelBucket
]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>primitivesBucket [
	
	^ primitivesBucket
]

{
	#category : #'cluster buckets',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClusterization>>substitutionsBucket [
	
	^ substitutionsBucket
]
