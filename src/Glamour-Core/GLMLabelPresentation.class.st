"

"
Class {
	#name : #GLMLabelPresentation,
	#superclass : #GLMFormatedPresentation,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLabelPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderLabelPresentation: self
]
