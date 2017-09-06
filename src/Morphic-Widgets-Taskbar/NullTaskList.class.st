"
I stand in when the task list is not open in the world.
"
Class {
	#name : #NullTaskList,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #Morphic-Widgets-Taskbar,
	#timestamp : 'SeanDeNigris 1/23/2014 11:53'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
NullTaskList class>>in: world [

	^ self new
		world: world;
		yourself.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
NullTaskList>>handleEvent: aKeyboardEvent  [

	aKeyboardEvent isWindowNavigation ifFalse: [ ^ false ].
	world theme openTaskListIn: world from: aKeyboardEvent.
	^ true.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
NullTaskList>>world: aWorldMorph  [

	world := aWorldMorph.
]
