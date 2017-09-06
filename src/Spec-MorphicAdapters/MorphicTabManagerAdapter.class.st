"
I am the adpater used to bridge a TabManagerModel and a TabManager
"
Class {
	#name : #MorphicTabManagerAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'isClosedHolder'
	],
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>addTab: aTab [
	self widgetDo: [ :w | w addTab: (self buildTab: aTab) ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>buildTab: aTab [
	^ aTab buildWithSpec
		when: #tabDeleted send: #tabDeleted: to: self;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>buildWidget [
	^ TabManagerMorph new
		model: self model;
		setTabs: self getTabs;
		when: #tabSelected send: #tabSelected: to: self;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>getTabs [
	^ [ (self model tabs collect: [ :each | self buildTab: each ]) collect: #asWidget ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>removeTab: aTab [
	"In Morphic, Tab removal is triggered on Tab, on TabManager."

	aTab widget delete
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>tabDeleted: aTab [
	"Tab removal notification triggered from Morphic world."

	self model basicRemoveTab: aTab model
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTabManagerAdapter>>tabSelected: aTab [

	self model selectedTab: aTab model
]
