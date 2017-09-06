"
FTBasicTreeListItem holds the state of a element in FTBasicTreeListDataSource.

Instance variables: 

|< expanded >|< Private  >|< aBoolean >[ 
	remembers if this it is currently expanded or not.
}.

|< depth >|< Private  >|< aNumber >[
	The depth of this item from the root.
 ].

< item > [  anyObject. 
	The raw item which is wrapped by this class.	
].

< children > [ aCollection.
	cache for holding currently expaned children
 ].

< dataSource > [ aFBasicTreeListDataSource
	reference to the datasource
 ].
"
Class {
	#name : #FTBasicTreeListItem,
	#superclass : #Object,
	#instVars : [
		'expanded',
		'depth',
		'item',
		'children',
		'dataSource'
	],
	#category : #Morphic-Widgets-FastTable-Tree-Basic,
	#timestamp : 'HenrikNergaard 3/27/2016 14:25'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>availableRows [

	^expanded ifTrue: [ 
		children
			inject: 1 
			into: [ :sum :each | sum + each availableRows ] 
			
	] ifFalse: [ 1 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>cellMorphFor: aDataSource [

	| morph |
	
	morph := FTIndentedCellMorph new.
	morph depthIndent: depth.
	
	self hasChildren 
		ifTrue: [ morph addMorphBack: self generateButton ]
		ifFalse: [ morph addIndendtation: 15 ].
	
	dataSource displayBlock value: item value: morph.
	
	^morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>children [

	^children
]

{
	#category : #button-interaction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>collapseItem [

	dataSource updateAvailableRows: 1 - self availableRows.
	
	children := #().
	
	expanded := false.
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>collapsedButton [

	^self defaultButton
		actionSelector: #expandItem;
		labelGraphic: Smalltalk ui theme treeUnexpandedForm;
		helpText: 'Expand Item';
		yourself
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>datasource: aDS [

	dataSource := aDS
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>defaultButton [

	^IconicButton new
		target: self;
		color: Color transparent;
		borderWidth: 0;
		yourself.
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>depth: aNumber [

	depth := aNumber 
]

{
	#category : #button-interaction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>expandItem [

	expanded := true.
	
	children := (dataSource childrenFor: item) collect: [ :each | self treeItemFor: each ].
	
	dataSource updateAvailableRows: self availableRows - 1.
]

{
	#category : #interaction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>expandToDepth: aNumber [
	
	depth = aNumber ifTrue: [ ^self ].
	
	self expandItem.
	
	children do: [ :each | each expandToDepth: aNumber ].
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>expandedButton [

	^self defaultButton
		actionSelector: #collapseItem;
		labelGraphic: Smalltalk ui theme treeExpandedForm;
		helpText: 'Collapse Item';
		yourself
]

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>generateButton [
	^expanded 
		ifTrue: [ self expandedButton ]
		ifFalse: [ self collapsedButton ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>hasChildren [

	^(dataSource childrenBlock value: item) isNotEmpty
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>initialize [

	expanded := false.
	depth := 0.
	children := #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>item [

	^item
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>item: anItem [

	item := anItem
]

{
	#category : #button-interaction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListItem>>treeItemFor: anItem [

	^FTBasicTreeListItem new 
		datasource: dataSource;
		depth: depth + 1;
		item: anItem
]
