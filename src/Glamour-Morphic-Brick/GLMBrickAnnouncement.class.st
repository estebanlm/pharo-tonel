"
A GLMBrickAnnouncement is default announcement used for any purpose by bricks.

Instance Variables
	data:		<Object>

data
	- xxxxx

"
Class {
	#name : #GLMBrickAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'data'
	],
	#category : #Glamour-Morphic-Brick-Announcements,
	#timestamp : 'AliakseiSyrel 10/17/2014 10:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAnnouncement>>data [
	^ data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAnnouncement>>data: anObject [
	data := anObject
]
