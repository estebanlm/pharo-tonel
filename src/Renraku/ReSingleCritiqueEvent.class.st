"
A Renraku event with a single critic.
"
Class {
	#name : #ReSingleCritiqueEvent,
	#superclass : #ReCritiqueEvent,
	#instVars : [
		'critique'
	],
	#category : #Renraku-Announcements,
	#timestamp : 'YuriyTymchuk 8/23/2015 14:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSingleCritiqueEvent>>critique [
	^ critique
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSingleCritiqueEvent>>critique: aCritique [
	critique := aCritique
]
