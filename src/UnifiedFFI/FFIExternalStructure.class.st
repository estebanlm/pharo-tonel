"
I'm an extension of ExternalStructure.
I extend my parent functionality by adding: 

- field description 
- field accessing implementation 
- ...
"
Class {
	#name : #FFIExternalStructure,
	#superclass : #ExternalStructure,
	#classInstVars : [
		'externalStructureAlignment'
	],
	#category : #UnifiedFFI-Objects,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>asExternalTypeOn: generator [
	^ FFIExternalStructureType objectClass: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>compileFields: specArray withAccessors: defineBoolean [
	| offset fieldSpec |
	
	fieldSpec := self fieldSpec.
	offset := 0.	
	externalStructureAlignment := 1.
	fieldSpec fieldsAndTypesDo: [ :fieldName :type |
		offset := offset alignedTo: type typeAlignment.
		self defineFieldOffset: fieldName value: offset + 1.  
		(defineBoolean and: [ fieldName isSymbol ]) ifTrue: [ 
			self defineFieldAccessorsFor: fieldName type: type ].
		offset := offset + type typeSize.
		externalStructureAlignment := externalStructureAlignment max: type typeAlignment  ].
	offset := offset alignedTo: externalStructureAlignment.
	
	"Real compiled spec is the compiled spec of fields plus a header with structure size and 
	 structure flag"
	"Temporal type to ensure cyclic (pointer) references will work (case of linked lists, 
	 for example). I do not like it, but it works :S"
	compiledSpec := {ExternalType pointerSpec}. 
	"Now I can reconsider it"
	compiledSpec := fieldSpec compileSpec copyWithFirst: (offset bitOr: FFIFlagStructure).
	ExternalType noticeModificationOf: self.
	^ compiledSpec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>defineFieldAccessorsFor: fieldName startingAt: byteOffset type: type [
	"Define read/write accessors for the given field. 
	 This method is equivallent to his parent, but it changes a couple of things: 
	 - type is FFIExternalType and not ExternalType
	 - it generates to another protocol, not accessing"
	| code |
	
	(type isVoid and: [ type isPointer not ]) ifTrue:[ ^ self ].
	
	code := fieldName,'
	"This method was automatically generated"
	', (type readFieldAt: byteOffset).
	self 
		compile: code 
		classified: self generatedFieldProtocolName.
	
	code := fieldName,': anObject
	"This method was automatically generated"
	', (type writeFieldAt: byteOffset with:'anObject').
	self 
		compile: code 
		classified: self generatedFieldProtocolName.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>defineFieldAccessorsFor: fieldName type: type [
	"Define read/write accessors for the given field. 
	 This method is equivallent to his parent, but it changes a couple of things: 
	 - type is FFIExternalType and not ExternalType
	 - it generates to another protocol, not accessing"
	| code |
	
	(type isVoid and: [ type isPointer not ]) ifTrue:[ ^ self ].
	
	code := fieldName,'
	"This method was automatically generated"
	', (type offsetReadFieldAt: (self offsetVariableNameFor: fieldName)).
	self 
		compile: code 
		classified: self generatedFieldProtocolName.
	
	code := fieldName,': anObject
	"This method was automatically generated"
	', (type offsetWriteFieldAt: (self offsetVariableNameFor: fieldName) with:'anObject').
	self 
		compile: code 
		classified: self generatedFieldProtocolName.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>defineFieldOffset: fieldName value: offset [
	"Add offset values to classPool."
	| offsetVarName |
	offsetVarName := self offsetVariableNameFor: fieldName.
	"Is this field defined in a superclass?"
	(superclass bindingOf: offsetVarName)
		ifNil: [
			(self hasClassVarNamed: offsetVarName) 
				ifFalse: [ self addClassVarNamed: offsetVarName ].
			self classVarNamed: offsetVarName put: offset ].
]

{
	#category : #'register marshalling',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>emitFlatStructureLayoutInto: flatStructureLayout [
	flatStructureLayout alignTo: self structureAlignment.
	self fieldSpec fieldsAndTypesDo: [ :field :type |
		type emitFlatStructureLayoutFieldInto: flatStructureLayout
	].
	flatStructureLayout alignTo: self structureAlignment.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>externalNew [
	"Create an instance of the receiver on the external heap"
	^self fromHandle: (ExternalAddress allocate: self structureSize)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>fieldSpec [
	^ FFIExternalStructureFieldParser new  
		parseFields: self fieldsDesc structure: self.

]

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>fields [
	^ self fieldsDesc
]

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>fieldsDesc [
	"override this method in a subclass to get an automatically generated
	field accessors.
	
	The field description format is following:
	
	#( 
 		type1 name1;
		type2 name2;
		....
	)
	"
	^ #()
]

{
	#category : #'register marshalling',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>flatStructureLayout [
	| result |
	result := FFIExternalStructureFlatLayout new.
	self emitFlatStructureLayoutInto: result.
	^ result
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>fromHandle: aHandle [
	"Offsets are calculated when specs are compiled, but sometimes there is a possibility that 
	 user access them before actually using the compiled spec, so I need to be sure they are 
	 initialised before anything. This is why I send #compiledSpec here."
	self compiledSpec. 
	^ (super fromHandle: aHandle) initialize 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>generatedFieldProtocolName [
	^ 'accessing structure variables'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>isNormalAlignedStructure [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>offsetFieldPrefix [
	^ 'OFFSET'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>offsetVariableNameFor: fieldName [
	^ (self offsetFieldPrefix, '_', fieldName asUppercase) asSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>rebuildFieldAccessors [
	self removeAllOffsetVariables. 
	self 
		compileFields: self fields 
		withAccessors: true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>removeAllMethodsInProtocol: protocolName [
	| protocol |
	
	protocol := self organization protocolNamed: protocolName.
	protocol ifNil: [ ^ self ].
	
	protocol methods do: [ :each | self removeSelector: each ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>removeAllOffsetVariables [
	self classPool keys 
		select: [ :each | each beginsWith: 'OFFSET_' ]
		thenDo: [ :each | self removeClassVarNamed: each ]
]

{
	#category : #'class management',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>reset  [
	compiledSpec := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>structureAlignment [
	externalStructureAlignment ifNil: [ self compileFields ].
	^ externalStructureAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure class>>structureSize [
	^ self byteSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure>>address [
	self deprecated: 'Use #getHandle' on: '27 October 2015' in: 'Pharo5'. 
	^ self getHandle
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure>>pointer [
	self getHandle isExternalAddress 
		ifFalse: [ self error: 'Structures need to be moved to external memory space before passing them as pointers.' ].
	^ self getHandle pointer
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructure>>printOn: aStream  [
	"Append to the argument, aStream, the names and values of all the record's variables."
	aStream nextPutAll: self class name; nextPutAll: ' ( '; cr.
	self class fieldSpec fieldNames do: [ :field |
		aStream nextPutAll: field; nextPut: $:; space; tab.
			(self perform: field ) printOn: aStream.
			] separatedBy: [ aStream cr ].
	aStream cr; nextPut: $)
]
