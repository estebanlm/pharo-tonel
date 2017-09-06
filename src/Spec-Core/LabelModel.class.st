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
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/27/2016 13:51'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel class>>adapterName [

	^ #LabelAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel class>>defaultSpec [
	<spec>
	
	^ #(LabelAdapter
		adapt: #(model))
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel class>>title [

	^ 'Label Morph'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>defaultColor [
	^ Smalltalk ui theme textColor
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>emphasis [
	^ emphasis
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>emphasisDepractedFor: aCode [
	^ 'Using numbers for emphasis is deprecated, use symbols instead.
Instead of ' , aCode asString , ' use ' , (self emphasisForCode: aCode) asString , '.'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>emphasisForCode: aCode [
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

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>initialize [
	super initialize.
	labelHolder := '' asValueHolder.
	emphasis := #().
	labelHolder whenChangedDo: [ self changed: #getText ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>label [
	"<api: #inspect>"

	^ labelHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>label: aText [
	"<api: #string getter: #label>"
	"Set the text of the label"
	
	labelHolder value: aText
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
LabelModel>>labelHolder [
	"To register actions to be done when the label changes."
	^ labelHolder
]
