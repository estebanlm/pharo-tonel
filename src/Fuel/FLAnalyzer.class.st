"
I am responsible of traversing the graph of references starting from a root object. I will produce a clusterization which the serializer will store on a stream.

An example of use is:

	(FLAnalyzer newDefault 
		clusterizationOf: (Array with: 1@2 with: 3@4))
		clusters.

"
Class {
	#name : #FLAnalyzer,
	#superclass : #Object,
	#instVars : [
		'internalClasses',
		'pluggableSubstitutions',
		'globalMappersFactory',
		'analysisFactory',
		'generalMapperFactory',
		'globalSymbols',
		'internalMethods',
		'globalMappers',
		'globalEnvironment'
	],
	#category : #Fuel-Core,
	#timestamp : 'MartinDias 8/29/2011 19:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer class>>defaultGlobalSymbols [

    ^ #(#Smalltalk #SourceFiles #Transcript #Undeclared #Display #TextConstants #ActiveWorld #ActiveHand #ActiveEvent #Sensor #Processor #SystemOrganization #World) select: [:each | self environment includesKey: each ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer class>>newDefault [
	"Returns an instance with default configuration."

	^self new
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>analysisFor: anObject [

	^analysisFactory value: anObject
]

{
	#category : #configuring,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>considerGlobal: aSymbol  [

	globalSymbols add: aSymbol
]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>firstInMapperChain [

	^ self mappers first

]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>fuelAccept: aGeneralMapper [
	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>generalMapper [

	^generalMapperFactory value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>globalEnvironment [
	"Answer a dictionary where the look up for global symbols will be done during serialization."
	
	^ globalEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>globalEnvironment: aDictionary  [

	globalEnvironment := aDictionary 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>globalMappers [
	
	^globalMappersFactory value
]

{
	#category : #configuring,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>globalSymbols [
	"Answer the collection of symbols whose associations and values in Smalltalk globals will be considered as globals by Fuel."
	
	^ globalSymbols
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>initialize [

	super initialize.
	self setDefaultAnalysis.
	self useLightMappers.
	pluggableSubstitutions := OrderedCollection new.
	internalClasses := IdentitySet new.
	internalMethods := IdentitySet new. 
	globalEnvironment := self class environment.
	globalSymbols := self class defaultGlobalSymbols asIdentitySet.

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>lightGlobalMappers [

	^ globalSymbols isEmpty
		ifTrue: [ #() ]
		ifFalse: [ Array with: (FLLightGlobalMapper for: globalSymbols in: self globalEnvironment) ]
]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>mappers [

	^ OrderedCollection new
		addAll: self pluggableSubstitutionMappers;
		addAll: self globalMappers;
		add: self generalMapper;
		reduceRight: [:left :right | left next: right ];
		yourself
]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>pluggableSubstitutionMappers [

	^pluggableSubstitutions collect: [:aLink |
		FLPluggableSubstitutionMapper 
			when: aLink key
			substituteBy: aLink value]
]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>privateFirstInMapperChain [

	^ self privateMappers first

]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>privateMappers [

	^ OrderedCollection new
		addAll: self globalMappers;
		add: self generalMapper;
		reduceRight: [:left :right | left next: right ];
		yourself
]

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>setDefaultAnalysis [

	analysisFactory := [:anObject | 
		(FLAnalysis 
			newWith: self firstInMapperChain 
			private: self privateFirstInMapperChain
			root: anObject)
			run;
			yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>useLightMappers [

	globalMappersFactory := [self lightGlobalMappers].
	generalMapperFactory := [FLLightGeneralMapper new].
]

{
	#category : #configuring,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAnalyzer>>when: aCondition substituteBy: aFactory [

	pluggableSubstitutions add: aCondition -> aFactory
]
