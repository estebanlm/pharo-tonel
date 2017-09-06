"
I am the adapter used to bridget a DropListModel and a DropListMorph
"
Class {
	#name : #MorphicDropListAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>buildWidget [

	^ SpecDropListMorph new
		wrapSelector:	 #wrap:withIndex:; 
	    	on: self list: #getList selected: #getIndex changeSelected: #setIndex:;
		hResizing: #spaceFill ;
		vResizing: #spaceFill ;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;	
		setBalloonText: self help;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>getIconFor: anItem [

	^ self model iconHolder cull: anItem model cull: anItem
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>getIndex [

	^ self model getIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>getList [

	^ self model getList
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>setIndex: anIndex [
	^ self model setIndex: anIndex
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDropListAdapter>>wrapItem: anItem index: anIndex [
	| result |
	result := self model displayForItem: anItem.	
	^ result asString
]
