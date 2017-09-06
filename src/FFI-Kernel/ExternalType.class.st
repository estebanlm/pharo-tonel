"
An external type represents the type of external objects.

Instance variables:
	compiledSpec	<WordArray>		Compiled specification of the external type
	referentClass	<Behavior | nil>	Class type of argument required
	referencedType	<ExternalType>	Associated (non)pointer type with the receiver

Compiled Spec:
The compiled spec defines the type in terms which are understood by the VM. Each word is defined as:
	bits 0...15 	- byte size of the entity
	bit 16		- structure flag (FFIFlagStructure)
				  This flag is set if the following words define a structure
	bit 17		- pointer flag (FFIFlagPointer)
				  This flag is set if the entity represents a pointer to another object
	bit 18		- atomic flag (FFIFlagAtomic)
				  This flag is set if the entity represents an atomic type.
				  If the flag is set the atomic type bits are valid.
	bits 19...23	- unused
	bits 24...27	- atomic type (FFITypeVoid ... FFITypeDoubleFloat)
	bits 28...31	- unused

Note that all combinations of the flags FFIFlagPointer, FFIFlagAtomic, and FFIFlagStructure are invalid, EXCEPT from the following:

	FFIFlagPointer + FFIFlagAtomic:
		This defines a pointer to an atomic type (e.g., 'char*', 'int*').
		The actual atomic type is represented in the atomic type bits.

	FFIFlagPointer + FFIFlagStructure:
		This defines a structure which is a typedef of a pointer type as in
			typedef void* VoidPointer;
			typedef Pixmap* PixmapPtr;
		It requires a byte size of four (e.g. a 32bit pointer) to work correctly.

[Note: Other combinations may be allowed in the future]

"
Class {
	#name : #ExternalType,
	#superclass : #Object,
	#instVars : [
		'compiledSpec',
		'referentClass',
		'referencedType',
		'pointerSize'
	],
	#classVars : [
		'AtomicSelectors',
		'AtomicTypeNames',
		'AtomicTypes',
		'StructTypes'
	],
	#pools : [
		'FFIConstants'
	],
	#category : #FFI-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>atomicTypeNamed: aString [
	^AtomicTypes at: aString ifAbsent:[nil]
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>bool [
	^AtomicTypes at: 'bool'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>byte [
	"byte defaults to unsigned byte"
	^self unsignedByte
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>char [
	"char defaults to unsigned char"
	^self unsignedChar
]

{
	#category : #housekeeping,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>cleanupUnusedTypes [
	"ExternalType cleanupUnusedTypes"
	| value |
	StructTypes keys do:[:key|
		value := StructTypes at: key.
		value == nil ifTrue:[StructTypes removeKey: key ifAbsent:[]]].
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>double [
	^AtomicTypes at: 'double'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>float [
	^AtomicTypes at: 'float'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>forceTypeNamed: aString [
	^self newTypeNamed: aString force: true
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>initialize [
	"ExternalType initialize"
	self initializeFFIConstants.
	self initializeDefaultTypes.
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>initializeAtomicTypes [
	"ExternalType initialize"
	| atomicType byteSize type typeName |
	#(
		"name		atomic id		byte size"
		('void' 		0 				0)
		('bool' 		1 				1)
		('byte' 		2 				1)
		('sbyte' 	3 				1)
		('ushort' 	4 				2)
		('short' 		5 				2)
		('ulong' 	6 				4)
		('long' 		7 				4)
		('ulonglong' 8 				8)
		('longlong' 	9 				8)
		('char' 		10 				1)
		('schar' 	11 				1)
		('float' 		12 				4)
		('double' 	13 				8)
	) do:[:typeSpec| | compiled |
		typeName := typeSpec first.
		atomicType := typeSpec second.
		byteSize := typeSpec third.
		compiled := WordArray with: ((byteSize bitOr: FFIFlagAtomic) bitOr:
				(atomicType bitShift: FFIAtomicTypeShift)).
		type := (AtomicTypes at: typeName).
		type compiledSpec: compiled.
		compiled := WordArray with: ((self pointerSpec bitOr: FFIFlagAtomic) bitOr:
				(atomicType bitShift: FFIAtomicTypeShift)).
		type asPointerType compiledSpec: compiled.
	].
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>initializeDefaultTypes [
	"ExternalType initialize"
	| type pointerType |
	AtomicTypes = nil ifTrue:[
		"Create new atomic types and setup the dictionaries"
		AtomicTypes := Dictionary new.
		StructTypes := WeakValueDictionary new.
		AtomicTypeNames valuesDo:[:k|
			type := self basicNew.
			pointerType := self basicNew.
			AtomicTypes at: k put: type.
			type setReferencedType: pointerType.
			pointerType setReferencedType: type.
		].
	].
	self initializeAtomicTypes.
	self initializeStructureTypes.
	"AtomicTypes := nil"
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>initializeFFIConstants [
	"ExternalType initialize"
	FFIConstants initialize. "ensure proper initialization"
	AtomicTypeNames := IdentityDictionary new.
	AtomicSelectors := IdentityDictionary new.
	AtomicTypeNames
		at: FFITypeVoid put: 'void';
		at: FFITypeBool put: 'bool';
		at: FFITypeUnsignedByte put: 'byte';
		at: FFITypeSignedByte put: 'sbyte';
		at: FFITypeUnsignedShort put: 'ushort';
		at: FFITypeSignedShort put: 'short';
		at: FFITypeUnsignedInt put: 'ulong';
		at: FFITypeSignedInt put: 'long';
		at: FFITypeUnsignedLongLong put: 'ulonglong';
		at: FFITypeSignedLongLong put: 'longlong';
		at: FFITypeUnsignedChar put: 'char';
		at: FFITypeSignedChar put: 'schar';
		at: FFITypeSingleFloat put: 'float';
		at: FFITypeDoubleFloat put: 'double';
	yourself.

	AtomicSelectors
		at: FFITypeVoid put: #voidAt:;
		at: FFITypeBool put: #booleanAt:;
		at: FFITypeUnsignedByte put: #unsignedByteAt:;
		at: FFITypeSignedByte put: #signedByteAt:;
		at: FFITypeUnsignedShort put: #unsignedShortAt:;
		at: FFITypeSignedShort put: #signedShortAt:;
		at: FFITypeUnsignedInt put: #unsignedLongAt:;
		at: FFITypeSignedInt put: #signedLongAt:;
		at: FFITypeUnsignedLongLong put: #unsignedLongLongAt:;
		at: FFITypeSignedLongLong put: #signedLongLongAt:;
		at: FFITypeUnsignedChar put: #unsignedCharAt:;
		at: FFITypeSignedChar put: #signedCharAt:;
		at: FFITypeSingleFloat put: #floatAt:;
		at: FFITypeDoubleFloat put: #doubleAt:;
	yourself
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>initializeStructureTypes [
	"ExternalType initialize"
	| referentClass pointerType |
	self cleanupUnusedTypes.
	StructTypes keysAndValuesDo:[:referentName :type|
		referentClass := (Smalltalk at: referentName ifAbsent:[nil]).
		(referentClass isBehavior and:[
			referentClass includesBehavior: ExternalStructure])
				ifFalse:[referentClass := nil].
		type compiledSpec: 
			(WordArray with: self structureSpec).
		type newReferentClass: referentClass.
		pointerType := type asPointerType.
		pointerType compiledSpec: 
			(WordArray with: self pointerSpec).
		pointerType newReferentClass: referentClass.
	].
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>long [
	^self signedLong
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>new [
	"Use either the type constants or #externalType for creating external types"
	^self shouldNotImplement
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>newTypeNamed: aString force: aBool [
	| sym type referentClass pointerType |
	sym := aString asSymbol.
	type := StructTypes at: aString ifAbsent:[nil].
	type == nil ifFalse:[^type].
	referentClass := Smalltalk at: sym ifAbsent:[nil].
	(referentClass isBehavior and:[referentClass includesBehavior: ExternalStructure])
		ifFalse:[referentClass := nil].
	"If we don't have a referent class and are not forced to create a type get out"
	(referentClass == nil and:[aBool not]) ifTrue:[^nil].
	type := self basicNew compiledSpec: 
		(WordArray with: self structureSpec).
	pointerType := self basicNew compiledSpec: 
		(WordArray with: self pointerSpec).
	type setReferencedType: pointerType.
	pointerType setReferencedType: type.
	type newReferentClass: referentClass.
	pointerType newReferentClass: referentClass.
	StructTypes at: sym put: type.
	^type
]

{
	#category : #housekeeping,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>noticeModificationOf: aClass [
	"A subclass of ExternalStructure has been redefined.
	Clean out any obsolete references to its type."
	| type |
	aClass isBehavior ifFalse:[^nil]. "how could this happen?"
	aClass withAllSubclassesDo:[:cls|
		type := StructTypes at: cls name ifAbsent:[nil].
		type == nil ifFalse:[
			type newReferentClass: cls.
			type asPointerType newReferentClass: cls].
	].
]

{
	#category : #housekeeping,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>noticeRemovalOf: aClass [
	"A subclass of ExternalStructure is being removed.
	Clean out any obsolete references to its type."
	| type |
	type := StructTypes at: aClass name ifAbsent:[nil].
	type == nil ifFalse:[
		type newReferentClass: nil.
		type asPointerType newReferentClass: nil].

]

{
	#category : #housekeeping,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>noticeRenamingOf: aClass from: oldName to: newName [
	"An ExternalStructure has been renamed from oldName to newName.
	Keep our type names in sync."
	| type |
	type := StructTypes at: oldName ifAbsent:[nil].
	type == nil ifFalse:[StructTypes at: newName put: type].
	StructTypes removeKey: oldName ifAbsent:[].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>pointerSpec [
	^(4 bitOr: FFIFlagPointer)
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>sbyte [
	^self signedByte
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>schar [
	^self signedChar
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>short [
	^self signedShort
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>signedByte [
	^AtomicTypes at: 'sbyte'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>signedChar [
	^AtomicTypes at: 'schar'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>signedLong [
	^AtomicTypes at: 'long'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>signedLongLong [
	^AtomicTypes at: 'longlong'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>signedShort [
	^AtomicTypes at: 'short'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>string [
	^(AtomicTypes at: 'char') asPointerType
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>structTypeNamed: aSymbol [
	aSymbol == nil ifTrue:[^nil].
	^self newTypeNamed: aSymbol force: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>structureSpec [
	^FFIFlagStructure
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>ulong [
	^self unsignedLong
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>unsignedByte [
	^AtomicTypes at: 'byte'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>unsignedChar [
	^AtomicTypes at: 'char'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>unsignedLong [
	^AtomicTypes at: 'ulong'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>unsignedLongLong [
	^AtomicTypes at: 'ulonglong'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>unsignedShort [
	^AtomicTypes at: 'ushort'
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>ushort [
	^self unsignedShort
]

{
	#category : #'type constants',
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType class>>void [
	^AtomicTypes at: 'void'
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>asNonPointerType [
	"convert the receiver into a non pointer type"
	self isPointerType
		ifTrue:[^referencedType]
		ifFalse:[^self]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>asPointerType [
	"convert the receiver into a pointer type"
	self isPointerType
		ifTrue:[^self]
		ifFalse:[^referencedType]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>asPointerType: pointerSize [
	"convert the receiver into a pointer type"
	| type |
	type := self asPointerType.
	^type pointerSize = pointerSize
		ifTrue: [type]
		ifFalse:
			[type copy pointerSize: pointerSize; yourself]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>atomicType [
	^(self headerWord bitAnd: FFIAtomicTypeMask) >> FFIAtomicTypeShift
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>byteSize [
	"Return the size in bytes of this type"
	^self headerWord bitAnd: FFIStructSizeMask
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>compiledSpec [
	"Return the compiled spec of the receiver"
	^compiledSpec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>compiledSpec: aWordArray [
	compiledSpec := aWordArray.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>embeddedSpecWithSize: typeSize [
	"Return a compiled spec for embedding in a new compiled spec."
	| spec header |
	spec := self compiledSpec copy.
	header := spec at: 1.
	header := (header bitAnd: FFIStructSizeMask bitInvert32) bitOr: typeSize.
	spec at: 1 put: header.
	(self isStructureType and:[self isPointerType not])
		ifTrue:[spec := spec copyWith: self class structureSpec].
	^spec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>externalTypeName [
	^'ExternalType ', (AtomicTypeNames at: self atomicType), ' asPointerType'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>headerWord [
	"Return the compiled header word"
	^compiledSpec at: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isAtomic [
	"Return true if the receiver describes a built-in type"
	^self headerWord anyMask: FFIFlagAtomic
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isIntegerType [
	"Return true if the receiver is a built-in integer type"
	| type |
	type := self atomicType.
	^type > FFITypeBool and:[type <= FFITypeUnsignedLongLong]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isPointerType [
	"Return true if the receiver represents a pointer type"
	^self isStructureType not and:[self headerWord anyMask: FFIFlagPointer]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isSigned [
	"Return true if the receiver is a signed type.
	Note: Only useful for integer types."
	^self atomicType anyMask: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isStructureType [
	"Return true if the receiver represents a structure type"
	^self headerWord anyMask: FFIFlagStructure
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isUnsigned [
	"Return true if the receiver is an unsigned type.
	Note: Only useful for integer types."
	^self isSigned not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>isVoid [
	"Return true if the receiver describes a plain 'void' type"
	^self isAtomic and:[self atomicType = 0]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>newReferentClass: aClass [
	"The class I'm referencing has changed. Update my spec."
	referentClass := aClass.
	self isPointerType ifTrue:[^self]. "for pointers only the referentClass changed"
	referentClass == nil ifTrue:[
		"my class has been removed - make me 'struct { void }'"
		compiledSpec := WordArray with: (FFIFlagStructure).
	] ifFalse:[
		"my class has been changed - update my compiledSpec"
		compiledSpec := referentClass compiledSpec.
	].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>pointerSize [
	"Answer the pointer size of the receiver, if specified."
	^pointerSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>pointerSize: anInteger [
	| spec |
	pointerSize := anInteger.
	(((spec := compiledSpec at: 1) anyMask: FFIFlagPointer)
	 and: [(spec bitAnd: FFIStructSizeMask) ~= anInteger]) ifTrue:
		[compiledSpec := compiledSpec shallowCopy.
		 compiledSpec at: 1 put: (spec bitClear: FFIStructSizeMask) + anInteger]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>printAtomicType: spec on: aStream [
	self assert: (spec anyMask: FFIFlagAtomic).
	aStream nextPutAll: (#(	'void' 'unsigned char' 'unsigned char' 'signed char'
							'unsigned short' 'short' 'unsigned long' 'long'
							'unsigned long long' 'long long' 'char' 'signed char'
							'float' 'double') at: ((spec bitAnd: FFIAtomicTypeMask) bitShift: FFIAtomicTypeShift negated) + 1).
	aStream space.
	(spec anyMask: FFIFlagPointer) ifTrue:
		[aStream nextPut: $*]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>printOn: aStream [
	referentClass == nil
		ifTrue:[aStream nextPutAll: (AtomicTypeNames at: self atomicType)]
		ifFalse:[aStream nextPutAll: referentClass name].
	self isPointerType ifTrue:[aStream nextPut: $*].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>printStructureFieldStartingAt: initialSpecIndex withName: name inClass: structureClass on: aStream indent: indent [
	"Print the structure's field starting at initialSpecIndex and answer the index in compiledSpec of the subsequent type."
	| spec subStructureClassBinding |
	aStream tab: indent.
	spec := compiledSpec at: initialSpecIndex.
	(spec anyMask: FFIFlagAtomic) ifTrue:
		[self printAtomicType: spec on: aStream.
		 aStream nextPutAll: (name ifNotNil: [name] ifNil: ['foo']).
		 ^initialSpecIndex + 1].
	 subStructureClassBinding := (structureClass >> name) literals detect:
									[:l| l isVariableBinding and: [l value inheritsFrom: ExternalStructure]].
	(spec bitClear: FFIStructSizeMask) = FFIFlagStructure ifTrue:
		[| next |
		 next := initialSpecIndex + 1.
		 aStream nextPutAll: 'struct {'.
		 subStructureClassBinding value fields withIndexDo:
			[:tuple :i|
			aStream cr.
			next := self printStructureFieldStartingAt: next
						withName: tuple first
						inClass: subStructureClassBinding value
						on: aStream
						indent: indent + 1.
			aStream nextPut: $;].
		 aStream crtab: indent; nextPut: $}.
		 name ifNotNil: [aStream space; nextPutAll: name].
		 self assert: (next - 1 = compiledSpec size or: [(compiledSpec at: next) = FFIFlagStructure]).
		 ^next <= compiledSpec size ifTrue: [next + 1] ifFalse: [next]].
	self assert: (spec anyMask: FFIFlagPointer).
	aStream nextPutAll: 'struct '; nextPutAll: subStructureClassBinding value name; nextPutAll: ' *'; nextPutAll: name.
	^initialSpecIndex + 1
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>printTypedefOn: s [
	s nextPutAll: 'typedef '.
	(compiledSpec first bitClear: FFIStructSizeMask) = FFIFlagStructure
		ifTrue:
			[| next |
			 next := 2.
			 s nextPutAll: 'struct {'.
			 referentClass fields withIndexDo:
				[:tuple :i|
				s cr.
				next := self printStructureFieldStartingAt: next
							withName: tuple first
							inClass: referentClass
							on: s
							indent: 1.
				s nextPut: $;].
			 s cr; nextPutAll: '} '.
			 self assert: (next - 1 = compiledSpec size or: [(compiledSpec at: next) = FFIFlagStructure])]
		ifFalse:
			[self printAtomicType: compiledSpec first on: s].
	s nextPutAll: (referentClass ifNotNil: [referentClass name] ifNil: ['foo'])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>readFieldAt: byteOffset [
	"Answer a string defining the accessor to an entity of the receiver type starting at the given byte offset. 
	 Private. Used for field definition only."
	self isPointerType ifTrue:
		[| accessor |
		accessor := self pointerSize caseOf: {
						[nil]	->	[#pointerAt:].
						[4]	->	[#shortPointerAt:].
						[8]	->	[#longPointerAt:] }.
		 ^String streamContents:
			[:s|
			 referentClass
				ifNil:
					[s nextPutAll: '^ExternalData fromHandle: (handle ', accessor, ' ';
						print: byteOffset;
						nextPutAll: ') type: ExternalType ';
						nextPutAll: (AtomicTypeNames at: self atomicType);
						nextPutAll: ' asPointerType']
				ifNotNil:
					[s nextPutAll: '^';
						print: referentClass;
						nextPutAll: ' fromHandle: (handle ', accessor, ' ';
						print: byteOffset;
						nextPut: $)]]].

	self isAtomic ifFalse: "structure type"
		[^String streamContents:[:s|
			s nextPutAll:'^';
				print: referentClass;
				nextPutAll:' fromHandle: (handle structAt: ';
				print: byteOffset;
				nextPutAll:' length: ';
				print: self byteSize;
				nextPutAll:')']].

	"Atomic non-pointer types"
	^String streamContents:
		[:s|
		s nextPutAll:'^handle ';
			nextPutAll: (AtomicSelectors at: self atomicType);
			space; print: byteOffset].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>referentClass [
	"Return the class specifying the receiver"
	^referentClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>setReferencedType: aType [
	referencedType := aType
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>storeOn: aStream [
	referentClass == nil
		ifTrue:[aStream nextPutAll: ExternalType name; space; nextPutAll: (AtomicTypeNames at: self atomicType)]
		ifFalse:[aStream nextPut: $(; nextPutAll: ExternalType name; space; nextPutAll: #structTypeNamed:; space;  store: referentClass name; nextPut: $)].
	self isPointerType ifTrue: [aStream space; nextPutAll: #asPointer].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>typedef [
	^String streamContents: [:s| self printTypedefOn: s]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
ExternalType>>writeFieldAt: byteOffset with: valueName [
	"Answer a string defining the accessor to an entity of the receiver type starting at the given byte offset. 
	 Private. Used for field definition only."
	self isPointerType ifTrue:
		[| accessor |
		accessor := self pointerSize caseOf: {
						[nil]	->	[#pointerAt:].
						[4]	->	[#shortPointerAt:].
						[8]	->	[#longPointerAt:] }.
		^String streamContents:
			[:s|
			s nextPutAll:'handle ', accessor, ' ';
				print: byteOffset;
				nextPutAll:' put: ';
				nextPutAll: valueName;
				nextPutAll:' getHandle.']].

	self isAtomic ifFalse:[
		^String streamContents:[:s|
			s nextPutAll:'handle structAt: ';
				print: byteOffset;
				nextPutAll:' put: ';
				nextPutAll: valueName;
				nextPutAll:' getHandle';
				nextPutAll:' length: ';
				print: self byteSize;
				nextPutAll:'.']].

	^String streamContents:[:s|
		s nextPutAll:'handle ';
			nextPutAll: (AtomicSelectors at: self atomicType);
			space; print: byteOffset;
			nextPutAll:' put: ';
			nextPutAll: valueName].
]
