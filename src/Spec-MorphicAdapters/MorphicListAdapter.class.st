"
I am the adapter used to bridge a ListModel and a PluggableListMorph
"
Class {
	#name : #MorphicListAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>acceptDroppingMorph: draggedMorph event: event inMorph: source [
	| item index |
	
	index := source rowAtLocation: event position.
	item := self model getList at: index ifAbsent: [ nil ].
	
	^ self acceptDropBlock valueWithEnoughArguments: { draggedMorph model model . event. source model model. item. index }
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>autoDeselect [

	^ self model autoDeselect
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>autoDeselect: aBoolean [

	self widgetDo: [ :w | w autoDeselect: aBoolean ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>backgroundColorFor: anItem [

	^ self model backgroundColorFor: anItem
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>backgroundColorFor: anItem at: index [

	^ self model backgroundColorFor: anItem at: index
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>buildWidget [

	^ PluggableListMorph new
		model: self;
		getListSizeSelector: #listSize;
		autoDeselect: self autoDeselect;
		getIndexSelector: #getIndex;
		setIndexSelector: #setIndex:;
		getSelectionListSelector: #getSelectionStateFor:;
		setSelectionListSelector: #setSelectionStateFor:at:;
		backgroundColoringBlockOrSelector: #backgroundColorFor:at: ;
		getListElementSelector: #listElementAt: ;
		resetListSelector: #resetListSelection;
		getMenuSelector: #menu:shifted: ;
		setMultipleSelection: self multiSelection;
		wrapSelector: #wrapItem:index: ;
		setBalloonText: self help;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;	
		hResizing: #spaceFill;
		vResizing: #spaceFill
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>getIndex [

	^ self model getIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>getSelectionStateFor: anIndex [

	^ self model getSelectionStateFor: anIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>listElementAt: anIndex [

	^ self model listElementAt: anIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>listElementAt: anIndex ifAbsent: aBlock [

	^ self model listElementAt: anIndex ifAbsent: aBlock
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>listSize [

	^ self model listSize
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>menu: aMenu shifted: aBoolean [

	^ (self model menu: aMenu shifted: aBoolean) 
		
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>multiSelection [

	^ self model multiSelection
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>resetListSelection [

	^ self model resetListSelection
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>setIndex: anIndex [

	^ self model setIndex: anIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>setSelectionStateFor: anIndex at: aBoolean [

	^ self model setSelectionStateFor: anIndex at: aBoolean
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicListAdapter>>wrapItem: anObject index: index [

	^ self model wrapItem: anObject index: index
]
