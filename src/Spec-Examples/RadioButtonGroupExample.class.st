"
A RadioButtonGroupExample is an simple example about how to use RadioButtonGroupModel.

self example
"
Class {
	#name : #RadioButtonGroupExample,
	#superclass : #ComposableModel,
	#instVars : [
		'button1',
		'button2',
		'button3',
		'container',
		'morph1',
		'morph2',
		'morph3'
	],
	#category : #Spec-Examples-Morphic,
	#timestamp : 'Spirita 7/28/2016 14:30'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [ :row |
			row 
				add: #button1;
				add: #button2;
				add: #button3 ] height: self toolbarHeight;
		add: #container;
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample class>>example [
	^ self new openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample class>>title [

	^ 'Radio Button Group Example'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>button1 [

	^ button1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>button2 [

	^ button2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>button3 [

	^ button3
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>container [

	^ container asSpecAdapter
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>initialize [

	self initializeMorphs.
	super initialize.

	container := PanelMorph new.
	container
		changeTableLayout;
		listDirection: #bottomToLeft.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>initializeMorphs [

	morph1 := Morph new
					color: Color red;
					width: 60;
					height: 20;
					yourself.
	morph2 := Morph new
					color: Color blue;
					width: 20;
					height: 60;
					yourself.
	morph3 := Morph new
					color: Color green;
					width: 50;
					height: 50;
					yourself.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>initializePresenter [

	self on: button1 show: morph1.
	self on: button2 show: morph2.
	self on: button3 show: morph3.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>initializeWidgets [
	button1 := self instantiate: RadioButtonModel.
	button2 := self instantiate: RadioButtonModel.
	button3 := self instantiate: RadioButtonModel.
	button1 label: 'Button 1'.
	button2 label: 'Button 2'.
	button3 label: 'Button 3'.
	self setFocus.
	self setGroup
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>on: button show: aMorph [

	button whenActivatedDo: [ container addMorph: aMorph ].
	button whenDeactivatedDo: [ container removeMorph: aMorph ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>setFocus [
	
	self focusOrder
		add: button1;
		add: button2;
		add: button3.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RadioButtonGroupExample>>setGroup [
RadioButtonGroupModel new
		addRadioButton: button1;
		addRadioButton: button2;
		addRadioButton: button3;
		default: button1.
]
