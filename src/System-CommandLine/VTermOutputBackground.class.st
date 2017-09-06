"
I'm the background style of a VTermOutputDriver
I'm characterized by the color of the background that will be printed.
"
Class {
	#name : #VTermOutputBackground,
	#superclass : #VTermOutputStyleElement,
	#pools : [
		'VTermOutputStyles'
	],
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 8/9/2016 11:36'
}

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputBackground>>= aBackground [
	^ self color isVTermDefaultColor and: [ aBackground color isVTermDefaultColor ]
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputBackground>>hash [
	^ self color hash
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputBackground>>setInDriver: aVTermOutputDriver  [
	
	aVTermOutputDriver setBackgroundColor: color
]
