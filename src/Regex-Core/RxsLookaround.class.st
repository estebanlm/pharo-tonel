"
I lookaround is used for lookaheads and lookbehinds. They are used to check if the input matches a certain subexpression without consuming any characters (e.g. not advancing the match position).

Lookarounds can be positive or negative. If they are positive the condition fails if the subexpression fails, if they are negative it is inverse.
"
Class {
	#name : #RxsLookaround,
	#superclass : #RxsNode,
	#instVars : [
		'piece',
		'positive'
	],
	#category : #Regex-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround class>>with: anRsxPiece [
	^ self new
		initializePiece: anRsxPiece
]

{
	#category : #initailize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround>>beNegative [
	positive := false
]

{
	#category : #initailize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround>>bePositive [
	positive := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround>>dispatchTo: aBuilder [
	"Inform the matcher of the kind of the node, and it
	will do whatever it has to."
	^aBuilder syntaxLookaround: self
]

{
	#category : #initailize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround>>initializePiece: anRsxPiece [
	super initialize.
	piece := anRsxPiece.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsLookaround>>piece [
	^ piece
]
