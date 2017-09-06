"
I am an elementary Spec widget that adds a LabelModel at another widget.

self example

I provide the method content: that take a class in parameter, it instantiates it in the variable subwidget and add it at the focusOrder. Note it does not reset the focusOrder.

I provide accessors for the label and the subwidget, but I specialize doesNotUnderstand: to send the message at the subwidget.

I provide four layouts on my class side, to chose the position of the label.
"
Class {
	#name : #LabelledContainer,
	#superclass : #ComposableModel,
	#instVars : [
		'label',
		'subwidget'
	],
	#category : #Spec-PolyWidgets-Elementary,
	#timestamp : 'Spirita 7/27/2016 16:25'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>abstractExample [
	| example |
	example := self new.
	example
		title: self name asString , ' example';
		label: 'I am a label'.
	^ example
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>example [
	| example |
	example := self abstractExample.
	example content: ButtonModel.
	example subwidget
		label: 'I am a button'.
	example openDialogWithSpec.
	^ example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>labelBottom [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #subwidget origin: 0 @ 0 corner: 1 @ 0.9;
				add: #label origin: 0 @ 0.9 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>labelLeft [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #label origin: 0 @ 0 corner: 0.2 @ 1;
				add: #subwidget origin: 0.2 @ 0 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>labelRight [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #subwidget origin: 0 @ 0 corner: 0.8 @ 1;
				add: #label origin: 0.8 @ 0 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer class>>labelTop [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #label origin: 0 @ 0 corner: 1 @ 0.1;
				add: #subwidget origin: 0 @ 0.1 corner: 1 @ 1 ];
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>content: aWidgetClass [
	subwidget := self instantiate: aWidgetClass.
	self focusOrder add: subwidget
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>doesNotUnderstand: aMessage [
	^ aMessage sendTo: subwidget
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>initializeWidgets [
	label := self instantiate: LabelModel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>label: aString [
	label label: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>subwidget [
	^ subwidget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledContainer>>subwidget: anObject [
	subwidget := anObject
]
