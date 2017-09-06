"

"
Class {
	#name : #GLMPagePoped,
	#superclass : #Announcement,
	#instVars : [
		'smooth'
	],
	#category : #Glamour-Morphic-Pager-Announcement,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagePoped>>initialize [
	super initialize.
	
	smooth := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagePoped>>smooth [
	^ smooth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagePoped>>smooth: anObject [
	smooth := anObject
]
