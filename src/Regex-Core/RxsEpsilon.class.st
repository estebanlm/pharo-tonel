"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
This is an empty string.  It terminates some of the recursive constructs.
"
Class {
	#name : #RxsEpsilon,
	#superclass : #RxsNode,
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:14'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsEpsilon>>dispatchTo: aBuilder [
	"Inform the matcher of the kind of the node, and it
	will do whatever it has to."

	^aBuilder syntaxEpsilon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsEpsilon>>isNullable [
	"See comment in the superclass."

	^true
]
