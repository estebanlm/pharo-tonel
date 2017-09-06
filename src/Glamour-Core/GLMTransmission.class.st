"
A GLMTransmission models the connection between multiple origin ports and one destination port. Whenever an origin port changes the value, the corresponding transmissions are triggered by the browser.

The result of triggering a transmission is the setting of the value in the destination port. The transmissionStrategy can add further different semantics to this behavior.

A transmission takes place in a context. The context is started every time a new value is set from outside. Afterwards, the context is preserved internally. This is important for braking possible loops of transmission propagation.

There are two kind of origins for a transmission, active and passive ones. A change of value in an active origin will trigger the transmissions originating from it. A change of value in a passive origin will not trigger the transmission. However, a value in a passive origin is still part of the transmission value.
"
Class {
	#name : #GLMTransmission,
	#superclass : #GLMLoggedObject,
	#instVars : [
		'context',
		'destination',
		'browser',
		'origins',
		'transmissionStrategy',
		'transformation',
		'condition'
	],
	#category : #Glamour-Core,
	#timestamp : 'DamienCassou 7/19/2011 16:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>activeOrigins  [
	 
	^(self originReferences select: [:each | each isActive]) 
		collect: [:each | each port]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>addActiveOrigin: aPort  [
	^ self originReferences 
		add: 
			((GLMOriginPortReference new) 
				port: aPort; 
				beActive; 
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>addPassiveOrigin: aPort [
	^ self originReferences 
		add: 
			((GLMOriginPortReference new) 
				port: aPort; 
				bePassive; 
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>addPresentation: aPresentation [
	self transmissionStrategy addPresentation: aPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>addPresentations: aCollection [
	self transmissionStrategy addPresentations: aCollection
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>andShow: aBlock [
	"This method accepts a block with one argument.
	The block will be evaluated with an instance of GLMCompositePresentation.
	
	The block should construct the presentations that go in the composite presentation.
	The composite presentation will be the one that will get installed in the target pane
	once the transmission triggers.

	This method is meant to be used in a Glamour script.
	"
	
	self ensureReplacePresentationsStrategy.
	self transmissionStrategy presentationsFactory: aBlock.
	self origins isEmpty
		ifTrue: [ self from: #outer port: #entity ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>andShowIfNone: aBlock [
	"This method accepts a block with one argument. 
	The block will be evaluated with an instance of GLMCompositePresentation.
	
	The block should construct the presentations that go in the composite presentation.
	The composite presentation will be the one that will get installed in the target pane
	once the transmission triggers.
	
	The particularity of this method is that the presentation will get installed in the target
	pane only if the target pane has no presentation already.

	This method is meant to be used in a Glamour script.
	"

	self ensurePresentIfNoneStrategy.
	self transmissionStrategy presentationsFactory: aBlock.
	self origins isEmpty
		ifTrue: [ self from: #outer port: #entity ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>browser [
	^ browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>browser: anObject [
	browser := anObject
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>changePortsAccordingToPaneMapping: newPanesMapping [
	"newPanesMapping is a dictionary with 
	keys given by old panes and values by new panes"
	self destination: ((newPanesMapping at: self destination pane) port: self destination name).

]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>changePortsAccordingToPaneMapping: newPanesMapping fromOldBrowser: aBrowser toNewBrowser: anotherBrowser [
	| newPort |
	"newPanesMapping is a dictionary with 
	keys given by old panes and values by new panes"
	self destination: (self destination copyAccordingToPaneMapping: newPanesMapping inNewBrowser: anotherBrowser).
	self originReferences do: [:each | 
		newPort := each port copyAccordingToPaneMapping: newPanesMapping inNewBrowser: anotherBrowser.
		each port: newPort ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>condition [
	^ condition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>condition: anObject [
	condition := anObject
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>context [
	 context ifNil: [context := OrderedCollection new].
	^context
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>context: aContext [
	 context := aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>destination  [
	 
	^destination
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>destination: aPort  [
	 
	destination := aPort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>ensurePresentIfNoneStrategy [
	self transmissionStrategy class = GLMPresentIfNoneStrategy ifFalse: [
		self transmissionStrategy: (GLMPresentIfNoneStrategy of: self) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>ensureReplacePresentationsStrategy [
	self transmissionStrategy class = GLMReplacePresentationsStrategy ifFalse: [
		self transmissionStrategy: (GLMReplacePresentationsStrategy of: self) ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>from: aPort [
	"Ideally this method would be implemented as
	^ self from: aPaneSymbol port: #selection.
	
	The problem is that beforehand we only had from: which could receive either a symbol for the pane, or an association for the port. This was bad, and now Glamour offers from:port:, but there are still legacy cases of from: being called with an association."

	^ self addActiveOrigin: (self browser resolveOriginPort: aPort)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>from: aPaneSymbol port: aPortSymbol [
	^ self from: (GLMPortIdentifier pane: aPaneSymbol port: aPortSymbol)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>from: aPaneSymbol port: aPortSymbol transformed: aBlock [
	^ (self from: (GLMPortIdentifier pane: aPaneSymbol port: aPortSymbol)) transformation: aBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>from: aPort transformed: aBlock [
	^ (self addActiveOrigin: (self browser resolveOriginPort: aPort)) transformation: aBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>fromOutside: aPortSymbol [
	self deprecated: 'Use fromOutsidePort: instead'.
	^ self fromOutsidePort: aPortSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>fromOutsideEntityPort [
	^ self fromOutsidePort: #entity
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>fromOutsideEntityPortTransformed: aBlock [
	^ self fromOutsidePort: #entity transformed: aBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>fromOutsidePort: aPortSymbol [
	^ self from: #outer port: aPortSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>fromOutsidePort: aPortSymbol transformed: aBlock [
	^ self from: #outer port: aPortSymbol transformed: aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>initialize [
	super initialize.
	transmissionStrategy := GLMNoStrategy new.
	condition := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>meetsCondition [
	<debuggingStone: #transmissionCondition label: 'Transmission condition'>
	| originValues |
	originValues := self originReferences size = 1 
		ifTrue: [ self originReferences first value ] 
		ifFalse: [ GLMMultiValue withAll: (self originReferences collect: [:each | each value]) ].
	^ self condition glamourValue: originValues
]

{
	#category : #'private accessing',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>originReferences [
	"Returns the set of ports (instances of PortReference) the transmission receives its data from"
	^ origins ifNil: [origins := OrderedCollection new]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>originatesAt: aPort [
	^ (self activeOrigins includes: aPort) and: [self meetsCondition]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>origins [
	^ self originReferences collect: [:each | each port]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>passiveOrigins  [
	 
	^(self originReferences select: [:each | each isPassive]) 
		collect: [:each | each port]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>passivelyFrom: aPort [
	^ self addPassiveOrigin: (self browser resolveOriginPort: aPort)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>passivelyFrom: aPaneSymbol port: aPortSymbol [
	^ self passivelyFrom: (GLMPortIdentifier pane: aPaneSymbol port: aPortSymbol)
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>postCopy [
	origins := self originReferences collect: [:each | each copy ].
	destination := destination copy.
	transmissionStrategy := transmissionStrategy copy.
	transmissionStrategy transmission: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>presentations [
	^ self transmissionStrategy presentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>presentations: aCompositePresentation [
	self transmissionStrategy presentations: aCompositePresentation
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>printOn: aStream  [
	 
	aStream 
		nextPutAll: self class name;
		nextPutAll: ' (origins='; 
		nextPutAll: self origins printString; 
		nextPutAll: ' destination='; 
		nextPutAll: self destination printString; 
		nextPut: $)
	 
	
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>to: aPort [
	"Ideally this method would be implemented as
	^ self to: aPaneSymbol port: #entiity.
	
	The problem is that beforehand we only had from: which could receive either a symbol for the pane, or an association for the port. This was bad, and now Glamour offers to:port:, but there are still legacy cases of to: being called with an association."

	^ self destination: (self browser resolveDestinationPort: aPort)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>to: aPaneSymbol port: aPortSymbol [
	^ self to: (GLMPortIdentifier pane: aPaneSymbol port: aPortSymbol)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>toOutside: aPortSymbol [
	self deprecated: 'Use toOutsidePort: instead'.
	^ self toOutsidePort: aPortSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>toOutsidePort: aPortSymbol [
	^ self to: #outer->aPortSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>toWatcher [
	""
	^ self destination: (self browser watcherPane port: #entity)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transformation [
	^ transformation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transformation: anObject  [
	 
	transformation := anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transformed: aBlock [
	self transformation: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transmissionStrategy [
	^ transmissionStrategy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transmissionStrategy: anObject [
	transmissionStrategy := anObject
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transmit [
	self transmitIn: GLMTransmissionContext new
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>transmitIn: aContext [
	self flag: 'The transmitIt: and receive:in: both end up calling notingPresentationChangeDo:. So they should be handled by a surrounding notingPresentationChangeDo:. However, by doing that it seems that we break the morphic updating. No idea why'.
	self destination notingPresentationChangeDo: [
		self transmissionStrategy transmitIn: aContext.
		self destination receive: self in: aContext ].
	self browser notNil ifTrue: [
		self browser announce: GLMTransmissionTriggered new ]
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>value [
	<debuggingStone: #transmissionTransformation label: 'Transmission transformation'>
	| originalValue |
	originalValue := self originReferences size = 1 
		ifTrue: [ self originReferences first value ] 
		ifFalse: [ GLMMultiValue withAll: (self originReferences collect: [:each | each value]) ].
	^ self transformation isNil 
		ifTrue: [ originalValue ] 
		ifFalse: [ self transformation glamourValue: (
			originalValue asGlamorousMultiValue, 
			self origins asGlamorousMultiValue) ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>when: aBlock [
	self condition: aBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmission>>whenKindOf: aClass  [
	 
	self when: [:each | each isKindOf: aClass]
]
