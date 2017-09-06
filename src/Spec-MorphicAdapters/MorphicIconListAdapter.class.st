"
I am the adapter used to bridge an IconListModel and a PluggableIconListMorph
"
Class {
	#name : #MorphicIconListAdapter,
	#superclass : #MorphicListAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicIconListAdapter>>buildWidget [

	^ PluggableIconListMorph new
		    	model: self ;
			getListSizeSelector: #listSize ;
			getListElementSelector: #listElementAt: ;
			getIndexSelector: #getIndex ;
			setIndexSelector: #setIndex: ;
			getSelectionListSelector:	#getSelectionStateFor: ;
			setSelectionListSelector:	#setSelectionStateFor:at: ;
			getIconSelector: #getIconFor: ;
			resetListSelector:	#resetListSelection ; 
			getMenuSelector:	#menu:shifted: ;
			setMultipleSelection:	self multiSelection;
			wrapSelector: 	#wrapItem:index: ;
			dragEnabled:	self dragEnabled ;
			dropEnabled:	self dropEnabled ; 	
			setBalloonText: self help; 
			hResizing: 	#spaceFill;
			vResizing: 	#spaceFill;
			yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicIconListAdapter>>getIconFor: anItem [

	^ self model getIconFor: anItem
]
