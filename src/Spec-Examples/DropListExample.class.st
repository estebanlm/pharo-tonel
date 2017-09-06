"
A DropListExample is a simple example of how to use drop lists.

self example
"
Class {
	#name : #DropListExample,
	#superclass : #ComposableModel,
	#instVars : [
		'container',
		'morph1',
		'morph2',
		'morph3',
		'uniformDropList',
		'heterogeneousDropList'
	],
	#category : #Spec-Examples-Morphic,
	#timestamp : 'Spirita 7/26/2016 15:50'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample class>>defaultSpec [

	^ { #ContainerModel.
			#add:.	{ self topSpec . #layout: . #(#SpecLayoutFrame
													bottomFraction: 0
													bottomOffset: 30) }.
			#add:.	{{#model . #container } . #layout: .  #(#SpecLayoutFrame
													topOffset: 42). }}
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample class>>example [
	^ self new openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample class>>title [

	^ 'Drop list'
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample class>>topSpec [

	^ SpecLayout composed
		newRow: [ :r |
			r 
				add: #uniformDropList;
				add: #heterogeneousDropList ];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>container [

	^ container asSpecAdapter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>heterogeneousDropList [

	^ heterogeneousDropList.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>initialize [

	container := PanelMorph new.
	self instantiateMorphs.
	
	container
		changeTableLayout;
		listDirection: #bottomToLeft.
	
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>initializeWidgets [
	uniformDropList := self newDropList.
	heterogeneousDropList := self newDropList.
	uniformDropList
		items:
			{morph1.
			morph2.
			morph3};
		displayBlock: [ :m | m color name capitalized , ' morph' ];
		iconHolder: [ :e | self iconNamed: #testGreenIcon ];
		whenSelectedItemChanged: [ :m | 
			container removeAllMorphs.
			container addMorph: m ].
	heterogeneousDropList
		addItemLabeled: 'Open workspace'
			do: [ Smalltalk tools workspace open ]
			icon: (self iconNamed: #smallOkIcon);
		addItemLabeled: 'Inspect current morph'
			do: [ uniformDropList selectedItem inspect ]
			icon: (self iconNamed: #testRedIcon).

	"If this is uncommented, it will fire the action of the first item, which is not what we want:
	heterogeneousDropList setSelectedIndex: 1.
	same for:
	heterogeneousDropList setIndex: 1"
	uniformDropList setIndex: 1.
	self setFocus
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>instantiateMorphs [

	morph1 := Morph new
					color: Color red;
					width: 60;
					height: 20.
	morph2 := Morph new
					color: Color blue;
					width: 20;
					height: 60.
	morph3 := Morph new
					color: Color green;
					width: 50;
					height: 50.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>setFocus [
	
	self focusOrder
		add: uniformDropList;
		add: heterogeneousDropList.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DropListExample>>uniformDropList [

	^ uniformDropList
]
