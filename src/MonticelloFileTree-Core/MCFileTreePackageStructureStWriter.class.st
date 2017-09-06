"
Writer for a package structure
"
Class {
	#name : #MCFileTreePackageStructureStWriter,
	#superclass : #MCStWriter,
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter class>>useCypressWriter [
    "MCFileTreeRepository defaultPackageExtension:'.package'"

    "MCFileTreeRepository defaultPackageExtension:'.pkg'"

    ^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter class>>useSnapShotWriter [
    ^ MCFileTreeRepository defaultPackageExtension = '.pkg'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>absentInitializers [
	^ initializers reject: [ :each | Smalltalk hasClassNamed: each key ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>acceptVisitor: aVisitor forDefinitions: aCollection [
	(MCDependencySorter sortItems: aCollection)
		do: [ :ea | ea accept: aVisitor ]
		displayingProgress: 'Writing definitions...'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>initializers: aCollection [
	initializers := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>presentInitializers [
	^ initializers select: [ :each | Smalltalk hasClassNamed: each key ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>writeAbsentInitializers [
	(self absentInitializers asSortedCollection: [ :a :b | a key <= b key ])
		do: [ :association | stream nextPutAll: association value contents ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>writeDefinitions: aCollection [
	"the correct initialization order is unknown if some classes are missing in the image"

	initializers := Set new.
	self
		acceptVisitor: self forDefinitions: aCollection;
		writePresentInitializers;
		writeAbsentInitializers
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>writeMethodPreamble: definition [
    stream
        cr;
        nextPut: $!;
        nextPutAll: definition fullClassName;
        nextPutAll: ' methodsFor: ';
        nextPutAll: definition category asString printString;
        nextPutAll: '!';
        cr
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>writePresentInitializers [
	| orderedClasses presentInitializers |
	presentInitializers := self presentInitializers.
	orderedClasses := (Class
		superclassOrder: (presentInitializers collect: [ :each | Smalltalk classOrTraitNamed: each key ]))
		collect: [ :each | each name ].
	orderedClasses
		do: [ :className | stream nextPutAll: (presentInitializers detect: [ :each | each key = className ]) value contents ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreePackageStructureStWriter>>writeProperties [
    stream
        nextPut: ${;
        cr;
        nextPutAll: '    "noMethodMetaData" : true,';
        cr;
        nextPutAll: '    "separateMethodMetaAndSource" : false';
        cr;
        nextPut: $};
        cr
]
