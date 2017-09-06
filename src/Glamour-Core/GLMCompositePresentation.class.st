"
A composite presentation offers means to control the composition of multiple presentations by providing the arrangement of these presentations.
"
Class {
	#name : #GLMCompositePresentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'presentations',
		'arrangement'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 2/20/2010 14:51'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation class>>gtExampleCompositePresentation [
	<gtExample>

	^ self new
		list;
		table;
		tree
]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation class>>openOn: anObject  [
	^ self new openOn: anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>accordionArrangement [
	^ self arrangement: GLMAccordionArrangement new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>accumulator  [
	^ self custom: GLMAccumulator new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>actionList [
	^ self custom: GLMActionListPresentation new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>add: aPresentation [
	self pane notingPresentationChangeDo: [
		self presentations add: aPresentation.
		aPresentation pane: self pane ].
	^ aPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>allSatisfy: aBlock [
	^ self presentations allSatisfy: aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>anySatisfy: aBlock [
	^ self presentations anySatisfy: aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>arrangement [
	^ arrangement ifNil: [arrangement := GLMTabbedArrangement of: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>arrangement: anArrangement [
	anArrangement composite: self.
	^ arrangement := anArrangement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>at: aNumber [
	^ self presentations at: aNumber 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>clear [
	arrangement := nil.
	presentations := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>collect: aBlock [
	^ self copy presentations: (self presentations collect: aBlock ); yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>compose [
	"by default this method is empty.
	override this method in subclasses to define a custom browser"
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>composite: aBlock [
	| composite |
	composite := GLMCompositePresentation new.
	aBlock value: composite.
	^ self custom: composite
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>custom: aPresentation [
	^ self add: aPresentation "sourceContext: thisContext sender"
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>defaultRenderer  [
	 
	^GLMRenderer subclasses first new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>diff [
	^ self custom: GLMDiffPresentation new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>do: aBlock [
	^ self presentations do: aBlock 
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>dropDownList [
	^ self custom: GLMDropDownListPresentation new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>dynamic [
	^ self custom: GLMDynamicPresentation new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>finder [
	^ self custom: GLMFinder new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>first [
	^ self presentations first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>includes: aPresentation [
	^ self presentations includes: aPresentation 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>initialize  [
	super initialize.
	self compose
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>initializePresentation [

	super initializePresentation.
	self do: [:each| each initializePresentation]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>isEmpty [
	^ self presentations isEmpty
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>label [
	^ self custom: GLMLabelPresentation new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>last [
	^ self presentations last
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>list  [
	^ self custom: GLMListPresentation new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>matchingPresentations [
	^ self presentations select: [:each | each matches]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>morph [
	^ self custom: GLMMorphPresentation new
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>open  [
	 
	^self openWith: self defaultRenderer
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>openOn: anObject  [
	 
	^self 
		openOn: anObject 
		with: self defaultRenderer
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>openOn: anObject with: aRenderer  [
	 
	self startOn: anObject. 
	^ self openWith: aRenderer
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>openWith: aRenderer  [
	 
	^ aRenderer open: self
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>outerPortEvent: aPortEvent [
	super outerPortEvent: aPortEvent.
	self do: [:each| each outerPortEvent: aPortEvent]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>pane [
	^ pane ifNil: [
		pane := (GLMPane named: 'root' in: GLMNoBrowser new) 
				presentations: self; 
				yourself]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>pane: aPane  [
	super pane: aPane.
	self presentations do: [:each | each pane: aPane ]
]

{
	#category : #comparison,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>postCopy [
	super postCopy.
	presentations ifNotNil: [ :arg | 
		presentations := presentations collect: [ :each | each copy ] ].
	arrangement ifNotNil: [ :arg | 
		arrangement := arrangement copy.
		arrangement composite: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>presentations [
	^ presentations ifNil: [presentations := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>presentations: anObject [
	presentations := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>renderGlamorouslyOn: aRenderer [
	"we delegate to the arrangement to dispatch the type of the actual arrangement of the nested presentations"
	self registerAnnouncements.
	^ self arrangement renderGlamorouslyOn: aRenderer
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>resetAnnouncer [
	super resetAnnouncer.
	self presentations do: [:each | each resetAnnouncer ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>second [
	^ self presentations second
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>select: aBlock [
	^ self presentations select: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>size [
	^ self presentations size
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>smalltalkCode [
	self deprecated: 'Use #pharoMethod (if you need to display a method) 
	or #pharoScript (if you need to display snippets of code that do not belong to a method)'.
	^ self custom: GLMSmalltalkCodePresentation new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>stackedArrangement [
	^ self stackedVerticallyArrangement
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>stackedVerticallyArrangement [
	^ self arrangement: (GLMStackedVerticallyArrangement of: self)
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>startOn: anObject  [
	
	self entity: anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>tabbedArrangement [
	^ self arrangement: GLMTabbedArrangement new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>table [
	^ self custom: GLMTablePresentation new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>tabulator [
	^ self custom: GLMTabulator new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>text  [
	^ self custom: GLMRubricTextPresentation new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>tree  [
	^ self custom: GLMTreePresentation new
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>unregisterFromAllAnnouncements [
	super unregisterFromAllAnnouncements.
	self presentations do: [:each | each unregisterFromAllAnnouncements ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>update [
	self pane ports do: [:each |
		(self validate: each value on: each) ifFalse: [each resetValue] ].
	self presentations do: [ :each | each update ].
	self announce: (GLMPresentationUpdated new presentation: self).
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>verticallyStackedArrangement [
	^ self stackedVerticallyArrangement
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>withAllPanesAndPresentationsDo: aBlock [
	super withAllPanesAndPresentationsDo: aBlock.
	self do: [:each | each withAllPanesAndPresentationsDo: aBlock ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositePresentation>>wrapper [
	^ self custom: GLMWrapper new
]
