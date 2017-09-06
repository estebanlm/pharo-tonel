"
A MultiColumnListModel is a spec model for Multi columns list
"
Class {
	#name : #MultiColumnListModel,
	#superclass : #ListModel,
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MultiColumnListModel class>>adapterName [

	^ #MultiColumnListAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MultiColumnListModel class>>defaultSpec [
	<spec: #default>
	
	^ #(MultiColumnListAdapter
		adapt: #(model))
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:18'
}
MultiColumnListModel>>listElementAt: anIndex [

	^ self wrapItem: (self listItems at: anIndex) index: anIndex 
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:18'
}
MultiColumnListModel>>setIndex: anIndex [

	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	selectionHolder index value: anIndex.
	selectionHolder selection value: (self listItems at: anIndex ifAbsent: [ nil ]).
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MultiColumnListModel>>setSelectedIndex: anIndex [
	"<api: #integer min: 0 max: #listSize getter: #selectedIndex registration: #whenSelectionIndexChanged:>"
	"Set the index of the item you want to be selected"
	| idx selection |
	
	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	self listSize isZero ifTrue:  [ ^self ].
	idx := anIndex min: self listSize.
	selection := self listItems 
					at: idx 
					ifAbsent: [ idx := 0.
								nil ].
	
	selectionHolder index value: idx.
	selectionHolder selection value: selection.
]
