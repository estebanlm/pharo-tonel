Extension { #name : #Class }

{ #category : #'*Epicea-Ring' }
Class >> asEpiceaRingDefinition [
	
	| ring |
	ring := (RGClassDefinition named: self name)
		category: self category;
		superclassName: self superclass asString; "Note it's nil for ProtoObject"
		traitCompositionSource: self traitCompositionString;
		addInstanceVariables: self instVarNames;
		addClassVariables: self classVarNames;
		addSharedPools: self sharedPoolNames;
		comment: self organization classComment;
		stamp: self organization commentStamp;
		definitionSource: self definition;
		package: self epiceaPackageName;
		withMetaclass.

	ring theMetaClass 
		traitCompositionSource: self theMetaClass traitCompositionString;
		definitionSource: self theMetaClass definition;
		addInstanceVariables: self theMetaClass instVarNames.  

	^ ring
]

{ #category : #'*Epicea-Ring' }
Class >> epiceaPackageName [
	"Answer my package name for Epicea serialization"

	self flag: #fix.
	^ (RPackage organizer packageOfClassNamed: self name) 
		ifNotNil: [ :package | package name ]
		ifNil: [ 'nil' ]
]
