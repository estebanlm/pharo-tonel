"

"
Class {
	#name : #HEMethodContainer,
	#superclass : #HEAbstractExported,
	#instVars : [
		'methods',
		'classSideMethods',
		'traitComposition',
		'classTraitComposition',
		'category'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>category [
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>category: anObject [
	category := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>classSideMethods [
	^ classSideMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>classSideMethods: anObject [
	classSideMethods := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>classTraitComposition [
	^ classTraitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>classTraitComposition: anObject [
	classTraitComposition := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>doFromMethodContainer: aMethodContainer [
	category := aMethodContainer category.
	traitComposition := aMethodContainer traitComposition asExportedLiteral.
	classTraitComposition := aMethodContainer theMetaClass traitComposition
		asExportedLiteral.

	methods := aMethodContainer localMethods
		select: [ :e | e isExtension not ]
		thenCollect: [ :e | HEMethod for: e ].

	classSideMethods := aMethodContainer theMetaClass localMethods
		select: [ :e | e isExtension not ]
		thenCollect: [ :e | HEMethod for: e ]
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>doReadHeaderFrom: aReader [
	self subclassResponsibility
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>doReadMethodsFrom: aReader [
	| numberOfMethods numberOfClassMethods |
	category := aReader readByteSymbol.
	numberOfMethods := aReader readInt.

	methods := (1 to: numberOfMethods) collect: [ :i | HEMethod readFrom: aReader ] as: Array.
	numberOfClassMethods := aReader readInt.

	classSideMethods := (1 to: numberOfClassMethods) collect: [ :i | HEMethod readFrom: aReader ] as: Array.
	traitComposition := HEExportedLiteral readFrom: aReader.

	classTraitComposition := HEExportedLiteral readFrom: aReader
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>doWriteHeaderInto: aWriter  [
	self subclassResponsibility
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>doWriteMethods: aWriter [
	aWriter writeByteString: category.

	aWriter writeInt: methods size.
	methods do: [ :e | e writeInto: aWriter ].

	aWriter writeInt: classSideMethods size.
	classSideMethods do: [ :e | e writeInto: aWriter ].

	traitComposition writeInto: aWriter.
	classTraitComposition writeInto: aWriter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>methods [
	^ methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>methods: anObject [
	methods := anObject
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>readFrom: aReader [
	self doReadHeaderFrom: aReader.
	self doReadMethodsFrom: aReader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>traitComposition [
	^ traitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>traitComposition: anObject [
	traitComposition := anObject
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodContainer>>writeInto: aWriter [
	self doWriteHeaderInto: aWriter.
	self doWriteMethods: aWriter
]
