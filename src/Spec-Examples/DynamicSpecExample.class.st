"
I am an example of how dynamically create the UI corresponding at an object.

self exampleInt
self exampleNil
self exampleString
"
Class {
	#name : #DynamicSpecExample,
	#superclass : #Object,
	#instVars : [
		'ui',
		'object'
	],
	#category : #Spec-Examples-Wrapper,
	#timestamp : 'Spirita 7/27/2016 10:55'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample class>>exampleInt [
	^ self new open: 42
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample class>>exampleNil [
	^ self new
		open: nil
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample class>>exampleString [
	^ self new
		open: 'Hello World'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample class>>object: object [

	^ self new
		object: object;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>initialize [

	super initialize.
	object := nil asValueHolder.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>object [

	^ object value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>object: anObject [
	
	object value: anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>open [

	object value ifNil: [ ^ self openOnNil ].
	object value isInteger ifTrue: [ ^ self openOnInteger ].
	object value isString ifTrue: [ ^ self openOnString ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>open: anObject [
	anObject ifNil: [ ^ self openOnNil ].
	anObject isInteger
		ifTrue: [ ^ self openOnInteger: anObject ].
	anObject isString
		ifTrue: [ ^ self openOnString: anObject ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>openOnInteger [
	<script: '(DynamicSpecExample object: 42) open'>
	
	| ui layout |
	
	ui := DynamicComposableModel new.
	ui title: self title.
	ui instantiateModels: #( 
		text LabelModel
		plus ButtonModel
		minus ButtonModel ).
		
	ui text label: object value asString.
	ui minus 
		label: '-';
		state: false;
		action: 	[ 
			object value: object value -1.
			ui text label: object value asString ].

	ui plus 
		label: '+';
		state: false;
		action: 	[ 
			object value: object value +1.
			ui text label: object value asString ].
	
	layout := SpecLayout composed
		newColumn: [ :c |
			c
				add: #text height: 25;
				newRow: [ :r | r add: #minus ; addSplitter; add: #plus ] height: 25 ];
		yourself.
				
	ui openWithSpecLayout: layout.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>openOnInteger: anInteger [
	ui := OpenOnIntExample new: anInteger.
	ui
		extent: 100 @ 100;
		openWithSpec
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>openOnNil [
	ui := OpenOnNilExample new.
	ui 
		extent: 200 @ 100; openWithSpec
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>openOnString [
	<script: '(DynamicSpecExample object: ''Pharo'') open'>
	
	| ui layout bottomLayout temp |	
	ui := DynamicComposableModel new.
	ui title: self title.
	ui instantiateModels: #( 
		label LabelModel
		check CheckBoxModel
		text TextInputFieldModel
		button ButtonModel ).
		
	ui label label: object value.

			
	object whenChangedDo: [ :o | ui label label: o asString ].
		
	ui text 
		text: object value;
		enabled: true;
		acceptBlock: [ :string | self object: string ].
	
	temp := object value.
	
	ui button
		label: 'reset';
		state: false;
		action: [ 
			ui text text: temp.
			self object: temp ].
		
	layout := SpecLayout composed
				newColumn: [ :c |
					c 
						newRow: [ :r | r add: #label; add: #check width: 100 ] height: 25;
						newRow: [ :r | r add: #text; add: #button ] height: 25 ];
				yourself.
				
	bottomLayout := SpecLayout composed
				newColumn: [ :c |
					c 
						newRow: [ :r | r add: #text; add: #button ] height: 25;
						newRow: [ :r | r add: #label; add: #check width: 100 ] height: 25 ];
				yourself.
	
	ui check
		label: 'Label on top';
		state: true;
		whenActivatedDo: [ 
			ui needFullRebuild: false.
			ui buildWithSpecLayout: layout ];
		whenDeactivatedDo: [ 
			ui needFullRebuild: false.
			ui buildWithSpecLayout: bottomLayout ].
				
	ui openWithSpecLayout: layout.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>openOnString: aString [
	ui := OpenOnStringExample new:aString.
	ui 
		extent: 300 @ 200;openWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
DynamicSpecExample>>title [

	^ 'Dynamic Examples'
]
