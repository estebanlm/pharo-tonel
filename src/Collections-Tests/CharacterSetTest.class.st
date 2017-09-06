"
CharacterSetTest holds tests for CharacterSet
"
Class {
	#name : #CharacterSetTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Support,
	#timestamp : 'nice 11/20/2007 00:35'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
CharacterSetTest>>testCopy [
    | theOriginal theCopy |
    theOriginal := CharacterSet newFrom: 'abc'.
    theCopy := theOriginal copy.
    theCopy remove: $a.
    ^self should: [theOriginal includes: $a] description: 'Changing the copy should not change the original'.
]
