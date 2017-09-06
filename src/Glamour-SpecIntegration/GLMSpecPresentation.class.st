"
This presentation offers a means to embed a Spec user interface within Glamour. 
"
Class {
	#name : #GLMSpecPresentation,
	#superclass : #GLMPresentation,
	#category : #Glamour-SpecIntegration,
	#timestamp : 'AndreiChis 10/3/2014 18:25'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpecPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderSpecPresentation: self
]
