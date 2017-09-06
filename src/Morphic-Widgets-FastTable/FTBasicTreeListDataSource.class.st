"
Simple tree list data source.

For example usage see methods on the class side under the protocol ""examples"". 


"
Class {
	#name : #FTBasicTreeListDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'childrenBlock',
		'displayBlock',
		'sortingBlock',
		'availableRows',
		'rootItems'
	],
	#category : #Morphic-Widgets-FastTable-Tree-Basic,
	#timestamp : 'HenrikNergaard 3/27/2016 14:25'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleBasicInspect: anObject [

	| ds ft |

	ds := FTBasicTreeListDataSource new .
	
	ds	root: #ROOT->anObject;
		children: [ :item | item value gtInspectorVariableValuePairs ];
		sortChildrenBy: [ :a :b | a key name <= b key name ];
		display: [ :item :cell | cell addMorphBack: item printString asMorph ];
		yourself.
	
	ft := FTTableMorph new 
		extent: 600@(World clearArea height - 80);
		dataSource: ds.
	
	ft openInWindow position: 20@10.
	
	^ds
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleInspect: anObject [

	| ds ft |

	ds := FTBasicTreeListDataSource new .
	
	ds	root: #ROOT->anObject;
		children: [ :item | item value gtInspectorVariableValuePairs ];
		sortChildrenBy: [ :a :b | a key name <= b key name ];
		display: [ :item :cell | cell 
			addMorphBack: item value class systemIcon asMorph;
			addMorphBack: (item key asStringMorph emphasis: 1; yourself);
			addMorphBack: (Morph new color: Color transparent; height: 1; width: 10; yourself);
			addMorphBack: item value asStringMorph ];
		yourself.
	
	ds expand: 1.
	
	ft := FTTableMorph new 
		extent: 800@(World clearArea height // 2);
		dataSource: ds.
	
	ft openInWindow position: 20@10.
	
	^ds
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleProtoObjectClassTree [

	| ds ft |

	ds := FTBasicTreeListDataSource new 
		root: ProtoObject;
		children: [ :item | item subclasses ];
		sortChildrenBy: [ :a :b | a name <= b name ];
		display: [ :item :cell | cell addMorphBack: item printString asMorph ];
		yourself.

	ft := FTTableMorph new 
		extent: 200@200;
		dataSource: ds.
	
	ft openInWindow position: 20@10
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleSomeClassesSubclassesTree [

	| ds ft |

	ds := FTBasicTreeListDataSource new 
		roots: { FTDataSource . String . Boolean } ;
		children: [ :item | item subclasses ];
		sortChildrenBy: [ :a :b | a methods size <= b methods size ];
		display: [ :item :cell | cell addMorphBack: (item name asString , ' (' , item methods size asString , ')') asMorph ];
		yourself.

	ft := FTTableMorph new 
		extent: 200@200;
		dataSource: ds.
	
	ft openInWindow position: 20@10
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleStateTree [

	| ds ft |

	ds := FTBasicTreeListDataSource new .
	
	ds	roots: { #self -> ds } ;
		children: [ :item | item value gtInspectorVariableValuePairs ];
		sortChildrenBy: [ :a :b | a key name <= b key name ];
		display: [ :item :cell | cell 
			addMorphBack: item value systemIcon asMorph;
			addMorphBack: (item key printString asMorph emphasis: 1; yourself);
			addMorphBack: (Morph new color: Color transparent; height: 1; width: 10; yourself);
			addMorphBack: (item value printString) asMorph ];
		yourself.
		
	ds expand: 3.
	
	ft := FTTableMorph new 
		extent: 600@(World clearArea height - 80);
		dataSource: ds.
	
	ft openInWindow position: 20@10
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource class>>exampleWorldSubmorphTree [

	| ds ft |

	ds := FTBasicTreeListDataSource new 
		root: World;
		children: [ :item | item submorphs ];
		expand: 2;
		display: [ :item :cell | cell addMorphBack: item printString asMorph ];
		yourself.

	ft := FTTableMorph new 
		extent: 400@(World clearArea height - 80);
		dataSource: ds.
	
	ft openInWindow position: 20@10
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>cellColumn: column row: rowIndex [
	| item |
	
	"this is a bad way for tree; maybe list too. the morph should ask for the full collection from index start to n elements. 
	eps when elementAt: must traverse the tree to find each element: not only a basic at:
	"
	item := self elementAt: rowIndex.

	^item cellMorphFor: self.
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>children: aBlock [

	"aBlock -> [ :item | aCollection ]"

	childrenBlock := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>childrenBlock [

	^childrenBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>childrenFor: anItem [
	
	| children |
	
	children := (childrenBlock value: anItem).
	
	^sortingBlock ifNil: [ children ] ifNotNil: [ children sort: sortingBlock ]
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>countAvailableRows [

	availableRows := rootItems inject: 0 into: [ :sum :item | sum + item availableRows ]
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>display: aBlock [

	"aBlock -> [ :item :cell | cell addMorphBack: ... ]"

	displayBlock := aBlock
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>displayBlock [

	^displayBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>elementAt: index [
	| curr b |
	
	curr := 0.

	b := nil.
	b := [ :p | p do: [ :each | (curr := curr + 1) = index ifTrue: [ ^each ] ifFalse: [ b value: each children ] ] ].
	
	b value: rootItems.

	SubscriptOutOfBounds signal: index.
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>expand: aNumber [

	rootItems do: [ :each | each expandToDepth: aNumber ].
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>expandAll [

	self expand: SmallInteger maxVal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>numberOfRows [
	
	^availableRows
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>root: anObject [

	self roots: { anObject }
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>roots: aCollection [

	rootItems := aCollection collect: [ :each | 
			FTBasicTreeListItem new 
				item: each;
				datasource: self
	].  

	self countAvailableRows
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>sortChildrenBy: aBlock [

	"aBLock -> [ :a :b | a something <= b something ] "

	sortingBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>tableRefresh [
	table ifNotNil: [ table refresh ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTBasicTreeListDataSource>>updateAvailableRows: aNumber [
	
	
	availableRows := availableRows + aNumber.

	aNumber isZero ifFalse: [ self tableRefresh ].
]
