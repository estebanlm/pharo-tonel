"
I am a Spec widget useful for visualising differences between two strings.

When a classContext: is setted, the strings are highlighted using such contextual information.

Examples:

self exampleWithoutOptions.
self exampleWithOptions.
"
Class {
	#name : #DiffModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'leftTextHolder',
		'rightTextHolder',
		'showOptions',
		'contextClassHolder',
		'showOnlyDestination',
		'showOnlySource'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel class>>adapterName [

	^ #DiffAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel class>>defaultSpec [
	<spec>
	
	^ #(MorphicDiffAdapter
		adapt: #(model))
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel class>>exampleWithOptions [
	"
	self exampleWithOptions
	"

	^ self new
		showOptions: true;
		leftText: (True >> #and:) sourceCode;
		rightText: (True >> #or:) sourceCode;
		contextClass: True;
		openWithSpec
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel class>>exampleWithoutOptions [
	"
	self exampleWithoutOptions
	"

	^ self new
		showOptions: false;
		leftText: 'Old text';
		rightText: 'New text';
		openWithSpec

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>contextClass [

	^ contextClassHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>contextClass: anObject [

	contextClassHolder value: anObject 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>initialize [

	super initialize.
	
	leftTextHolder := '' asValueHolder.
	rightTextHolder := '' asValueHolder.
	contextClassHolder := nil asValueHolder.
	showOptions := true asValueHolder.
	showOnlyDestination := false asValueHolder.
	showOnlySource := false asValueHolder.	
		
	leftTextHolder whenChangedDo: [ :newText | self changed: #leftText: with: { newText } ].
	rightTextHolder whenChangedDo: [ :newText | self changed: #rightText: with: { newText } ].
	contextClassHolder whenChangedDo: [ :newClass | self changed: #contextClass: with: { newClass } ].	
	showOptions whenChangedDo: [ :aBoolean | self changed: #showOptions: with: { aBoolean }].	
	showOnlyDestination whenChangedDo: [:aBoolean | self changed: #showOnlyDestination: with: { aBoolean } ].
	showOnlySource whenChangedDo: [:aBoolean | self changed: #showOnlySource: with: { aBoolean } ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>leftText [

	^ leftTextHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>leftText: anObject [

	leftTextHolder value: anObject 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>rightText [

	^ rightTextHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>rightText: anObject [

	rightTextHolder value: anObject 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showBoth [

	showOnlySource rawValue: false.
	showOnlyDestination rawValue: false.
	self changed: #showBoth with: { }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOnlyDestination [

	^ showOnlyDestination value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOnlyDestination: aBoolean [

	showOnlyDestination rawValue: false.
	showOnlyDestination value: aBoolean.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOnlySource [

	^ showOnlySource value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOnlySource: aBoolean [

	showOnlyDestination rawValue: false.
	showOnlySource value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOptions [

	^ showOptions value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DiffModel>>showOptions: aBoolean [

	showOptions value: aBoolean
]
