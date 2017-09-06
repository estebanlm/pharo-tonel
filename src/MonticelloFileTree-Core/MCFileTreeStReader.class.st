"
A reader for Smalltalk code
"
Class {
	#name : #MCFileTreeStReader,
	#superclass : #MCFileTreeAbstractReader,
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStReader class>>extension [
	^ 'tree'
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStReader>>addClassAndMethodDefinitionsFromDirectory: aDirectory [
    self addClassAndMethodDefinitionsFromDirectoryEntries: aDirectory entries
]
