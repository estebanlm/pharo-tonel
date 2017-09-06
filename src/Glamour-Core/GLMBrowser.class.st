"
The Browser is one of the core components in Glamour.

It contains panes and transmissions between their ports. These transformations can either be explicitely defined by the user (such as in the Tabulator) or implicitely defined (such as in the Finder).

Browsers serve as composition managers. They determine when and under which conditions transmissions should be triggered and how they connect the ports of panes. In return, panes inform the browsers when event occur on their ports so that the browser can make an informed decission on what to do.

A Browser is a Presentation which means that it can be nested into other browsers.
"
Class {
	#name : #GLMBrowser,
	#superclass : #GLMPresentation,
	#instVars : [
		'transmissions',
		'panes',
		'initialExtent',
		'watcherPane'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 2/4/2011 17:50'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser class>>defaultStatusbarPane [
	^ #'_statusbar'
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser class>>withStatusbar [
	^ self new addStatusbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>addPane: aPane [
	aPane browser: self.
	self panes add: aPane.
	self hasStatusbar ifTrue: [
		self addDefaultStatusbarTransmissionFrom: aPane ].
	^ aPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>addTransmission: aTransmission  [
	aTransmission browser: self.
	^ self transmissions addLast: aTransmission
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>close [
	self announce: GLMBrowserClosed new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>context [

	^OrderedCollection new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>custom: aPresentation  [
	 
	self subclassResponsibility
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>defaultRenderer  [
	 
	^GLMRenderer subclasses first new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>initialExtent [

	^ initialExtent ifNil: [ initialExtent := RealEstateAgent standardWindowExtent]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>initialExtent: aPoint [

	initialExtent := aPoint
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>initialize [
	super initialize.
	panes := OrderedCollection new.
	transmissions := OrderedCollection new.
	statusPane := nil.
	watcherPane := nil
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>initializeScriptingDefaults  [
	"Initialize some default behavior if the user did not explcitly script it. 
 
	Subclasses can use this to create a default startup transmission or show 
	a default pane or something like that." 
	
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>lastActivePresentation: aPresentation [
	"this hook gets triggered every time, a presentation gets activated in a pane.
	by default the browser does nothing.
	specific browsers could use this hook to provide special behavior"
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>open  [
	 
	^self openWith: self defaultRenderer
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>openOn: anObject  [
	 
	^self 
		openOn: anObject 
		with: self defaultRenderer
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>openOn: anObject with: aRenderer  [
	 
	self startOn: anObject. 
	^ self openWith: aRenderer
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>openWith: aRenderer  [
	 
	^ aRenderer open: self
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>outerPortEvent: aPortEvent   [
	super outerPortEvent: aPortEvent.	
	aPortEvent hasChanged ifTrue: [
		(self transmissions select: [:each | 
			(each originatesAt: aPortEvent port) and: [
				( aPortEvent transmissionContext includesPort: each destination) not ]]) 
			do: [:each | each transmitIn: aPortEvent transmissionContext copy ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>panes [
	^ panes ifNil: [	panes := OrderedCollection new ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>postCopy [
	| newPane newPanes newPanesMapping newTransmission oldPane oldWatcherPane |
	super postCopy.
	"needed for setting the right panes for the new transmissions"
	newPanesMapping := Dictionary new. 
	newPanes := OrderedCollection new.
	self panes do: [:each | 
		newPane := each copy.
		newPane browser: self.
		newPanes addLast: newPane.
		newPanesMapping at: each put: newPane ].
	oldPane := self pane.
	oldWatcherPane := self watcherPane.
	watcherPane := nil.
	pane := nil.
	newPanesMapping at: oldPane ifAbsentPut: [ self pane ].
	newPanesMapping at: oldWatcherPane ifAbsentPut: [ self watcherPane ].
	self flag: 'we should also copy the values of ports from pane and watcherPane'.
	transmissions := self transmissions collect: [ :each | 
		newTransmission := each copy.
		newTransmission 
			changePortsAccordingToPaneMapping: newPanesMapping 
			fromOldBrowser: nil
			toNewBrowser: self.
		newTransmission ].
	panes := newPanes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>removeAllPanes [
	self panes do: [:each | each unregisterFromAllAnnouncements].
	^ self panes removeAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>removeLastPane [
	self panes last unregisterFromAllAnnouncements.
	^ self panes removeLast
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>removePane: aPane [
	aPane unregisterFromAllAnnouncements.
	self panes remove: aPane
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>resetAnnouncer [
	super resetAnnouncer.
	self panes do: [:each | each resetAnnouncer ]
]

{
	#category : #scripting-private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>resolveDestinationPort: aPortReference  [
	self flag: 'this is a temporary hack due to initializeScripting transmitting directly a port'.
	(aPortReference isKindOf: GLMPort) ifTrue: [ ^ aPortReference ].
	^self resolvePort: aPortReference asGlamourTargetIdentifier defaultPortName: #entity
]

{
	#category : #scripting-private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>resolveOriginPort: aPortReference  [
	 
	^self resolvePort: aPortReference asGlamourOriginIdentifier defaultPortName: #selection
]

{
	#category : #scripting-private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>resolvePort: aPortReference defaultPortName: aSymbol  [
	^ aPortReference paneName = #outer 
		ifTrue: [
			(GLMPresentationBoundPort new) 
						presentation: self; 
						name: aPortReference portName;
						yourself] 
		ifFalse: [
			(self paneNamed: aPortReference paneName) port: aPortReference portName].
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>startOn: anObject  [
	 
	self initializeScriptingDefaults. 
	self entity: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>transmissions  [
	^ transmissions
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>transmit [
	^ self addTransmission: (GLMTransmission new browser: self; yourself)
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>unregisterFromAllAnnouncements [
	super unregisterFromAllAnnouncements.
	self panes do: [:each | 
		each unregisterFromAllAnnouncements ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>update  [
	self panes do: [:each | each update ].
	self announce: (GLMPresentationUpdated new presentation: self).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>watcherPane [
	^ watcherPane ifNil: [watcherPane := GLMPane named: #'_watcher']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>watcherPane: anObject [
	watcherPane := anObject 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBrowser>>withAllPanesAndPresentationsDo: aBlock [
	super withAllPanesAndPresentationsDo: aBlock.
	self panes do: [:each | each withAllPanesAndPresentationsDo: aBlock ]
]
