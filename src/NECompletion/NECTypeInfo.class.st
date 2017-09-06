"
I'm used in ECInstVarTypeGuesser to store found type informations.
"
Class {
	#name : #NECTypeInfo,
	#superclass : #Object,
	#instVars : [
		'type',
		'kind',
		'temporaryOffset'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo class>>definedByLiteral: aClass  [
	| newInstance |
	newInstance := self new.
	newInstance setType: aClass kind: 1.
	^ newInstance
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo class>>definedByMessageSend: aClass  [
	| newInstance |
	newInstance := self new.
	newInstance setType: aClass kind: 2.
	^ newInstance
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo class>>definedByTemporaryVar: anInteger [
	| newInstance |
	newInstance := self new.
	newInstance setType: nil kind: 3.
	newInstance temporaryOffset: anInteger.
	^ newInstance
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>isDefinedByMessageSend [
	^kind == 2
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>isDefinedByTemporary [
	^ kind == 3
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>priority [
	^kind
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>setType: aClass kind: anInteger  [
	type := aClass.
	kind := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>temporaryOffset [
	^temporaryOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>temporaryOffset: anInteger  [
	temporaryOffset := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>type [
	^type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypeInfo>>type: aClass  [
	type := aClass
]
