"
I am raised when the text is modified
"
Class {
	#name : #RubTextChanged,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'start',
		'stop',
		'text'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged class>>from: start to: stop with: aText [
	^ self new from: start to: stop with: aText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>from: startIndex to: stopIndex with: aText [
	self start: startIndex.
	self stop: stopIndex.
	self text: aText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>start: anInteger [
	start := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>stop [
	^ stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>stop: anInteger [
	stop := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextChanged>>text: aText [
	text := aText
]
