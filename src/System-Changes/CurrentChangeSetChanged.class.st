"
Announce that the current change set has changed
"
Class {
	#name : #CurrentChangeSetChanged,
	#superclass : #Announcement,
	#instVars : [
		'new',
		'old'
	],
	#category : #System-Changes,
	#timestamp : 'TorstenBergmann 1/31/2014 10:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
CurrentChangeSetChanged>>new [
	^ new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
CurrentChangeSetChanged>>new: anObject [
	new := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
CurrentChangeSetChanged>>old [
	^ old
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
CurrentChangeSetChanged>>old: anObject [
	old := anObject  
]
