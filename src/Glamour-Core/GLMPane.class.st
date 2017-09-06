"
A GLMPane represents the ""physical"" building block of a browser. A pane is presented using a composite presentation (held in the presentations instance var).

It announces:
- GLMMatchingPresentationsChanged
- GLMPresentationsChanged

Instance Variables
	browser:		Browser
	lastActivePresentation:		Presentation
	name:		Symbol
	ports:		Collection of Ports
	presentations:		CompositePresentation
"
Class {
	#name : #GLMPane,
	#superclass : #GLMLoggedObject,
	#instVars : [
		'browser',
		'name',
		'presentations',
		'ports',
		'lastActivePresentation',
		'allowedToNotePresentationsChanged',
		'cachedMatchingPresentations'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 2/15/2011 11:03'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane class>>in: aBrowser  [
	
	^self new initializeIn: aBrowser
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane class>>named: aString  [
	^self new initializeNamed: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane class>>named: aString in: aBrowser [

	^self new initializeNamed: aString in: aBrowser 

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane class>>portClass  [
	 
	^GLMPanePort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>addPresentation: aPresentation [
	self addPresentations: (OrderedCollection with: aPresentation)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>addPresentationSilently: each [
	^ presentations
		add:
			(each
				pane: self;
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>addPresentations: aCollection [
	self notingPresentationChangeDo: [ 
		aCollection do: [ :each | self addPresentationSilently: each ] ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>asGlamorousPane  [
	 
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>browser  [
	 
	^browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>browser: aBrowser [
	browser := aBrowser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>cachedMatchingPresentations [
	^ cachedMatchingPresentations ifNil: [ cachedMatchingPresentations := self matchingPresentations ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>cachedMatchingPresentations: anObject [
	^ cachedMatchingPresentations := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>clearIn: aContext  [
	self notingPresentationChangeDo: [
		self presentations clear.
		self ports do: [:each | each value: nil in: aContext copy ]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>defaultName [

	^'undefined'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>hasBrowser  [
	 
	^self browser isNil not
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>initialize [
	super initialize.
	ports := OrderedCollection new.
	presentations := GLMCompositePresentation new pane: self; yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>initializeIn: aBrowser  [
	
	self initializeNamed: self defaultName in: aBrowser
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>initializeNamed: aString  [
	self initializeNamed: aString in: GLMNoBrowser new  
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>initializeNamed: aString in: aBrowser  [
	self initialize.
	name := aString ifNil: [ self defaultName ].
	browser := aBrowser
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>isAllowedToNotePresentationsChanged [
	^ allowedToNotePresentationsChanged ifNil: [allowedToNotePresentationsChanged := true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>isLastActivePresentation: aPresentation [
	^ self lastActivePresentation notNil and: [ 
		aPresentation title = self lastActivePresentation title ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>lastActivePresentation [
	^ lastActivePresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>lastActivePresentation: aPresentation [
	(self port: #activePresentation) value: aPresentation.
	lastActivePresentation := aPresentation.
	self browser lastActivePresentation: aPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>matchingPresentations [
	^ cachedMatchingPresentations := presentations matchingPresentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>name  [
	 
	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>name: aString [
	name := aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>notingPresentationChangeDo: aBlock [
	"Executes aBlock. If during the execution of the block one of my presentations change, I will emit announces. I also take care of not entering an infinite loop."
	| oldPresentations oldMatchingPresentations | 
	self isAllowedToNotePresentationsChanged ifFalse: [
		aBlock value.
		^ self].
	"this should create a context and then check for it before announcing.
	Like this we can deal with the problem of announcing the same announcement twice"
	allowedToNotePresentationsChanged := false.
	
	oldPresentations := presentations presentations copy. 
	oldMatchingPresentations := self cachedMatchingPresentations.
	aBlock value. 
	presentations presentations  ~= oldPresentations ifTrue: [
		self announce: ((GLMPresentationsChanged new) 
						pane: self; 
						oldPresentations: oldPresentations; 
						yourself)]. 
	self matchingPresentations ~= oldMatchingPresentations ifTrue: [
		self announce: ((GLMMatchingPresentationsChanged new) 
						pane: self; 
						oldMatchingPresentations: oldMatchingPresentations; 
						yourself)].
	allowedToNotePresentationsChanged := true.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>port: aSymbol [
	"returns the port with the given name"
	^ ports detect: [ :each | each name = aSymbol ] ifNone: [
		ports addLast: (
			(self class portClass new) 
						pane: self; 
						name: aSymbol; 
						yourself) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>portEvent: aPortEvent [

	"we unregister all presentations from announcements because they will get replaced anyway"
	aPortEvent portName = #entity ifTrue: [ self unregisterFromAllAnnouncements ].
	self browser innerPortEvent: aPortEvent.
	self presentations outerPortEvent: aPortEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>ports [
	^ ports
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>postCopy [
	| newPort |
	super postCopy.
	self flag: 'self unregisterFromAllAnnouncements ?'.
	presentations := presentations copy.
	ports := ports collect: [:each | 
		newPort := each copy.
		newPort pane: self.
		self flag: 'what about value?'.
		newPort ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>presentations [
	^ presentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>presentations: aCompositePresentation [
	self notingPresentationChangeDo: [
		presentations pane: nil.
		presentations resetAnnouncer.
		aCompositePresentation pane: self.
		presentations := aCompositePresentation.
		presentations initializePresentation ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self identityHash printString;
		space;
		nextPutAll: self name;
		nextPut: $)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>renderGlamorouslyOn: aRenderer  [
	 
	^aRenderer renderPane: self
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>resetAnnouncer [
	super resetAnnouncer.
	self presentations do: [ :each | each resetAnnouncer ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>unregisterFromAllAnnouncements [
	self presentations unregisterFromAllAnnouncements
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>update  [
	self notingPresentationChangeDo: [
		"nothing in particular. 
		just make sure that matching presentations are recomputed"].
	self presentations do: [ :each | each update ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>updateToolbar [

	self announce: (GLMPresentationToolbarUpdated new presentation: self presentations)
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>withAllPanes [
	| result |
	result := OrderedCollection new.
	self withAllPanesAndPresentationsDo: [:each |
		(each isKindOf: GLMPane) ifTrue: [ result add: each ]].
	^ result
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>withAllPanesAndPresentationsDo: aBlock [
	aBlock value: self.
	self presentations withAllPanesAndPresentationsDo: aBlock
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPane>>withAllPresentations [
	| result |
	result := OrderedCollection new.
	self withAllPanesAndPresentationsDo: [:each |
		(each isKindOf: GLMPresentation) ifTrue: [ result add: each ]].
	^ result
]
