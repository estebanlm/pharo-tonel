"
A type of PluggableListMorph that supports a single icon (Form) for items. Useful for lists with icons.
"
Class {
	#name : #PluggableIconListMorph,
	#superclass : #PluggableMorphListMorph,
	#instVars : [
		'getIconSelector'
	],
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : 'gvc 5/18/2007 12:31'
}

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>basicKeyPressed: aChar  [
	
	^ aChar == Character space
		ifTrue: [ self interactWithSelectedItem ]
		ifFalse: [ super basicKeyPressed: aChar ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>getIconSelector [
	"Answer the value of getIconSelector"

	^ getIconSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>getIconSelector: anObject [
	"Set the value of getIconSelector"

	getIconSelector := anObject
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>getList [
	"Answer the list to be displayed.  Caches the returned list in the 'list' ivar"

	getListSelector isNil ifTrue: [^#()].
	list := model perform: getListSelector.
	list isNil ifTrue: [^ #()].
	list := list collectWithIndex: [ :item :index | self itemMorphFor: item index: index ].
	^list
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>getListItem: index [
	"get the index-th item in the displayed list"

	getListElementSelector ifNotNil: [
		^self itemMorphFor: (model perform: getListElementSelector with: index) index: index].
	(list notNil and: [list size >= index]) ifTrue: [ ^list at: index ].
	^ self wrapItem: (self getList at: index) index: index
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>interactWithSelectedItem [

	self selection
		ifNotNil: [: sel | sel submorphs do: [:each | each update: #interact ]]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableIconListMorph>>itemMorphFor: anObject index: anIndex [
	"Answer a morph for the object with the appropriate icon."

	|item icon|
	item := IconicListItem new
		originalObject: anObject;
		yourself.
		
	icon := self getIconSelector ifNotNil: [self model perform: self getIconSelector withEnoughArguments: {anObject. anIndex}].
	icon ifNotNil: [
		item icon: icon asMorph].
	item morph: (self wrapItem: anObject index: anIndex) asMorph.
	^item
]
