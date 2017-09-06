"
Instance holds onto a lookead which matches but does not consume anything.

Instance variables:
	predicate		<RxmLink>
"
Class {
	#name : #RxmLookahaed,
	#superclass : #RxmLink,
	#instVars : [
		'lookahead',
		'positive'
	],
	#category : #Regex-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed class>>with: aPiece [

	^self new lookahead: aPiece
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed>>initialize [
	super initialize.
	positive := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed>>lookahead [
	^ lookahead
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed>>lookahead: anRxmLink [
	lookahead := anRxmLink
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed>>matchAgainst: aMatcher [
	"Match if the predicate block evaluates to true when given the
	current stream character as the argument."

	| original result |
	original := aMatcher currentState.
	result := lookahead matchAgainst: aMatcher.
	aMatcher restoreState: original.
	^ result not 
		and: [ next matchAgainst: aMatcher ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmLookahaed>>terminateWith: aNode [
	lookahead terminateWith: aNode.
	super terminateWith: aNode.
]
