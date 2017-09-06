"
I represent the user environment variables.
See  `man environ` for more details.
"
Class {
	#name : #OSEnvironment,
	#superclass : #Object,
	#instVars : [
		'platform'
	],
	#classVars : [
		'Current'
	],
	#category : #System-OSEnvironments,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>current [
	^ Current ifNil: [ Current := self environmentFor: OSPlatform current ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>default [
	^ self current.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>environmentFor: aPlatform [
	| environmentClass |
	
	environmentClass := self allSubclasses
		detect: [ :each | each isDefaultFor: aPlatform ]
		ifNone: [ nil ].
		
	^ (environmentClass notNil and: [ environmentClass isAvailable  ])  
		ifTrue: [ environmentClass platform: aPlatform ]
		ifFalse: [ PlatformIndependentEnvironment platform: aPlatform ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>initialize [
	SessionManager default
		registerSystemClassNamed: self name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>isAvailable [
	self flag: #todo. "Replace this for a check of FFI available"
	self environment at: #FFICalloutAPI ifAbsent: [ ^ false ].
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>isDefaultFor: aPlatform [
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>platform: anOSPlatform [
	^ self basicNew initializeWith: anOSPlatform 
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment class>>startUp: isImageStarting [

	isImageStarting ifTrue: [ Current := nil ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>asDictionary [
	| dictionary |
	dictionary := Dictionary new.
	self keysAndValuesDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>associations [
	"Answer a Collection containing the receiver's associations."
	
	^Array streamContents: [ :stream |
		self associationsDo: [ :each | stream nextPut: each ]]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>associationsDo: aBlock [
	^ self keysAndValuesDo: [ :key :value |
		aBlock value: key -> value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: aKey [
	^ self at: aKey ifAbsent: [ KeyNotFound signalFor: aKey ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: aKey ifAbsent: aBlock [
	^ (self getEnv: aKey) ifNil: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: key ifAbsentPut: aBlock  [
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ self at: key ifAbsent: [ self at: key put: aBlock value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: aKey ifPresent: aBlock [
	^ aBlock value: (self at: aKey ifAbsent: [ ^ nil ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: key ifPresent: oneArgBlock ifAbsent: absentBlock [
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the oneArgBlock with the value associated with the key, otherwise answer the value of absentBlock."
	
	self at: key ifPresent: [ :v | ^oneArgBlock cull: v ].
	^absentBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>at: aKey put: aValue [
	^ self setEnv: aKey value: aValue
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>do: aBlock [

	^self valuesDo: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>getEnv: varName [
	
	"This method calls the Standard C Library getenv() function."
	"OSEnvironment current getEnv: 'HOME' "
	
	<primitive: 'primitiveGetenv' module: '' error: ec>
	ec ifNil: [ ^self getEnvViaFFI: varName ].
	ec == #'bad argument' ifTrue: [
		varName isString 
			ifFalse: [ ^self getEnv: varName asString ] ].
	self primitiveFail
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>getEnvViaFFI: arg1 [
	"This method calls the Standard C Library getenv() function. The name of the argument (arg1) should fit decompiled version."
	 ^ self ffiCall: #( String getenv (String arg1) ) module: LibC
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>includes: anObject [

	self do: [:each | anObject = each ifTrue: [^true]].
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>includesKey: aKey [
	^ self at: aKey ifPresent: [ :value | true ] ifAbsent: [ false ].
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>initializeWith: anOSPlatform [
	super initialize.
	platform := anOSPlatform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>keys [
	"Answer an Array containing the receiver's keys."
	
	^Array streamContents: [ :s | self keysDo: [ :key | s nextPut: key]]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>keysAndValuesDo: aBlock [
	self subclassResponsibility
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>keysAndValuesDo: aBlock withAssociationString: associationString [
	| equalsIndex |
	equalsIndex := associationString indexOf: $=.
	aBlock 
		value: (associationString first: equalsIndex-1) 
		value: (associationString allButFirst: equalsIndex).
		
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>keysDo: aBlock [
	^ self keysAndValuesDo: [ :key :value |
		aBlock value: key ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>platform [
	^ platform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>removeKey: key [
	^ self unsetEnv: key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>unsetEnv: string [
	"This method calls the Standard C Library getenv() function"
	 ^ self ffiCall: #( int unsetenv (String string) ) module: LibC
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>values [
	"Answer a Collection containing the receiver's values."
	^ Array streamContents: [ :stream|
		self valuesDo: [ :value | stream nextPut: value ]]
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
OSEnvironment>>valuesDo: aBlock [
	^ self keysAndValuesDo: [ :key :value |
		aBlock value: value ]
]
