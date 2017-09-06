"
This class implements a list item wrapper for help topics.

Instance Variables

"
Class {
	#name : #HelpTopicListItemWrapper,
	#superclass : #PluggableListItemWrapper,
	#category : #HelpSystem-Core-UI,
	#timestamp : 'tbn 3/8/2010 09:30'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopicListItemWrapper>>asString [
	"Returns a string used as a label"
	
	^item title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopicListItemWrapper>>balloonText [
	"Returns a string used for fly by help"
	
	^self item title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopicListItemWrapper>>contents [
	"Returns subnodes (if any)"
	
 	item hasSubtopics ifFalse: [^#()].	
	^(item subtopics) collect: [ :each | 
		HelpTopicListItemWrapper with: each
	].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopicListItemWrapper>>icon [
	"Either return the icon for the given topic"

	item icon notNil
		ifTrue: [ ^ item icon ].
	^ item hasSubtopics
		ifTrue: [ self iconNamed: #bookIcon ]
		ifFalse: [ self iconNamed: #pageIcon ]
]
