"
A KMDescription is a window showing the description of shortcuts for a specified set of symbols reprensenting KMCategories
"
Class {
	#name : #KMDescription,
	#superclass : #ComposableModel,
	#instVars : [
		'shortcutList',
		'collectingBlock',
		'categories',
		'orderingList',
		'sortingBlock',
		'updatingBlock',
		'okToolbar',
		'categoryList'
	],
	#category : #Keymapping-Tools-Spec,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [:c | 
			c 
				newRow: [:r | 
					r 
						add: #categoryList;
						add: #orderingList ] height: 25;
				add: #shortcutList;
				add: #okToolbar height: 25 ]
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription class>>example [

	| d |
	d := KMDescription new.
	d categories: #(GlobalShortcuts MonticelloShortcuts TextEditor).
	d openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription class>>title [

	^ 'Shortcuts description'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>categories [
	
	^ categories
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>categories: aCollectionOfSymbols [
	| cats |
	
	cats := aCollectionOfSymbols collect: [:e | KMRepository default categoryForName: e].
	categories value: cats.
	self updateShortcutList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>categoryList [
	
	^ categoryList
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>collectDescriptionShortcut [
	collectingBlock := [ :e | {(e description asString) . ':' . (e shortcut asString)} ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>collectShortcutDescription [
	collectingBlock := [:e | {e shortcut asString. ':'. e description asString} ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>initCategoryList: aCollection [
	categoryList emptyList.
	aCollection do: [ :cat | categoryList addItemLabeled: cat name do: [ self updateShortcutList ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>initialExtent [

	^  (600@350)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>initialize [

	categories := nil asValueHolder.
	sortingBlock := [:a :b | a first < b first ].
	super initialize.
      self collectShortcutDescription

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>initializePresenter [
		
	categories whenChangedDo: [:col | self initCategoryList:col ].
	okToolbar okAction: [ self delete ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>initializeWidgets [

	categoryList := self newDropList.
	shortcutList := self newMultiColumnList.
	okToolbar := self instantiate: OkToolbar.
	orderingList := self newDropList.
	
	orderingList 
		addItemLabeled:'shortcut	:	description' 
			do: [self collectShortcutDescription.
				 self updateShortcutList];
		addItemLabeled:'description	:	shortcut' 
			do: [self collectDescriptionShortcut.
				 self updateShortcutList].
	
	shortcutList 
		displayBlock: [ :e | e ];
		allowToSelect: false.

	okToolbar okButton
			label: 'Close';
			state: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>okToolbar [
	
	^ okToolbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>orderingList [
	
	^ orderingList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>shortcutList [
	
	^ shortcutList
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMDescription>>updateShortcutList [
	| cat items |
	cat := categories value at: self categoryList selectedIndex.
	items := (cat entriesAt: #all) keymaps collect: [ :e | collectingBlock value: e ].
	shortcutList items: (items sorted: sortingBlock)
]
