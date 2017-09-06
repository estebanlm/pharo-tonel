"
A writer for Smalltalk code
"
Class {
	#name : #MCFileTreeStWriter,
	#superclass : #MCFileTreeAbstractStWriter,
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:58'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStWriter>>visitClassDefinition: definition [
    orderedClassNames add: definition className.
    self
        writeInDirectoryName: definition className
        fileName: definition className
        extension: '.st'
        visit: [ self writeClassDefinition: definition ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStWriter>>visitClassTraitDefinition: definition [
    orderedTraitNames add: definition className, ' classTrait'.
    self
        writeInDirectoryName: definition className
        fileName: definition className, '_classTrait'
        extension: '.st'
        visit: [ self writeClassTraitDefinition: definition ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStWriter>>visitMethodDefinition: definition [
    | filename directoryname |
    directoryname := definition classIsMeta
        ifTrue: [ definition className , '_class' ]
        ifFalse: [ definition className ].
    filename := self fileNameForSelector: definition selector.
    self
        writeInDirectoryName: directoryname
        fileName: filename
        extension: '.st'
        visit: [ self writeMethodDefinition: definition ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStWriter>>visitTraitDefinition: definition [
    orderedTraitNames add: definition className.
    self
        writeInDirectoryName: definition className
        fileName: definition className
        extension: '.st'
        visit: [ self writeTraitDefinition: definition ]
]
