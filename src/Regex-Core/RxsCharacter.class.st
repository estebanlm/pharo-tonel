"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
A character is a literal character that appears either in the expression itself or in a character set within an expression.

Instance variables:
	character		<Character>
"
Class {
	#name : #RxsCharacter,
	#superclass : #RxsNode,
	#instVars : [
		'character'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter class>>with: aCharacter [

	^self new initializeCharacter: aCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>character [

	^character
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>dispatchTo: aMatcher [
	"Inform the matcher of the kind of the node, and it
	will do whatever it has to."

	^aMatcher syntaxCharacter: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>enumerateTo: aSet ignoringCase: aBoolean [

	aBoolean
		ifTrue: 
			[aSet 
				add: character asUppercase;
				add: character asLowercase]
		ifFalse: [aSet add: character]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>initializeCharacter: aCharacter [
	"See class comment for instance variable description."

	character := aCharacter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>isAtomic [
	"A character is always atomic."

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsCharacter>>isEnumerable [

	^true
]
