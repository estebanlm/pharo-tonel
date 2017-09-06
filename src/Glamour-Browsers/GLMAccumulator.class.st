"
An GLMAccumulator is an implicit type of browser that has the following behavior:
- each input entity has associated a pane without any relationship with the other panes
- based on the input entity if there already exists a pane associated, it is selected via GLMPaneSelected
- if there isnt a pane, a new pane is created
- based on entityToSelect, the associated pane is searched and potentially selected
- when a pane is selected in the user interface, the activeEntity is populated with the entity behind the selected pane

Input ports:
- entity
- entityToSelect

Output ports:
- activeEntity
"
Class {
	#name : #GLMAccumulator,
	#superclass : #GLMImplicitBrowser,
	#category : #Glamour-Browsers-Other,
	#timestamp : 'TudorGirba 4/21/2011 21:20'
}

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>activeEntity [
	^ (self pane port: #activeEntity) value
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>activeEntity: anObject [
	^ (self pane port: #activeEntity) value: anObject 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>addPaneFrom: aPort  [
	aPort value isNil ifTrue: [ ^ self ].
	(self tryToSelectPaneFrom: aPort) ifTrue: [ ^ self ].
	self panes addLast: (GLMPane named: (self panes size + 1) asString in: self).
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
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>entityToSelect [
	^ (self pane port: #entityToSelect) value
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>entityToSelect: anObject [
	^ (self pane port: #entityToSelect) value: anObject 
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>innerPortEvent: aPortEvent  [
	aPortEvent portName = #entity ifFalse: [
		"We don't want to resend the transmission, but use a new SimpleTransmission." 
		(self pane port: aPortEvent portName) value: aPortEvent value]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>outerPortEvent: aPortEvent  [
 	super outerPortEvent: aPortEvent.
	aPortEvent port name = #entityToSelect ifTrue: [
		self tryToSelectPaneFrom: aPortEvent port ].	
	aPortEvent port name = #entity ifTrue: [
		self addPaneFrom: aPortEvent port ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>removePaneIndex: i [
	| paneRemoved |
	paneRemoved := self panes removeAt: i.
	paneRemoved unregisterFromAllAnnouncements.
	self announce: (GLMPaneRemoved pane: paneRemoved fromBrowser: self )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>renderGlamorouslyOn: aRenderer [
	^ aRenderer renderAccumulator: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccumulator>>tryToSelectPaneFrom: aPort [
	self panes withIndexDo: [:each :i | 
		(each port: #entity) value = aPort value ifTrue: [
			self announce: 
				(GLMPaneSelected 
					pane: each 
					atPosition: i
					inBrowser: self).
			^ true ] ].
	^ false
]
