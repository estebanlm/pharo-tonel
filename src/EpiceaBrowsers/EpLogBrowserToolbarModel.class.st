"
I am a toolbar to be used in the EpLogBrowserModel.
"
Class {
	#name : #EpLogBrowserToolbarModel,
	#superclass : #ComposableModel,
	#instVars : [
		'filtersButtonModel',
		'logBrowserModel',
		'statusLabelModel'
	],
	#category : #EpiceaBrowsers-UI-Log,
	#timestamp : 'MartinDias 4/6/2017 16:08'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel class>>spec [
	<spec: #default>

	^ SpecLayout composed newRow: [:row |
		row
			add: #statusLabelModel;
			add: #filtersButtonModel width: 150;
			yourself ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>activeFiltersString [

	^ 'Filters (', logBrowserModel filters size asString, ')'

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>beApplyMode [

	filtersButtonModel
		icon: (self iconNamed: #smallRedoIcon);
		label: 'Confirm All Changes';
		action: [ logBrowserModel applyAllChangesAndCloseWindow ].

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>beHistoryMode [

	filtersButtonModel
		icon: (self iconNamed: #smallFindIcon);
		action: [ self filtersAction ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>beRevertMode [

	filtersButtonModel
		icon: (self iconNamed: #smallUndoIcon);
		label: 'Confirm All Changes';
		action: [ logBrowserModel revertAllChangesAndCloseWindow ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>filtersAction [

	logBrowserModel filtersSubMenu openWithSpecAt: ActiveHand position

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>filtersButtonModel [

	^ filtersButtonModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>initializePresenter [
	"See be* methods"

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>initializeWidgets [

	self instantiateModels: {
		#filtersButtonModel -> #ButtonModel.
		#statusLabelModel -> #LabelModel.
		}.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>logBrowserModel [
	^ logBrowserModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>logBrowserModel: anObject [
	logBrowserModel := anObject
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>refresh [

	filtersButtonModel label: self activeFiltersString.
	statusLabelModel label: self statusString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>statusLabelModel [

	^ statusLabelModel
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserToolbarModel>>statusString [

	^ String streamContents: [:stream |
		| filtered total |
		filtered := logBrowserModel filteredEntriesCount.
		total := logBrowserModel totalEntriesCount.
		
		stream
			print: filtered;
			nextPutAll: ' events'.
	
		filtered = total ifFalse: [
			stream
				nextPutAll: ' (';
				print: total;
				nextPutAll: ' total)' ].
		]
]
