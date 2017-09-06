"
I am a cluster for objects that have to be replaced in the object graph by another one (at serialization time).

Examples of use:

1) Suppose you want to substitute instances of WriteStream by nil. In such case, WriteStream has to implement this method:

fuelAccept: aVisitor
	^aVisitor visitSubstitution: self by: nil


2) Suppose you want to substitute every integer in the graph by its string representation. In such case you should configure the analyzer through:

anAnalyzer when: [:x | x isInteger] substituteBy: [:x | x printString].

In this way, when you serialize #(1 2), you will then materialize #('1' '2')
"
Class {
	#name : #FLSubstitutionCluster,
	#superclass : #FLCluster,
	#instVars : [
		'substitutions',
		'substitutes'
	],
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 1/9/2012 15:04'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster class>>clusterBucketIn: aClusterization [

	^aClusterization substitutionsBucket
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>add: anObject substitutedBy: anotherObject traceWith: aAnalysis [

	substitutions 
		at: anObject 
		ifAbsent: [ 
			substitutions at: anObject put: anotherObject.
			substitutes add: anotherObject.
			aAnalysis trace: anotherObject ].
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>initializeAnalyzing [

	super initializeAnalyzing.
	substitutions := IdentityDictionary new.
	substitutes := IdentitySet new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>isSubstitute: anObject [

	^ substitutes identityIncludes: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>objects [
	"This cluster does not have objects"
	
	^#()
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '->'.
	substitutions printElementsOn: aStream
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>registerIndexesOn: anEncoder [
	substitutions keysAndValuesDo: [ :anObject :theSubstitution | 
		| substitutionIndex |
		substitutionIndex := anEncoder objectsIndexes at: theSubstitution.
		anEncoder substitutionIndexes
			at: anObject
			put: substitutionIndex ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSubstitutionCluster>>substitutions [
	^ substitutions 
]
