"
I'm a field spec for fields in FFIExternalStructure
"
Class {
	#name : #FFIExternalStructureFieldSpec,
	#superclass : #Object,
	#instVars : [
		'fields'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>addField: aName type: anExternalType [
	fields at: aName put: anExternalType
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>compileSpec  [
	"This will compile the structure spec into something ExternalStructure can understand"
	^ fields values 
		inject: WordArray new
		into: [ :all :each | all, (each externalTypeWithArity embeddedSpecWithSize: each externalTypeSize) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>fieldNames [
	^ fields keys
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>fieldsAndTypesDo: aBlock [
	^ fields keysAndValuesDo: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>initialize  [
	super initialize.
	fields := OrderedDictionary new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFieldSpec>>typeFor: aString  [
	^ fields at: aString
]
