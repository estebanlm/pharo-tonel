"
A type of PluggableListMorph that supports morphs for items. Useful for lists with icons etc.
"
Class {
	#name : #PluggableMorphListMorph,
	#superclass : #PluggableListMorph,
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : 'gvc 5/18/2007 12:30'
}

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableMorphListMorph>>extent: newExtent [
	"Change listMorph's bounds to the new width. It is either the size
	of the widest list item, or the size of self, whatever is bigger"

	super extent: newExtent.
	self listMorph width: (self innerBounds width max: listMorph hUnadjustedScrollRange). 

]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableMorphListMorph>>getList [
	"Answer the list to be displayed.  Caches the returned list in the 'list' ivar"

	getListSelector isNil ifTrue: [^#()].
	list := model perform: getListSelector.
	list isNil ifTrue: [^ #()].
	^list
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableMorphListMorph>>hExtraScrollRange [
	"Return the amount of extra blank space to include to the right of the scroll content."

	^12
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableMorphListMorph>>listMorphClass [
	"Answer the class to use for the list morph."

	^LazyMorphListMorph
]
