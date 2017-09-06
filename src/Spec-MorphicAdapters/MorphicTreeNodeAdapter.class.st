"
I am the bridget between a TreeNodeModel and a SpecTreeNodeModel
"
Class {
	#name : #MorphicTreeNodeAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>buildWidget [
	^ SpecTreeNodeModel new
		setItemFromBlock: self itemBlock;
		icon: self icon;
		setChildren: self childrenBlock;
		hasContents: self hasChildrenBlock;
		model: self container;
		nodeModel: self model
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>childrenBlock [
	^ [ self model buildChildren ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>container [
	^ self model container
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>deselect [

	self widgetDo: [ :w |
		w changed: #deselect.
		w model selectionChanged.
		w dependents do: [ :e | e changed ] ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>hasChildrenBlock [
	^ self model hasChildren
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>hasContentToShow [
	^ self model hasContentToShow
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>icon [
	^ self model icon
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>isExpanded: aBoolean [

	
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>item [
	^ self model content
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>itemBlock [
	^ [ self item ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>select [

	self widgetDo: [ :w |
		w changed: #select.
		w model selectionChanged.
		w dependents do: [ :e | e changed ] ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>selected [
	^ self model selected
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>selected: aBoolean [

	aBoolean 
		ifTrue: [ self select ]
		ifFalse: [ self deselect ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>takeHighlight [

	self widgetDo: [ :w | w changed: #takeHighlight ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeNodeAdapter>>updateAccordingTo: aFilter [

	self widgetDo: [ :w |
		w contents do: [ :n | n nodeModel updateAccordingTo: aFilter ].
		w contents removeAllSuchThat: [ :n | (aFilter keepTreeNode: n nodeModel) not  and: [ n nodeModel isEmpty ] ] ]
]
