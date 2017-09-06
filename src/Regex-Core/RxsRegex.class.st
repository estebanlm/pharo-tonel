"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
The body of a parenthesized thing, or a top-level expression, also an atom.  

Instance variables:
	branch		<RxsBranch>
	regex		<RxsRegex | RxsEpsilon>
"
Class {
	#name : #RxsRegex,
	#superclass : #RxsNode,
	#instVars : [
		'branch',
		'regex'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRegex>>branch [

	^branch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRegex>>dispatchTo: aMatcher [
	"Inform the matcher of the kind of the node, and it
	will do whatever it has to."

	^aMatcher syntaxRegex: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRegex>>initializeBranch: aBranch regex: aRegex [
	"See class comment for instance variable description."

	branch := aBranch.
	regex := aRegex
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRegex>>isNullable [

	^branch isNullable or: [regex notNil and: [regex isNullable]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsRegex>>regex [
	^regex
]
