"
I am a dummy proto to see how easy it is to replace a subwidget with another one dynamically.

slef example
"
Class {
	#name : #DynamicWidgetChange,
	#superclass : #ComposableModel,
	#instVars : [
		'boolean',
		'button',
		'bottom'
	],
	#category : #Spec-Examples,
	#timestamp : 'Spirita 7/28/2016 14:27'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: #button height: 25;
		newRow: #bottom top: 25;
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange class>>example [
	^ self new openWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>bottom [
	^ bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>button [
	^ button
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>change [

	boolean := boolean not.

	boolean
		 ifTrue: [ self changeToList ]
		 ifFalse: [ self changeToButton ].
		
	self needRebuild: false.
	button needRebuild: false.
	
	self buildWithSpec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>changeToButton [

	self instantiateModels: 
		#( bottom ButtonModel ).
	button font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 9).
		
	bottom label: 'I am useless'.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>changeToList [

	self instantiateModels: 
		#( bottom #ListModel ).

	button font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10).
		
	bottom items: (1 to: 100) asOrderedCollection.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>initialize [

	super initialize.

	boolean := true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicWidgetChange>>initializeWidgets [

	button := self newButton.
	bottom := self newList.
		
	button 
		label: 'Change';
		action: [ self change ];
		state: false.
		
	bottom 
		items: (1 to: 10) asOrderedCollection.
]
