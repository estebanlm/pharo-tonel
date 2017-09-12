"
A LabelModel is a spec model for Labels.
See AbstractWidgetModel

self example

I provide the following variables and their accessors
- label is the text displayed that I display.

I am specializing defaultColor to change the color of my text.

todo
- emphasis
"
Class {
	#name : #LabelModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'labelHolder',
		'emphasis'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
LabelModel class >> adapterName [

	^ #LabelAdapter
]

{ #category : #specs }
LabelModel class >> defaultSpec [
	<spec>
	
	^ #(LabelAdapter
		adapt: #(model))
]

{ #category : #specs }
LabelModel class >> title [

	^ 'Label Morph'
]

{ #category : #initialization }
LabelModel >> defaultColor [
	^ Smalltalk ui theme textColor
]

{ #category : #api }
LabelModel >> emphasis [
	^ emphasis
]

{ #category : #private }
LabelModel >> emphasisDepractedFor: aCode [
	^ 'Using numbers for emphasis is deprecated, use symbols instead.
Instead of ' , aCode asString , ' use ' , (self emphasisForCode: aCode) asString , '.'
]

{ #category : #private }
LabelModel >> emphasisForCode: aCode [
	^ {(#bold -> 1).
	(#italic -> 2).
	(#underline -> 4).
	(#narrow -> 8).
	(#struck -> 16)}
		collect: [ :pair | 
			(aCode bitAnd: pair value) = 0
				ifFalse: [ pair key ] ]
		thenReject: #isNil
]

{ #category : #initialization }
LabelModel >> initialize [
	super initialize.
	labelHolder := '' asValueHolder.
	emphasis := #().
	labelHolder whenChangedDo: [ self changed: #getText ].
]

{ #category : #api }
LabelModel >> label [
	"<api: #inspect>"

	^ labelHolder value
]

{ #category : #api }
LabelModel >> label: aText [
	"<api: #string getter: #label>"
	"Set the text of the label"
	
	labelHolder value: aText
]

{ #category : #api-valueHolder }
LabelModel >> labelHolder [
	"To register actions to be done when the label changes."
	^ labelHolder
]
