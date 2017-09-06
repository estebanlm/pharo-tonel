"
A VersionListModel is a list model used to display package versions.
It is needed to be able to override the okToChange method to be able to ask the user before he loose changes made on the selected version.

"
Class {
	#name : #VersionListModel,
	#superclass : #IconListModel,
	#instVars : [
		'okToChange',
		'changedBlock',
		'selectionVersionString'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : 'ChristopheDemarey 3/18/2014 17:31'
}

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>askConfirmationIfChanges [
	^ self confirm: 'There are changes made to this version.
You will loose changes.
Ok to continue?'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>changedBlock: anObject [
	changedBlock := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>developmentVersionString [
	^ (self listItems 
		detect: [ :item | item isDevelopment ]) versionString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>initialize [
	super initialize.
	okToChange := true.
	selectionHolder 
		whenChangedDo: [ selectionVersionString := (self listElementAt: self selectedIndex)
															ifNil: [ nil ]
															ifNotNil: [ :item | item versionString] ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>items: aList [
	self updateSelectionVersionString.
	super items: aList.
	self updateSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>okToChange [

"	okToChange ifTrue: [ ^ true ]."
	changedBlock value ifFalse: [ ^true ].
	okToChange := self askConfirmationIfChanges.
	^ okToChange
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>okToChange: aBoolean [
	okToChange := aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>selectDevelopment [
	selectionVersionString := self developmentVersionString.
	self updateSelection
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>updateSelection [
	selectionVersionString ifNil: [ ^self ].
	self listItems 
		detect: [ :item | item versionString = selectionVersionString ]
		ifFound: [ :item | | index |
				 index := self listItems identityIndexOf: item.
				selectionHolder index value: index.
				selectionHolder selection value: item ]
		ifNone: [ self resetSelection ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionListModel>>updateSelectionVersionString [
	| selectedItem |
	
	selectedItem := selectionHolder selection value.
	selectionVersionString := selectedItem 
									ifNil: [ nil ]
									ifNotNil: [ selectedItem versionString ].
	selectionVersionString ifNil: [ ^self ]
]
