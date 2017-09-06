"
I'm the font style of a VTermOutputDriver
I'm characterized by the color of the font that will be printed.
"
Class {
	#name : #VTermOutputFont,
	#superclass : #VTermOutputStyleElement,
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 8/9/2016 11:19'
}

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputFont>>= aFont [

	^self color isVTermDefaultColor and: [ aFont color isVTermDefaultColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputFont>>hash [
	^ self color hash
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputFont>>setInDriver: aVTermOutputDriver [
	aVTermOutputDriver setFontColor: color.
]
