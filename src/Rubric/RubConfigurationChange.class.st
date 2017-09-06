"
I am raised when the configuration of a view changes
"
Class {
	#name : #RubConfigurationChange,
	#superclass : #RubAnnouncement,
	#instVars : [
		'configurationBlock'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 10:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubConfigurationChange>>configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :scrolledTextMorph | ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubConfigurationChange>>configurationBlock: aBlockWithAScrolledTextMorphAsArgument [
	configurationBlock := aBlockWithAScrolledTextMorphAsArgument
]
