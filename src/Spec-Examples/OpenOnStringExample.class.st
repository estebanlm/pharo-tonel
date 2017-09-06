"
I am the component of DynamycSpecExample used for String.

self example 

I show also how to dynamically redrawn a widget.
"
Class {
	#name : #OpenOnStringExample,
	#superclass : #ComposableModel,
	#instVars : [
		'label',
		'check',
		'input',
		'button',
		'textToReset'
	],
	#category : #Spec-Examples-Wrapper,
	#timestamp : 'Spirita 7/27/2016 11:02'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample class>>bottomLayout [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				newRow: [ :row | 
					row
						add: #input;
						add: #button ]
					height: 25;
				newRow: [ :row | 
					row
						add: #label;
						add: #check width: 100 ]
					height: 25 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				newRow: [ :row | 
					row
						add: #label;
						add: #check width: 100 ]
					height: 25;
				newRow: [ :row | 
					row
						add: #input;
						add: #button ]
					height: 25 ];
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample class>>example [
	| example |
	example := self new: 'Hello world'.
	example
		extent: 300 @ 200;
		openWithSpec.
	^ example
]

{
	#category : #instantiation,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample class>>new: aString [
	^ self new initialize: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>button [
	^ button
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>check [
	^ check
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>initialize: aString [
	label label: aString.
	input text: aString.
	textToReset := aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>initializePresenter [
	button action: [ input text: textToReset ].
	input whenTextChanged: [:text | label label: text].
	check
		whenActivatedDo: [ self needRebuild: false.
			self buildWithSpecLayout: self class defaultSpec ];
		whenDeactivatedDo: [ self needRebuild: false.
			self buildWithSpecLayout: self class bottomLayout ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>initializeWidgets [
	label := self instantiate: LabelModel.
	check := self instantiate: CheckBoxModel.
	input := self instantiate: TextInputFieldModel.
	button := self instantiate: ButtonModel.
	button
		label: 'reset';
		action: [ input text: textToReset ].
	check
		label: 'Label on top';
		state: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>input [
	^ input
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>label [
	^ label
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>openOnString [
	| ui temp object |
	object whenChangedDo: [ :o | ui label label: o asString ].
	temp := object value.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>textToReset [
	^ textToReset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnStringExample>>title [
	^ 'OpenOnStringExample'
]
