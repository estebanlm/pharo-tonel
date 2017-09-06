"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
This is a branch of a matching process. Either `next' chain should match, or `alternative', if not nil, should match. Since this is also used to build loopbacks to match repetitions, `loopback' variable indicates whether the instance is a loopback: it affects the matcher-building operations (which of the paths through the branch is to consider as the primary when we have to find the ""tail"" of a matcher construct).

Instance variables
	alternative		<RxmLink> to match if `next' fails to match.
	loopback		<Boolean>
"
Class {
	#name : #RxmBranch,
	#superclass : #RxmLink,
	#instVars : [
		'loopback',
		'alternative'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>alternative: aBranch [
	"See class comment for instance variable description."

	alternative := aBranch
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>beLoopback [
	"See class comment for instance variable description."

	loopback := true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>initialize [
	"See class comment for instance variable description."

	super initialize.
	loopback := false
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>matchAgainst: aMatcher [
	"Match either `next' or `alternative'. Fail if the alternative is nil."

	^(next matchAgainst: aMatcher)
		or: [alternative notNil
			and: [alternative matchAgainst: aMatcher]]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>pointTailTo: aNode [
	"See superclass for explanations."

	loopback
		ifTrue: [
			alternative == nil
				ifTrue: [alternative := aNode]
				ifFalse: [alternative pointTailTo: aNode]]
		ifFalse: [super pointTailTo: aNode]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxmBranch>>terminateWith: aNode [
	"See superclass for explanations."

	loopback
		ifTrue: [alternative == nil
			ifTrue: [alternative := aNode]
			ifFalse: [alternative terminateWith: aNode]]
		ifFalse: [super terminateWith: aNode]
]
