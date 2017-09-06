"
I am the component of DynamycSpecExample used for Integer.

self example 
"
Class {
	#name : #OpenOnIntExample,
	#superclass : #ComposableModel,
	#instVars : [
		'text',
		'plus',
		'minus'
	],
	#category : #Spec-Examples-Wrapper,
	#timestamp : 'Spirita 7/27/2016 11:03'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | 
			column 
				add: #text height: 25;
				newRow: [ :row | 
					row
						add: #minus;
						addSplitter;
						add: #plus ]
					height: 25 ];
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample class>>example [
	| example |
	example := (self new: 42).
	example extent: 100@100; openWithSpec.
	^example
]

{
	#category : #instantiation,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample class>>new: anInteger [
	^ self new initialize: anInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>initialize: anInteger [
	text label: anInteger asString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>initializePresenter [
	minus
		action: [ | currentValue |
			currentValue := text label asInteger.
			text label: (currentValue - 1) asString ].
	plus
		action: [ | currentValue |
			currentValue := text label asInteger.
			text label: (currentValue + 1) asString ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>initializeWidgets [
	text := self instantiate: LabelModel.
	plus := self instantiate: ButtonModel.
	minus := self instantiate: ButtonModel.
	plus
		label: '+'.
	minus
		label: '-'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>minus [
	^ minus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>plus [
	^ plus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnIntExample>>title [
	^ 'OpenOnIntExample'
]
