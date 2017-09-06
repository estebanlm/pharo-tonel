"

"
Class {
	#name : #GLMSelectedTextChanged,
	#superclass : #Announcement,
	#instVars : [
		'start',
		'end',
		'selectedText'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>end [
	^ end
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>end: anObject [
	end := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>interval [
	^ self start to: self end
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>selectedText [
	^ selectedText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>selectedText: anObject [
	selectedText := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSelectedTextChanged>>start: anObject [
	start := anObject
]
