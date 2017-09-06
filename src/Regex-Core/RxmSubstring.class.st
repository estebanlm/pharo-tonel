"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
Instance holds onto a string and matches exactly this string, and exactly once.

Instance variables:
	string 	<String>
"
Class {
	#name : #RxmSubstring,
	#superclass : #RxmLink,
	#instVars : [
		'sample',
		'compare'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>beCaseInsensitive [

	compare := [:char1 :char2 | char1 sameAs: char2]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>beCaseSensitive [

	compare := [:char1 :char2 | char1 = char2]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>character: aCharacter ignoreCase: aBoolean [
	"Match exactly this character."

	sample := String with: aCharacter.
	aBoolean ifTrue: [self beCaseInsensitive]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>initialize [
	super initialize.
	self beCaseSensitive
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>matchAgainst: aMatcher [
	"Match if my sample stream is exactly the current prefix
	of the matcher stream's contents."

	| originalState sampleStream mismatch |
	originalState := aMatcher currentState.
	sampleStream := self sampleStream.
	mismatch := false.
	[sampleStream atEnd
		or: [aMatcher atEnd
		or: [mismatch := (compare value: sampleStream next value: aMatcher next) not]]] whileFalse.
	(mismatch not and: [sampleStream atEnd and: [next matchAgainst: aMatcher]])
		ifTrue: [^true]
		ifFalse: 
			[aMatcher restoreState: originalState.
			^false]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>sampleStream [

	^sample readStream
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSubstring>>substring: aString ignoreCase: aBoolean [
	"Match exactly this string."

	sample := aString.
	aBoolean ifTrue: [self beCaseInsensitive]
]
