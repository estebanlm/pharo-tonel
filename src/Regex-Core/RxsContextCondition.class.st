"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
One of a few special nodes more often representing special state of the match rather than a predicate on a character.  The ugly exception is the #any condition which *is* a predicate on a character.

Instance variables:
	kind		<Selector>
"
Class {
	#name : #RxsContextCondition,
	#superclass : #RxsNode,
	#instVars : [
		'kind'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beAny [
	"Matches anything but a newline."

	kind := #syntaxAny
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beBeginningOfLine [
	"Matches empty string at the beginning of a line."

	kind := #syntaxBeginningOfLine
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beBeginningOfWord [
	"Matches empty string at the beginning of a word."

	kind := #syntaxBeginningOfWord
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beEndOfLine [
	"Matches empty string at the end of a line."

	kind := #syntaxEndOfLine
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beEndOfWord [
	"Matches empty string at the end of a word."

	kind := #syntaxEndOfWord
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beNonWordBoundary [
	"Analog of \B."

	kind := #syntaxNonWordBoundary
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>beWordBoundary [
	"Analog of \w (alphanumeric plus _)."

	kind := #syntaxWordBoundary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>dispatchTo: aBuilder [

	^aBuilder perform: kind
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsContextCondition>>isNullable [

	^#syntaxAny ~~ kind
]
