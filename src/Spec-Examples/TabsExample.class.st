"
I am an example of how to use tabs reusing DynamicWidgetChange, ClassMethodBrowser and MessageBrowser, and using an EyeInspector.

self example
"
Class {
	#name : #TabsExample,
	#superclass : #ComposableModel,
	#instVars : [
		'manager'
	],
	#category : #Spec-Examples,
	#timestamp : 'Spirita 7/28/2016 14:49'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		add: #manager;
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample class>>example [
	^ self open
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample class>>open [
	^self new openWithSpec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>browserTab [
	| tab |
	tab := self newTab.
	tab
		label: 'Browser';
		icon: (tab iconNamed: #nautilusIcon);
		model:
			(ClassMethodBrowser new
				classes: Smalltalk allClasses;
				yourself).
	^ tab
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>dynamicTab [
      | tab |
      tab := self newTab.
      tab
          label: 'Dynamic';
          icon: (tab iconNamed: #nautilusIcon);
          model: (DynamicWidgetChange  new).
      ^ tab 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>initializeWidgets [

	manager := self newTabManager.
	manager whenTabSelected: [ self updateTitle ].
	self populateManager
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>manager [

	^ manager
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>objectClassTab [
	| tab |
	tab := self newTab.
	tab
		label: 'Object class';
		icon: (tab iconNamed: #nautilusIcon);
		model: (MessageBrowser new messages: Object methods).
	^ tab
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>objectInspectorTab [
	|tab|
	tab := self newTab.
	tab
		label: 'Object inspector';
		icon: (tab iconNamed: #nautilusIcon);
		retrievingBlock: [ (EyeInspector new
				inspect: Object;
				buildWithSpec: #inspectorSpec) asWidget ].
			^tab
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>populateManager [

	manager
		addTab: self objectClassTab;
		addTab: self objectInspectorTab;
		addTab: self browserTab;
		addTab: self dynamicTab
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
TabsExample>>title [

	^ self manager selectedTab
		ifNil: [ 'Tabs Example' ]
		ifNotNil: [:tab | tab label ]
]
