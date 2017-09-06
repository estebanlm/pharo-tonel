"
I am a UI for test failures which have been serialized as fuel files. You can:
* materialize the failed test process to debug
* browse the test method.

self open. 
"
Class {
	#name : #TestReviver,
	#superclass : #ComposableModel,
	#instVars : [
		'errorListModel',
		'debugButton',
		'browseButton',
		'vmVersionLabel',
		'vmVersion',
		'timeStamp',
		'timeStampLabel',
		'imageVersion',
		'imageVersionLabel'
	],
	#category : #SUnit-UI,
	#timestamp : '<historical>'
}

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver class>>open [
	<script>
	
	|model|
	model := self new.
	model openWithSpec model: model.
	^model
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver class>>spec [
	<spec: #default>

	^ SpecLayout composed
		newColumn: [:c |
			c 
				newRow: [ :spec | spec
					add: #debugButton;
					add: #browseButton ] height: 30;
				newRow: [ :spec | spec add:  #errorListModel ];
				newRow: [ :spec | spec
						add: #timeStampLabel width: 100;
						add: #timeStamp ] height: 30;
				newRow: [ :spec | spec
						add: #imageVersionLabel width: 100;
						add: #imageVersion ] height: 30;
				newRow: [ :spec | spec
						add: #vmVersionLabel width: 100;
						add: #vmVersion ] height: 75];
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver class>>title [

	^ 'Test Error Browser'.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>browse: anAbstractFileReference [

	| tokens testClass |
	anAbstractFileReference ifNil: [ ^self ].
	tokens := anAbstractFileReference base findTokens: '-'.
	testClass := Smalltalk at: tokens first asSymbol.
	Smalltalk tools browser openOnClass: testClass selector: tokens second asSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>browseButton [

	^ browseButton.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>debugButton [

	^ debugButton.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>errorListModel [

	^ errorListModel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>imageVersion [
	^ imageVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>imageVersionLabel [
	^ imageVersionLabel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>initialExtent [

	^ 700@500.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>initializePresenter [

	errorListModel whenSelectedItemChanged: [ :item | | header |
		item 
			ifNil: [ 
				vmVersion text: ''.
				imageVersion text: ''.
				timeStamp text: ''.
				]	
			ifNotNil: [
				header := FLMaterializer materializeHeaderFromFileNamed: item.
				vmVersion text: (header additionalObjectAt: #VM).
				imageVersion text: (header additionalObjectAt: #Image).
				timeStamp text: (header additionalObjectAt: #Timestamp)
				] 
	]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>initializeWidgets [
	| serializedErrors |
	self instantiateWidgets.
	serializedErrors := self selectTestFailures.
	errorListModel
		items: serializedErrors;
		displayBlock: [ :e | e base copyReplaceAll: '-' with: '>>#' ].
	serializedErrors isEmpty
		ifFalse: [ errorListModel setSelectedIndex: 1 ].
	vmVersionLabel label: 'VM Version'.
	vmVersion
		text: '';
		enabled: false.
	timeStampLabel label: 'Timestamp'.
	timeStamp
		text: '';
		enabled: false.
	imageVersionLabel label: 'Image Version'.
	imageVersion
		text: '';
		enabled: false.
	debugButton
		label: 'Debug';
		action: [ self materialize: errorListModel selectedItem ].
	browseButton
		label: 'Browse';
		action: [ self browse: errorListModel selectedItem ].
	self focusOrder
		add: debugButton;
		add: browseButton;
		add: errorListModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>instantiateWidgets [
	errorListModel := self newList.
	debugButton := self newButton.
	browseButton := self newButton.
	vmVersionLabel := self newLabel.
	vmVersion := self newText.
	timeStampLabel := self newLabel.
	timeStamp := self newText.
	imageVersionLabel := self newLabel.
	imageVersion := self newText
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>materialize: fuelFileReference [
	fuelFileReference ifNil: [ ^self ].
	FLMaterializer materializeFromFileNamed: fuelFileReference fullName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>selectTestFailures	 [
	| files results tokens method | 
	results := OrderedCollection new.
	files := FileLocator imageDirectory filesMatching: '*.fuel'.
	files do: [:aFile |
		tokens := aFile resolve base findTokens: '-'.	
		method := (Smalltalk globals at: tokens first asSymbol ) lookupSelector:  tokens second asSymbol.
		method pragmas isEmpty
			ifTrue: [ results add: aFile ]
			ifFalse:  [
				(method pragmas first keyword = #expectedFailure) 
					ifFalse: [ results add: aFile ].
				 ]
	].
	^ results
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>timeStamp [
	^ timeStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>timeStampLabel [
	^ timeStampLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>vmVersion [

	^ vmVersion.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestReviver>>vmVersionLabel [

	^ vmVersionLabel.
]
