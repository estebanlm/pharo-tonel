"
SearchableList 
	new items: #( aaa abc axz bbb bfbg bof c);
	openWithSpec
	
should it be a subclass of LIstModel?
Because now I will have to delegate a lot? and I cannot plug a IconList

How do I make textModel react to every keystroke without an accept
"
Class {
	#name : #SearchableList,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'searchModel'
	],
	#category : #Spec-PolyWidgets-ListAndTree,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList class>>defaultSpec [

	^ SpecLayout composed
		newRow: #searchModel height: self toolbarHeight;
		add: #listModel top: self toolbarHeight;
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList class>>example [
	"self example"

	^ self new
		items: #(#aaa #abc #axz #bbb #bfbg #bof #c); openWithSpec
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList>>initializePresenter [

	searchModel whenTextChanged: [:newText || text |
		text :=  searchModel getText asLowercase.
		text isEmpty
			ifTrue: [ listModel resetFilteringBlock ]
			ifFalse: [
				listModel filteringBlock: [:col | col select: [:e | e asLowercase beginsWith: searchModel getText asLowercase ]]]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList>>initializeWidgets [

	listModel := self newList.
	searchModel 	:= self newTextInput.
		
	searchModel 
		autoAccept: true;
		ghostText: 'filter'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList>>items: aCollection [
	listModel items: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList>>listModel [
	^ listModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableList>>searchModel [
	^ searchModel
]
