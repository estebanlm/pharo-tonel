"
GLMExpander aims to implement a Hopscotch-like browser. This is similar to a tree where each tree node content is itself a presentation.
"
Class {
	#name : #GLMExpander,
	#superclass : #GLMImplicitBrowser,
	#instVars : [
		'rootPane'
	],
	#category : #Glamour-Browsers-Other,
	#timestamp : 'DamienCassou 7/26/2011 19:10'
}

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMExpander>>addPaneFrom: aPort  [
	self panes addLast: (GLMPane in: self).
	self newTransmission
		addActiveOrigin: aPort; 
		destination: (self panes last port: #entity); 
		transmit.
	self announce: 
			(GLMPaneAdded 
				pane: self panes last 
				atPosition: self panes size 
				inBrowser: self)
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMExpander>>innerPortEvent: aPortEvent  [
	 
	aPortEvent portName = #entity ifFalse: [
		"We resend the value to the outer pane"
		"We don't want to resend the transmission, but use a new SimpleTransmission." 
		(self pane port: aPortEvent portName) value: aPortEvent value]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMExpander>>outerPortEvent: aPortEvent  [
	 
	aPortEvent port name = #entity ifFalse: [^self]. 
	panes := nil. 
	self matches ifTrue: [
		"We only want to execute the transformation if the visibility condition matches"
		(self transformation glamourValue: aPortEvent port value) do: [:each |
			self addPaneFrom: (GLMSimplePort new value: each) ] ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMExpander>>renderGlamorouslyOn: aRenderer  [
	^ aRenderer renderExpander: self
]
