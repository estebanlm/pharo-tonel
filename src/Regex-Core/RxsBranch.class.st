"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
A Branch is a Piece followed by a Branch or an empty string.

Instance variables:
	piece		<RxsPiece>
	branch		<RxsBranch|RxsEpsilon>
"
Class {
	#name : #RxsBranch,
	#superclass : #RxsNode,
	#instVars : [
		'piece',
		'branch'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>branch [

	^branch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>dispatchTo: aMatcher [
	"Inform the matcher of the kind of the node, and it
	will do whatever it has to."

	^aMatcher syntaxBranch: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>initializePiece: aPiece branch: aBranch [
	"See class comment for instance variables description."

	piece := aPiece.
	branch := aBranch
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>isNullable [

	^piece isNullable and: [branch isNil or: [branch isNullable]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>piece [

	^piece
]

{
	#category : #optimization,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsBranch>>tryMergingInto: aStream [
	"Concatenation of a few simple characters can be optimized
	to be a plain substring match. Answer the node to resume
	syntax tree traversal at. Epsilon node used to terminate the branch
	will implement this to answer nil, thus indicating that the branch
	has ended."

	piece isAtomic ifFalse: [^self].
	aStream nextPut: piece character.
	^branch isNil
		ifTrue: [branch]
		ifFalse: [branch tryMergingInto: aStream]
]
