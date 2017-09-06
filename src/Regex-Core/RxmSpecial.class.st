"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
A special node that matches a specific matcher state rather than any input character.
The state is either at-beginning-of-line or at-end-of-line.
"
Class {
	#name : #RxmSpecial,
	#superclass : #RxmLink,
	#instVars : [
		'matchSelector'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beBeginningOfLine [

	matchSelector := #atBeginningOfLine
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beBeginningOfWord [

	matchSelector := #atBeginningOfWord
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beEndOfLine [

	matchSelector := #atEndOfLine
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beEndOfWord [

	matchSelector := #atEndOfWord
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beNotWordBoundary [

	matchSelector := #notAtWordBoundary
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>beWordBoundary [

	matchSelector := #atWordBoundary
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmSpecial>>matchAgainst: aMatcher [
	"Match without consuming any input, if the matcher is
	in appropriate state."

	^(aMatcher perform: matchSelector)
		and: [next matchAgainst: aMatcher]
]
