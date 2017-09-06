"
I am the adapter used to bridge an FastTableModel and a FTPluggableIconListMorphAdaptor
"
Class {
	#name : #MorphicFastTableAdapter,
	#superclass : #MorphicListAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : 'StephanEggermont 2/1/2016 10:54'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicFastTableAdapter>>buildWidget [

	^ FTPluggableIconListMorphAdaptor new
		   model: self model;
			hideColumnHeaders;
			beResizable;
			columns: self model columns;
			getListSizeSelector: #listSize ;
			getListElementSelector: #listElementAt: ;
			getIndexSelector: #getIndex ;
			setIndexSelector: #setIndex: ;
			getSelectionListSelector:	#getSelectionStateFor: ;
			setSelectionListSelector:	#setSelectionStateFor:at: ;
			getIconSelector: #getIconFor: ;
			resetListSelector:	#resetListSelection ; 
			getMenuSelector:	#menu:shifted: ;
			setMultipleSelection: self multiSelection;
			doubleClickSelector: #doubleClick: ;
			basicWrapSelector: #wrapItem: ;
			dragEnabled:	self dragEnabled ;
			dropEnabled:	self dropEnabled ; 	
			setBalloonText: self help; 
			hResizing: 	#spaceFill;
			vResizing: 	#spaceFill;
			selectRowIndex: 1;
			enableFilter: FTSubstringFilter;			
			explicitFunction;
			yourself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicFastTableAdapter>>doubleClick: event [

	^ self model doubleClick: event
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicFastTableAdapter>>getIconFor: anItem [

	^ self model getIconFor: anItem
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicFastTableAdapter>>wrapItem: anObject [

	^ self model wrapItem: anObject
]
