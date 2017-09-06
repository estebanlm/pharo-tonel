"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
I represent a range of characters as appear in character classes such as

	[a-ZA-Z0-9].

I appear in a syntax tree only as an element of RxsCharSet.

Instance Variables:

	first	<Character>
	last	<Character>
"
Class {
	#name : #RxsRange,
	#superclass : #RxsNode,
	#instVars : [
		'first',
		'last'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRange class>>from: aCharacter to: anotherCharacter [

	^self new initializeFirst: aCharacter last: anotherCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRange>>enumerateTo: aSet ignoringCase: aBoolean [
	"Add all of the elements I represent to the collection."

	first asInteger to: last asInteger do:
		[:charCode | | character |
		character := charCode asCharacter.
		aBoolean
		ifTrue: 
			[aSet 
				add: character asUppercase;
				add: character asLowercase]
		ifFalse: [aSet add: character]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRange>>initializeFirst: aCharacter last: anotherCharacter [

	first := aCharacter.
	last := anotherCharacter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRange>>isEnumerable [

	^true
]
