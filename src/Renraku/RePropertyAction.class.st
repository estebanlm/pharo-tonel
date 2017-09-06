"
I am an action that appears in the Nautiluas qa plugin next the the item's title.

icon - a Form that will appear on the button (green square by default)

description - the description that will be present on popup on hower

action - a two (ortional) parameter block that is evaluated with the critic and the current code entity (class, method…) when the button is pressed
 No newline at end of file

"
Class {
	#name : #RePropertyAction,
	#superclass : #Object,
	#instVars : [
		'action',
		'icon',
		'description'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 1/14/2016 15:04'
}

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>actOnCritic: aCritic ofEntity: anEntity [

	action cull: aCritic cull: anEntity 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>action [
	^ action

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>action: anObject [
	action := anObject

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>description [
	^ description

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>description: anObject [
	description := anObject

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>icon  [
	^ icon

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>icon: anObject [
	icon := anObject

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePropertyAction>>initialize  [
	
	icon := (Form extent: 16@16 depth: 32) fillColor: Color green.
	description := ''.
	action := [ :critic :entity | ]

]
