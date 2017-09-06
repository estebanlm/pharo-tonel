"
SimplestClassListExample new openOn: Object
"
Class {
	#name : #SimplestClassListExample,
	#superclass : #MorphTreeModel,
	#instVars : [
		'rootClass',
		'selected'
	],
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'AlainPlantec 2/18/2010 19:37'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample class>>example [

	SimplestClassListExample new openOn: Object
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>defaultTreeMorph [
	^ super defaultTreeMorph
		"beCheckList;"
		"autoDeselection: true;"
		multiSelection: true;
		autoMultiSelection: true;
		yourself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>openDialogOn: aClass  [
	rootClass := aClass.
	^ self openDialogWindowIn: World title: 'All Object subclasses'

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>openOn: aClass  [
	rootClass := aClass.
	(self defaultTreeMorph buildContents embeddedInMorphicWindowLabeled: 'test') openInWorld
	"(self dialogWindowIn: World title: 'All Object subclasses') openInWorld"

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>plugOne [
	| l |
	rootClass := Object.
	l := PluggableListMorph
		on: self 
		list: #rootItems
		selected: #selected
		changeSelected: #selected:.
	(l embeddedInMorphicWindowLabeled: 'test') openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>rootItems [
	^ rootClass allSubclasses asArray sort: [:a :b | a name < b name]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>rootItemsOrig [
	^ rootClass allSubclasses asArray sort: [:a :b | a name < b name]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>rootItemsTest [
	^ (rootClass allSubclasses asArray sort: [:a :b | a name < b name])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>selected [
	^ selected ifNil: [selected := 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListExample>>selected: x [
	selected := x.
	self changed: #selected
]
