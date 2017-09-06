"
A HelpTopic provides content information that can be used as a help to the user.
It can be labeled with a title, identified using an (optional) unique key and marked 
with an (optional) icon.

Help topics form a hierarchy since any topic is able to have zero or more
subtopics. 


Instance Variables
	contents:		<Object>      The help topic contents
	icon:			<Form|nil>	   An optional icon for the topic
	key:			<String|nil>    An optional unique key
	subtopics:	      <Collection>  A collection of subtopics
	title:			<String>        The title

contents
	- The help topic contents - typically containing the help topics information

icon
	- An optional icon for the topic

key
	- An optional unique key which can be used to identify the topic. 

subtopics
	- A collection of subtopics. 
	  By default the subtopics are not sorted, so the insertion order is used. 
	  If necessary it is possible to sort the subtopics by title.

title
	- A meaninful title for the help topic

"
Class {
	#name : #HelpTopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'key',
		'icon',
		'contents',
		'subtopics',
		'owner'
	],
	#category : #HelpSystem-Core-Model,
	#timestamp : 'tbn 3/29/2010 14:53'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic class>>named: aString [
	"Create a new instance with given title and empty contents"
	
	^(self new)
		title: aString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic class>>title: aTitle contents: aText [
	"Create a new instance with given title and content"
	
	^(self new)
		title: aTitle;
		contents: aText;
		yourself.
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic class>>title: aTitle icon: anIcon contents: aText [
	"Create a new instance with given title, icon and content"
	
	^(self new)
		title: aTitle;
		icon: anIcon;
		contents: aText;
		yourself.
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic class>>title: aTitle iconName: anIconName contents: aText [
	"Create a new instance with given title, icon and content"
	
	^(self new)
		title: aTitle;
		iconName: anIconName;
		contents: aText;
		yourself.
		
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>><= anotherHelpTopic [
	"Use sorting by title as the default sort order"
	
	^self title <= anotherHelpTopic title 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>addSubtopic: aTopic [
	"Adds the given topic to the receivers collection of subtopics, and set this object as owner of the subtopic"
	
	self subtopics add: aTopic.
	aTopic owner: self.
	^aTopic
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>asHelpTopic  [
	"Converts the receiver to a help topic"
	
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>contents [
	"Returns the receivers contents"
	
	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>contents: anObject [
	"Sets the receivers contents to the given object" 
		
	contents := anObject
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>defaultTitle [
	"Returns the receivers default title"
	
	^'Unnamed Topic'
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>hasSubtopics  [
	"Returns true if the receiver has subtopics, false otherwise"
	
	^self subtopics notEmpty 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>icon  [
 	"Returns the receivers icon"
	
	^icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>icon: aSymbol [
	"Sets the receivers icon"
	
	icon := aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>iconName: aSymbol [
	"Sets the receivers icon"
	
	self icon: (self iconNamed: aSymbol) 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>initialize  [
	"Initializes the receiver"
	
	super initialize.
	self title: self defaultTitle.
	self contents: ''.
	self key: '' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>key 	 [
	"Returns a unique key identifying the receiver in the help system"	
		
	^key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>key: aUniqueKey [
	"Sets a unique key identifying the receiver in the help system"	
		
	key := aUniqueKey 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>owner [
	"an ownder is a HelpTopic that uses the current HelptTopic as subtopic"
^ owner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>owner: topic [
	"an owner is a HelpTopic that uses the current HelptTopic as subtopic"
owner := topic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>pathToTopicSatisfying: aBlock [
	"I return the complete path to the first topic satifying the given block.
	The path is a collection starting with the root node and ending with the 
	node satifying the given block. If no node is found I return an empty collection."
	
	(aBlock value: self) ifTrue: [ ^ {self} ].
	
	self subtopics do: [ :aHelpTopic |
		(aHelpTopic pathToTopicSatisfying: aBlock)
			ifNotEmpty: [ :aPath |
				^ { self }, aPath ] ].
	^ #()
]

{
	#category : #operating,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>sortSubtopicsByTitle [
	"Sort the subtopics by title"
	
	subtopics := SortedCollection withAll: self subtopics  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>subtopics  [
	"Returns the receivers list of subtopics"
	
	^ subtopics ifNil: [subtopics := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>subtopics: aCollection  [
	"Sets the receivers subtopics"
	
	aCollection do: [ :topic|  topic owner: self  ].
	subtopics := aCollection.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>title [
	"Returns the receivers title"
	
	^ title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpTopic>>title: anObject [
	"Sets the receivers title"
	
	title := anObject
]
