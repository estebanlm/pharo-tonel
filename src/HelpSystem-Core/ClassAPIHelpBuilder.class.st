"
A builder to build the API Help for a class

Instance Variables
	addMethods:		<Boolean>
	addSubclasses:		<Boolean>
	subclassesAsSeparateTopic:		<Boolean>

addMethods
	- When true the builder will include method help

addSubclasses
	- When true the builder will recursively go through and add subclasses

subclassesAsSeparateTopic
	- xxxxx

"
Class {
	#name : #ClassAPIHelpBuilder,
	#superclass : #HelpBuilder,
	#instVars : [
		'addSubclasses',
		'addMethods',
		'subclassesAsSeparateTopic',
		'addMethodsWithoutComment'
	],
	#category : #HelpSystem-Core-Builders,
	#timestamp : 'tbn 4/30/2010 15:37'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder class>>buildHierarchicalHelpTopicFrom: aClass withSubclasses: aBoolean withMethods: anotherBoolean [
	"Start building from the given class"
	
	^(self new)
		addSubclasses: aBoolean;
		addMethods: anotherBoolean;
		rootToBuildFrom: aClass;
		build;
		topicToBuild 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addMethods [
	^ addMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addMethods: anObject [
	addMethods := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addMethodsWithoutComment [
	^ addMethodsWithoutComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addMethodsWithoutComment: anObject [
	addMethodsWithoutComment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addSubclasses [
	^ addSubclasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>addSubclasses: anObject [
	addSubclasses := anObject
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>build [
	topicToBuild := HelpTopic named: rootToBuildFrom name.
	topicToBuild iconName: #pageIcon.
	topicToBuild contents: rootToBuildFrom comment.
	addMethods
		ifTrue: [ self buildSubnodesForMethods ].
	addSubclasses
		ifTrue: [ self buildSubnodesForSubclasses ]
]

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>buildMethodTopicsOn: topic for: aClass [
	|stream methodComment|
	stream := String new writeStream.
	aClass selectors asSortedCollection do: [:selector | 
		methodComment := (aClass>>selector) comment.
		addMethodsWithoutComment | methodComment notNil ifTrue: [ 
			stream 
				nextPutAll: aClass name;
				nextPutAll: '>>';
				nextPutAll: selector asString;
				cr.		

		methodComment ifNil: [ methodComment := 'Method has no comment.' ].
		stream nextPutAll: methodComment;cr;cr ] ].
	
	topic contents: stream contents.
	
	
]

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>buildSubclassTopicFor: aSubclass [
	 
	^(self class new) 
			rootToBuildFrom: aSubclass;
			addSubclasses: addSubclasses;
			addMethods: addMethods;
			subclassesAsSeparateTopic: subclassesAsSeparateTopic;
			build;
			topicToBuild 
	 
]

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>buildSubnodesForMethods [
	| instanceSide classSide |
	instanceSide := HelpTopic named: 'Instance side'.
	classSide := HelpTopic named: 'Class side'.
	topicToBuild iconName: #bookIcon.
	topicToBuild
		addSubtopic: instanceSide;
		addSubtopic: classSide.
	self buildMethodTopicsOn: instanceSide for: rootToBuildFrom.
	self buildMethodTopicsOn: classSide for: rootToBuildFrom class
]

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>buildSubnodesForSubclasses [
	| topic |
	rootToBuildFrom subclasses isEmpty
		ifTrue: [ ^ self ].
	topicToBuild iconName: #bookIcon.
	topic := subclassesAsSeparateTopic
		ifTrue: [ topicToBuild addSubtopic: (HelpTopic named: 'Subclasses') ]
		ifFalse: [ topicToBuild ].
	rootToBuildFrom subclasses
		do:
			[ :subclass | topic addSubtopic: (self buildSubclassTopicFor: subclass) ].
	topic sortSubtopicsByTitle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>initialize [
	"Initializes the receiver"
	
	super initialize.
	addSubclasses := false.
	addMethods := true.
	subclassesAsSeparateTopic := true.
	addMethodsWithoutComment := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>subclassesAsSeparateTopic [
	^ subclassesAsSeparateTopic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
ClassAPIHelpBuilder>>subclassesAsSeparateTopic: anObject [
	subclassesAsSeparateTopic := anObject
]
