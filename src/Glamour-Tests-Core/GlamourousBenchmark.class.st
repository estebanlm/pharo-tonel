"

"
Class {
	#name : #GlamourousBenchmark,
	#superclass : #Object,
	#instVars : [
		'progressBarSize',
		'progress'
	],
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>defaultBrowser  [
	| browser |
	browser := GLMTabulator new.
	browser column: #one; column: #two.

	browser transmit to: #one; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3] ].
	browser transmit to: #two; from: #one; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3] ].
	browser transmit to: #one; from: #two; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3] ].

	^ browser
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>defaultFinderBrowser  [
	"
	self new defaultFinderBrowser openOn: 10
	"
	| finder |
	finder := GLMFinder new.
	finder show: [:a | a list
		title: 'title';
		display: [:each | 1 to: each ];
		showOnly: 50 ].

	^ finder
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>measureOpeningTime [
	| browser numberOfOpenings time |
	numberOfOpenings := 15.

	browser := self defaultBrowser.
	time := Time millisecondsToRun: [ numberOfOpenings timesRepeat: [(browser openOn: 10) delete] ].
	^ {numberOfOpenings . time}
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>measureSelectionTime [
	"
	self new measureSelectionTime 
	"
	^ self measureSelectionTimeForSize: 1000
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>measureSelectionTimeForSize: size [
	"
	self new measureSelectionTime 
	"
	| browser numberOfSelections time port window |
	numberOfSelections := 15.

	browser := self defaultBrowser.
	window := browser openOn: size.
	port := browser panes first ports second.
	time := Time millisecondsToRun: [ (size - numberOfSelections) to: size do: [:i | port value: i ] ].
	window delete.
	^ {size . time}
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>measureSelectionTimeInFinderForSize: size [
	"
	self new measureSelectionTimeInFinderForSize: 20 
	"
	| browser time window |

	browser := self defaultFinderBrowser.
	window := browser openOn: size.
	
	time := Time millisecondsToRun: 
			[size timesRepeat: [ (window model panes last port: #selection) value: size].].
		
	window delete.
	^ {size . time}
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>showOnlyBrowser  [
	| browser |
	browser := GLMTabulator new.
	browser column: #one; column: #two.

	browser transmit to: #one; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3];
			showOnly: 50].
	browser transmit to: #two; from: #one; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3];
			showOnly: 50].
	browser transmit to: #one; from: #two; andShow: [ :a |
		a list
			display: [:x | 1 to: x * 3];
			showOnly: 50].

	^ browser
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:34'
}
GlamourousBenchmark>>showOnlyFinderBrowser  [
	"
	self new showOnlyFinderBrowser openOn: 10
	"
	| finder |
	finder := GLMFinder new.
	finder list
		title: 'title';
		display: [:each | 1 to: each ];
		showOnly: 50.

	^ finder
]
