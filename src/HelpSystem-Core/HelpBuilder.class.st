"
This is an utility class that builds the books for a help system.

Instance Variables
	rootTopics:		<OrderedCollection>

rootTopics
	- a collection of books 

"
Class {
	#name : #HelpBuilder,
	#superclass : #Model,
	#instVars : [
		'topicToBuild',
		'rootToBuildFrom'
	],
	#category : #HelpSystem-Core-Builders,
	#timestamp : 'tbn 2/12/2010 14:54'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder class>>buildHelpTopicFrom: aHelpTopicDescription [
	"Start building from the given help topic description"
	
	^(self new)
		rootToBuildFrom: aHelpTopicDescription;
		build;
		topicToBuild 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder>>build [
	self subclassResponsibility 

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder>>initialize  [
	"Initializes the receiver"
	
	super initialize.
	topicToBuild := self topicClass new.
	 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder>>rootToBuildFrom: anObject [
	rootToBuildFrom := anObject
]

{
	#category : #'private accessing',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder>>topicClass [
	^HelpTopic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBuilder>>topicToBuild [
	^topicToBuild
]
