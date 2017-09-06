"
I'm the style of a VTermOutputDriver.
I have a font, a background and a styles and I'm able to modify them to change the color of font (for example) or to add styles
I can't delete my styles, to get a basic VTermOutputStyle you must create a new one.
"
Class {
	#name : #VTermOutputStyle,
	#superclass : #Object,
	#instVars : [
		'font',
		'background',
		'styles'
	],
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 8/9/2016 11:28'
}

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>= aStyle [
	^ (self font = aStyle font and: [ self background = aStyle background ]) and: [ self styles = aStyle styles ]
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>addStyle: aString [
	self styles add:aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>background [
	^ background
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>font [
	
	^ font
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>initialize [

	styles := Set new.
	font := VTermOutputFont new style: self.
	background := VTermOutputBackground new style: self.
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>postCopy [
	font := self font copy.
	background := self background copy.
	styles :=  self styles copy.
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>setInDriver: aVTermOutputDriver [
	font setInDriver: aVTermOutputDriver.
	background setInDriver: aVTermOutputDriver.
	self styles do: [ :each | aVTermOutputDriver set: each ].
	aVTermOutputDriver installedStyle: self.
	
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyle>>styles [
	^styles
]
