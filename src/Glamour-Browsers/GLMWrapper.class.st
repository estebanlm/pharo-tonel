"
The GLMWrapper is a browser that has only one pane and that is typically used as a placeholder.

The pane takes only entity as input.
"
Class {
	#name : #GLMWrapper,
	#superclass : #GLMImplicitBrowser,
	#category : #Glamour-Browsers-Other,
	#timestamp : '<historical>'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>addDefaultPane [
	self addPane: (GLMPane named: #default)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>defaultPane  [
	^ self panes anyOne 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>initialize [
	super initialize.
	self addDefaultPane.
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>innerPortEvent: aPortEvent  [
	"We forward all inner ports to the outside world"
	aPortEvent portName = #entity ifFalse: [
		"We don't want to resend the transmission, but use a new SimpleTransmission." 
		(self pane port: aPortEvent portName) value: aPortEvent value]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>outerPortEvent: aPortEvent  [
	"We only treat the #entity port, and for it we simply trigger 
	a transmission to the default pane"

	super outerPortEvent: aPortEvent.
	aPortEvent port name = #entity ifFalse: [^self].
	self newTransmission
		addActiveOrigin: (aPortEvent port); 
		destination: (self panes anyOne port: #entity); 
		transmit
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWrapper>>renderGlamorouslyOn: aRenderer  [
	^ aRenderer renderWrapper: self
]
