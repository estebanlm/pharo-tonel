"
A Renraku event with multiple critics.
"
Class {
	#name : #ReMultipleCritiquesEvent,
	#superclass : #ReCritiqueEvent,
	#instVars : [
		'critiques'
	],
	#category : #Renraku-Announcements,
	#timestamp : 'YuriyTymchuk 8/23/2015 14:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReMultipleCritiquesEvent>>critiques [
	^ critiques
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReMultipleCritiquesEvent>>critiques: aCollection [
	critiques := aCollection
]
