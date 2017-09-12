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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
DiffModel class >> adapterName [

	^ #DiffAdapter
]

{ #category : #specs }
DiffModel class >> defaultSpec [
	<spec>
	
	^ #(MorphicDiffAdapter
		adapt: #(model))
]

{ #category : #example }
DiffModel class >> exampleWithOptions [
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

{ #category : #example }
DiffModel class >> exampleWithoutOptions [
	"
	self exampleWithoutOptions
	"

	^ self new
		showOptions: false;
		leftText: 'Old text';
		rightText: 'New text';
		openWithSpec

]

{ #category : #accessing }
DiffModel >> contextClass [

	^ contextClassHolder value
]

{ #category : #accessing }
DiffModel >> contextClass: anObject [

	contextClassHolder value: anObject 
]

{ #category : #initialization }
DiffModel >> initialize [

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

{ #category : #accessing }
DiffModel >> leftText [

	^ leftTextHolder value
]

{ #category : #accessing }
DiffModel >> leftText: anObject [

	leftTextHolder value: anObject 
]

{ #category : #accessing }
DiffModel >> rightText [

	^ rightTextHolder value
]

{ #category : #accessing }
DiffModel >> rightText: anObject [

	rightTextHolder value: anObject 
]

{ #category : #api }
DiffModel >> showBoth [

	showOnlySource rawValue: false.
	showOnlyDestination rawValue: false.
	self changed: #showBoth with: { }
]

{ #category : #api }
DiffModel >> showOnlyDestination [

	^ showOnlyDestination value
]

{ #category : #api }
DiffModel >> showOnlyDestination: aBoolean [

	showOnlyDestination rawValue: false.
	showOnlyDestination value: aBoolean.
]

{ #category : #api }
DiffModel >> showOnlySource [

	^ showOnlySource value
]

{ #category : #api }
DiffModel >> showOnlySource: aBoolean [

	showOnlyDestination rawValue: false.
	showOnlySource value: aBoolean
]

{ #category : #api }
DiffModel >> showOptions [

	^ showOptions value
]

{ #category : #api }
DiffModel >> showOptions: aBoolean [

	showOptions value: aBoolean
]
