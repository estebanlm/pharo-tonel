"
A ListSelectionModel is a basic example to show multi selection on lists

self example
"
Class {
	#name : #ListSelectionModel,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'textModel1',
		'textModel2',
		'textRefreshingProcess'
	],
	#category : #Spec-Examples,
	#timestamp : 'Spirita 7/26/2016 15:03'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel class>>bottomSpec [

	^ SpecLayout composed
		newRow: [ :row |
			row
				add: #textModel1;
				add: #textModel2 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel class>>defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column 
				add: #listModel;
				newRow: [ :row |
					row
						add: #textModel1;
						add: #textModel2 ] ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel class>>example [
	^ self new openWithSpec
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>initializePresenter  [

	listModel whenSelectionChanged: [ self updateText ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>initializeWidgets [
	listModel := self newList.
	textModel1 := self newText.
	textModel2 := self newCode.
	listModel beMultipleSelection.
	listModel items: Smalltalk globals allClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>listModel [

	^ listModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>textModel1 [

	^ textModel1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>textModel2 [

	^ textModel2
]

{
	#category : #update,
	#timestamp : ' 8/31/2017 05:26:25'
}
ListSelectionModel>>updateText [
	"update the displayed list in a separate thread to avoid UI blocking"
	
	"if there is already a background thread running for the new list discard it"
	textRefreshingProcess ifNotNil: [
		textRefreshingProcess terminate].
	
	"fork off a possibly costly list calculation"
	textRefreshingProcess := [
		| indexes items |
		indexes := listModel selectedIndexes sort collect: [:i | i printString ].
		indexes :=  (indexes joinUsing: '; ').
		items := listModel selectedItems collect: [:i | i printString ].
		items := (items sort joinUsing: '; ').
		UIManager default defer: [
			textModel1 text: indexes.
			textModel2 text: items]] fork.
]
