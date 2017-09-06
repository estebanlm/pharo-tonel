"
This is the abstract class for a presentation that is supposed to show a list of elements. Thus, the displayValue should be a list.

Instance Variables:
	tagsBlock	<Object>
	searchBlock	<MocketryProxy | Object | SMProxy>
	filterBlock	<MocketryProxy | Object | SMProxy>
	amountToShowBlock	<Object>
	allowsMultipleSelection	<Boolean>
	tagsFilterBlock	<MocketryProxy | Object | SMProxy>
	allowsDeselection	<Boolean>
	tagsStyle	<String>
	helpMessage	<String>
"
Class {
	#name : #GLMListingPresentation,
	#superclass : #GLMFormatedPresentation,
	#instVars : [
		'searchBlock',
		'filterBlock',
		'amountToShowBlock',
		'allowsMultipleSelection',
		'allowsDeselection',
		'tagsStyle',
		'helpMessage',
		'sortBlock',
		'textBackgroundColor',
		'dropOnItemBlock',
		'allowDropOnItemBlock',
		'allowItemDragBlock',
		'transformDraggedItemBlock',
		'allowsRecursiveSearch'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'TudorGirba 2/4/2011 20:41'
}

{
	#category : #'accessing values',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>accept: passengerObject droppedOnItem: anItem [
	self dropOnItemBlock glamourValue: (GLMMultiValue with: passengerObject with: anItem with: self).
	^ true
]

{
	#category : #'accessing values',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allow: passengerObject droppedOnItem: anItem [
	^ self allowDropOnItemBlock glamourValue: (GLMMultiValue with: passengerObject with: anItem with: self)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowDeselection [
	self allowsDeselection: true
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowDropOnItem: aBlock [
	allowDropOnItemBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowDropOnItemBlock [
	^ allowDropOnItemBlock ifNil: [ allowDropOnItemBlock := [ false ] ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowItemDrag: aBlock [
	allowItemDragBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowItemDragBlock [
	^ allowItemDragBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsDeselection [
	^ allowsDeselection ifNil: [allowsDeselection := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsDeselection: anObject [
	allowsDeselection := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsFilter [
	^ filterBlock notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsInput [
	^ self allowsFilter or: [ self allowsSearch ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsItemDrag [
	^ self allowItemDragBlock notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsRecursiveSearch [
	^ allowsRecursiveSearch ifNil: [allowsRecursiveSearch := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsRecursiveSearch: aBoolean [
	allowsRecursiveSearch := aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>allowsSearch [
	^ searchBlock notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>amountToShow [
	^ (amountToShowBlock ifNil: [ [ self defaultAmountToShow ] ]) glamourValue: self entity
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>beMultiple [
	allowsMultipleSelection := true
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>beSingle [
	allowsMultipleSelection := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>childrenValueOf: anObject [
	self flag: 'this is rather hackish, but needed to treat list and tree in the same way.'.
	^ OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>childrenValueOf: anObject atLevel: anInteger [
	self flag: 'this is rather hackish, but needed to treat list and tree in the same way.'.
	^ OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>columns [
	self flag: 'this is rather hackish, but needed to treat list and tree in the same way.'.
	^ OrderedCollection new
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>computeTagsFilterFor: aGlamourValue  [
	self subclassResponsibility 
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>computeTagsFor: aGlamourValue  [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>defaultAmountToShow [
	^ 500
]

{
	#category : #'accessing values',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>displayValue [
	^ sortBlock 
		ifNil: [super displayValue]
		ifNotNil: [super displayValue sorted: sortBlock]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>dropOnItem: aBlock [
	dropOnItemBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>dropOnItemBlock [
	^ dropOnItemBlock 
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>filterOn: aBlock  [
	filterBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>filterStrategy [
	^filterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>grayRoundedTags [

	tagsStyle := #grayRoundedButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>helpMessage [

	^ helpMessage ifNil: [
		helpMessage := 'Search Input'
		]

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>helpMessage: aString [

	helpMessage := aString.

	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>isDragSource  [
	^ self dropOnItemBlock notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>isDropTarget [
	^ self dropOnItemBlock notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>isMultiple [
	^ allowsMultipleSelection ifNil: [ allowsMultipleSelection := false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>isSingle  [
	^ self isMultiple not
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>searchOn: aBlock [
	searchBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>searchStrategy [
	^ searchBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>selectionPath [
	^ (self pane port: #selectionPath) value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>selectionPath: anObject [
	(self pane port: #selectionPath) value: anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>showOnly: aBlock [
	amountToShowBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>sortBlock [
	^ sortBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>sortBlock: anObject [
	sortBlock := anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>sorted [
	sortBlock := [:a :b | a < b]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>sorted: aBlock [
	sortBlock := aBlock  
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>tagsFor: anObject fromProvider: aTagProvider to: operation [
	| glamourValue |
	
	glamourValue := (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue).
	^ operation == #show 
		ifTrue: [ aTagProvider computeTagsFor: glamourValue ] 
		ifFalse: [ aTagProvider computeTagsFilterFor: glamourValue ]
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>tagsFor: anObject to: operation [
	
	^ self 
		tagsFor: anObject 
		fromProvider: self 
		to: operation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>tagsStyle [

	^tagsStyle ifNil:[ self grayRoundedTags. tagsStyle ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>textBackgroundColor [

	^ textBackgroundColor ifNil: [textBackgroundColor := Color transparent]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>textBackgroundColor:  aBlockOrAColor [

	textBackgroundColor := aBlockOrAColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>textBackgroundColorFor: anObject [
	^ self textBackgroundColor glamourValue: (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>transformDraggedItem: aBlock [
	transformDraggedItemBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>transformDraggedItemBlock [
	^ transformDraggedItemBlock
]

{
	#category : #'accessing values',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>transformedDraggedItem: anItem [
	^ self transformDraggedItemBlock 
		ifNotNil: [ :transform | transform glamourValue: (GLMMultiValue with: anItem with: self)]
		ifNil: [ anItem ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>whiteRectangledTags [

	tagsStyle := #whiteRectangledButton
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListingPresentation>>withSmalltalkSearch [
	self
		searchOn: [:text :each | 
			Smalltalk compiler evaluate: ' | entity each | each := self. entity := each.', text for: each logged: false];
		helpMessage: 'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'
]
