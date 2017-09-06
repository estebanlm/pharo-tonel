"

"
Class {
	#name : #GTSpotterContextChanged,
	#superclass : #Announcement,
	#instVars : [
		'previous',
		'current'
	],
	#category : #GT-Spotter-Announcements,
	#timestamp : ''
}

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>context [
	^ self current
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>context: aSpotterContext [
	self current: aSpotterContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>current [
	^ current
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>current: anObject [
	current := anObject
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>currentText [
	^ self current ifNil: [''] ifNotNil: [ self current text ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>previous [
	^ previous
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>previous: anObject [
	previous := anObject
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>previousText [
	^ self previous ifNil: ['']  ifNotNil: [ self previous text ]
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContextChanged>>text [
	^ self currentText
]
