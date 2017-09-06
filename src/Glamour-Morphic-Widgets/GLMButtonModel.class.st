"

"
Class {
	#name : #GLMButtonModel,
	#superclass : #GLMMorphicModel,
	#instVars : [
		'glamourAction'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMButtonModel>>buttonLabel [
	^ self glamourAction title
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMButtonModel>>execute [
	self glamourAction actOn: self glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMButtonModel>>glamourAction [
	^ glamourAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMButtonModel>>glamourAction: anObject [
	glamourAction := anObject
]
