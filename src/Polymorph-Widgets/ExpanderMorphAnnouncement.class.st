"

"
Class {
	#name : #ExpanderMorphAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'expanderMorph'
	],
	#category : #Polymorph-Widgets,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderMorphAnnouncement class>>on: anExpanderMorph [
	"Answer a new announcement for the given expander."

	^self new expanderMorph: anExpanderMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderMorphAnnouncement>>expanderMorph [

	^ expanderMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ExpanderMorphAnnouncement>>expanderMorph: anObject [

	expanderMorph := anObject
]
