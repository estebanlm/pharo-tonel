"
I am a spec model representing a tab manager. My role is to gather multiple tabs, and make them work together

You can also have a look at TabsExample for another example.

"
Class {
	#name : #TabManagerModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'tabs',
		'tabSelectedAction',
		'selectedTab'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/28/2016 10:09'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel class>>adapterName [

	^ #TabManagerAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel class>>defaultSpec [
	<spec: #default>
	
	^ #(TabManagerAdapter
		adapt: #(model))
]

{
	#category : #dependents,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>addDependent: aMorph [

	self myDependents add: aMorph
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>addTab: aTab [

	"BEWARE: this code is an exception. One should never access directly a value holder contents"
	"I do this here for optimisation. No need to trigger the whole collection changed. Only the added element is interesting "
	tabs value add: aTab.
	aTab owner: self.
	self selectedTab ifNil: [ selectedTab value: aTab ].
	self changed: #addTab: with: { aTab }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>basicRemoveTab: aTab [
	"BEWARE: this code is an exception. One should never access directly a value holder contents"

	"I do this here for optimisation. No need to trigger the whole collection changed. Only the added element is interesting "

	"This method simply removes the tab from the collection without triggering further updates. It is useful for Adapters if there are different mechanisms of tab removal."

	(tabs value remove: aTab ifAbsent: [ ^ self ]) owner: nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>initialize [
	"Initialization code for TabManagerModel"

	super initialize.
	tabs := OrderedCollection new asValueHolder.
	tabSelectedAction := [  ] asValueHolder.
	selectedTab := nil asValueHolder.
	self myDependents: WeakSet new.

	tabs whenChangedDo: [ :new | self widget ifNotNil: [ :w | w tabs: self getTabs value ] ].
	selectedTab whenChangedDo: [ :newTab | tabSelectedAction value cull: newTab cull: self ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>removeTab: aTab [
	self basicRemoveTab: aTab.
	self changed: #removeTab: with: {aTab}
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>removeTabNumber: anIndex [

	self removeTab: (tabs at: anIndex)
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>selectTabModel: tabModel [

	tabSelectedAction value cull: tabModel cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>selectedTab [

	^ selectedTab value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>selectedTab: aTab [

	selectedTab value: aTab
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>tabSelectedAction [

	^ tabSelectedAction value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>tabs [

	^ tabs value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>tabs: aCollection [

	tabs value: aCollection
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabManagerModel>>whenTabSelected: aBlock [

	tabSelectedAction value: aBlock
]
