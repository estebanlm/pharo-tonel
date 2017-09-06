"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
A generic syntax tree node, provides some common responses to the standard tests, as well as tree structure printing -- handy for debugging.
"
Class {
	#name : #RxsNode,
	#superclass : #Object,
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsNode>>indentCharacter [
	"Normally, #printOn:withIndent: method in subclasses
	print several characters returned by this method to indicate
	the tree structure."

	^$+
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsNode>>isAtomic [
	"Answer whether the node is atomic, i.e. matches exactly one 
	constant predefined normal character.  A matcher may decide to 
	optimize matching of a sequence of atomic nodes by glueing them 
	together in a string."

	^false "tentatively"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsNode>>isNullable [
	"True if the node can match an empty sequence of characters."

	^false "for most nodes"
]
