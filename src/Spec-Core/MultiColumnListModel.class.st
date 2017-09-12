"
A MultiColumnListModel is a spec model for Multi columns list
"
Class {
	#name : #MultiColumnListModel,
	#superclass : #ListModel,
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
MultiColumnListModel class >> adapterName [

	^ #MultiColumnListAdapter
]

{ #category : #specs }
MultiColumnListModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MultiColumnListAdapter
		adapt: #(model))
]

{ #category : #morphic }
MultiColumnListModel >> listElementAt: anIndex [

	^ self wrapItem: (self listItems at: anIndex) index: anIndex 
]

{ #category : #morphic }
MultiColumnListModel >> setIndex: anIndex [

	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	selectionHolder index value: anIndex.
	selectionHolder selection value: (self listItems at: anIndex ifAbsent: [ nil ]).
]

{ #category : #api }
MultiColumnListModel >> setSelectedIndex: anIndex [
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
