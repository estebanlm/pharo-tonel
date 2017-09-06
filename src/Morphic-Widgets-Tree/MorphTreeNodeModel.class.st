"
I wrap an item to be displayed in a TreeMorph, so I can answer content and representation in a polymorphic way. 

My hierarchy usually follows TreeMorphModel one.
"
Class {
	#name : #MorphTreeNodeModel,
	#superclass : #ListItemWrapper,
	#instVars : [
		'parentNode'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : '<historical>'
}

{
	#category : #dependents,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>addDependent: aDependent [
	"Ensure to only have one dependent at every moment"
	
	dependents := #().
	super addDependent: aDependent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>childNodeClassFromItem: anItem [
	^ self class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>childNodeFromItem: anItem [
	^ ((self childNodeClassFromItem: anItem) with: anItem model: model) parentNode: self; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>childrenItems [
	^ Array new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>color [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>contents [
	^ self childrenItems collect: [:ci | self childNodeFromItem: ci ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>enabled [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>hasContentToShow [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>helpText [
	^ model helpText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>includesSubstringAnywhere: aString [
	^ (Array with: self asString) includesSubstringAnywhere: aString
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>isExpanded [

	^ false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>isExpanded: aBoolean [

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>isPartialMatch [
	| result |

	result := false.
	
	self contents do: [:each | 
		(each selected or: [ each isPartialMatch ]) ifTrue: [ result := true ] ].

	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>lastClicked: aBoolean [
	"Do nothing but introduce a hook"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>level [
	^ parentNode ifNil: [1] ifNotNil: [parentNode level + 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>model: anObject [
	model := anObject
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>mouseDown: event [
	"Do not do anything"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>name [
	^ self item name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>parentNode [
	^ parentNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>parentNode: aNode [
	parentNode := aNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>path [
	^ self pathIn: OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>pathIn: aCollection  [
	self parentNode
		ifNotNil: [(aCollection includes: self parentNode)
		ifFalse: [self parentNode pathIn: aCollection]].
	aCollection add: self.
	^ aCollection
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>printOn: aStream [
	aStream nextPutAll: 'Node('.
	self item printOn: aStream.
	aStream nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>rowMorphForColumn: aTreeColumn [
	^ self item ifNotNil: [:i | self asString asMorph] 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>selected [

	^ false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNodeModel>>selected: aBoolean [
	"Do nothing but introduce a hook"
]
