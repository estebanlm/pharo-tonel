"
I am a widget used to verify that the mechanism used to compute rows and columns are still working.
"
Class {
	#name : #TestAutoFractionComputation,
	#superclass : #ComposableModel,
	#instVars : [
		'button',
		'list',
		'text'
	],
	#category : #Spec-Tests-Utils,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
TestAutoFractionComputation class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: [ :r |
			r 
				add: #list left: 0.8;
				newColumn: [ :c |
					c 
						add: #button bottom: 0.7;
						add: #text top: 0.3 ] right: 0.2 ];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestAutoFractionComputation>>button [
	^ button
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestAutoFractionComputation>>initializeWidgets [
	button := self newButton.
	list := self newList.
	text := self newText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestAutoFractionComputation>>list [
	^ list
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestAutoFractionComputation>>text [
	^ text
]
