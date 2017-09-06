"
I represent a flattened layout of a structure. I am use to compute whether a structure is passed in registers or not, and which registers are used for passing the structure.
"
Class {
	#name : #FFIExternalStructureFlatLayout,
	#superclass : #Object,
	#instVars : [
		'fields',
		'size',
		'alignment',
		'integerRegisterCount',
		'floatRegisterCount'
	],
	#category : #UnifiedFFI,
	#timestamp : 'RonieSalgado 2/14/2017 01:33'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>addField: registerClass size: fieldSize alignment: fieldAlignment [
	self alignTo: fieldSize.
	fields add: (FFIExternalStructureFlatLayoutField new
			registerClass: registerClass;
			size: fieldSize;
			alignment: fieldAlignment;
			offset: size
			yourself
		).
	size := size + fieldSize.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>addMemoryFieldSize: fieldSize alignment: fieldAlignment. [
	self addField: #memory size: fieldSize alignment: fieldAlignment
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>alignTo: anAlignment [
	size := size alignedTo: anAlignment.
	alignment := alignment max: anAlignment.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>alignment [
	^ alignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>alignment: anObject [
	alignment := anObject
]

{
	#category : #'system v abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>combineSysVAMD64RegisterClass: leftClass with: rightClass [
	"AMD64 SystemV eightbyte classification reduction"
	
	"Same class."
	leftClass == rightClass ifTrue: [ ^ leftClass ].
	
	"If one has no class, use the other."
	leftClass isNil ifTrue: [ ^ rightClass ].
	rightClass isNil ifTrue: [ ^ leftClass ].
	
	"If one is memory, the result is memory."
	(leftClass == #memory or: [ rightClass == #memory ]) ifTrue: [ ^ #memory ].
	
	"If one is integer, the result is integer."
	(leftClass == #integer or: [ rightClass == #integer ]) ifTrue: [ ^ #integer ].
	
	"TODO: If one of the classes is X87, X87UP, COMPLEX_X87 class, #memory is used as class."
	
	"Otherwise, use the SSE class"
	^ #float
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>countRegisters [
	fields do: [ :field |
		field registerClass == #integer ifTrue: [ integerRegisterCount := integerRegisterCount + 1 ].
		field registerClass == #float ifTrue: [ floatRegisterCount := floatRegisterCount + 1 ].
	]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>fields [
	^ fields
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>fields: anObject [
	fields := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>floatRegisterCount [
	^ floatRegisterCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>floatRegisterCount: anObject [
	^ floatRegisterCount := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>initialize [
	super initialize.
	fields := OrderedCollection new.
	size := 0.
	alignment := 1.
	integerRegisterCount := 0.
	floatRegisterCount := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>integerRegisterCount [
	^ integerRegisterCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>integerRegisterCount: anObject [
	integerRegisterCount := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>isPassedInMemory [
	^ fields size = 1 and: [ fields first registerClass == #memory ]
]

{
	#category : #'system v abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>reduce: sourceFields inGroupsOfSize: groupSize with: aBlock [
	| reduced nextGroupOffset |
	reduced := nil.
	nextGroupOffset := groupSize.
	sourceFields do: [ :field |
		field offset < nextGroupOffset ifFalse: [ 
			reduced ifNotNil: [
				fields add: reduced.
				reduced := nil
			].
			nextGroupOffset := (field offset // groupSize + 1) * groupSize
		].
	
		reduced ifNotNil: [
			reduced
				registerClass: (aBlock value: reduced value: field);
				size: (reduced size alignedTo: field alignment) + field size;
				alignment: (reduced alignment max: field alignment)
		] ifNil: [
			reduced := field copy
		]
	].

	reduced ifNotNil: [ fields add: reduced ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>size [
	^ size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>size: anObject [
	size := anObject
]

{
	#category : #'system v abi',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayout>>sysVAMD64PostProcess [
	| result |
	result := self class new.
	result
		size: size;
		alignment: alignment.
	result reduce: fields inGroupsOfSize: 8 with: [ :left :right |
		self combineSysVAMD64RegisterClass: left registerClass with: right registerClass
	].

	"Post merger cleanup"
	
	"If there is any memory field, pass the whole structure in memory."
	result fields detect: [ :field | field registerClass == #memory] ifFound: [
		result fields: { FFIExternalStructureFlatLayoutField new
			registerClass: #memory;
			offset: 0;
			size: size;
			alignment: alignment;
			yourself
		}.
		^ result
	].

	result countRegisters.
	^ result
	
]
