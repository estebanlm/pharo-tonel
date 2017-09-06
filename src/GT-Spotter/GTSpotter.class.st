"
I am  the main model class.

I handle the list of current search steps and provide the main functionality for spawning new search steps or removing old ones.
I maintain search steps as a stack.
 
I  trigger a search when the user enters a query (#setText:from:) and maintain the search text.

To avoid crashes due to exceptions in search processors I can install an exception handler that prints exceptions to the transcript instead of opening a debugger (#beDeployment). Afternatively I can install an exception handler that  propagates exceptions (#beDeployment)
"
Class {
	#name : #GTSpotter,
	#superclass : #Object,
	#instVars : [
		'foundationOrigin',
		'steps',
		'announcer',
		'currentStep',
		'pagerModel',
		'text',
		'isPreviewVisible',
		'isShiftPressed',
		'exceptionHandler',
		'history',
		'processorsFilter'
	],
	#classInstVars : [
		'history',
		'isPreviewVisible',
		'wasOpened'
	],
	#category : #GT-Spotter-Model,
	#timestamp : 'AndreiChis 7/30/2015 17:33'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>cleanUp [
	self resetHistory.
	wasOpened := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>dontShowPreview [

	isPreviewVisible := false
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>exampleInWindow [
	
	^ GTSpotterMorph new
		extent: 400@500;
		doLayout;
		spotterModel: self new;
		openInWindow
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>exampleMC [
	"self exampleMC"
	
	^ GTSpotterMorph new
		extent: 400@500;
		doLayout;
		spotterModel: (self on: MCWorkingCopy allManagers);
		openCenteredInWorld
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>exampleSpotterWithoutMorph [
	<gtExample>
	<label: 'A GTSpotter without UI'>
	
	^ self new
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>exampleWithPreview [
	^ GTSpotterMorph new
		extent: (World width / 2.5 @ (World height / 1.5)) asIntegerPoint;
		spotterModel: self new;
		showPreview;
		openCenteredInWorld
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>exampleWorldMenu [
	
	^ GTSpotterMorph new
		extent: 400@500;
		doLayout;
		spotterModel: (self on: World worldMenu);
		openCenteredInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>extensionsPragma [
	^ #spotterOrder:
]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>gtInspectorExtensionsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Extensions';
		display: [ self spotterExtendingMethods ];
		showOnly: 50;
		format: [ :each | each gtDisplayString ];
		filterOn: [ :text :each | each gtDisplayString includesSubstring: text caseSensitive: false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>history [
	^ history ifNil: [ history := WeakOrderedCollection new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>isPreviewVisible [

	^ isPreviewVisible ifNil: [ isPreviewVisible := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>markOpened [

	wasOpened := true
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Spotter)
		action: [ GTSpotterGlobalShortcut openGlobalSpotter ];
		keyText: 'Shift + Enter';
		order: 0.7;
		parent: #MostUsedTools;
		iconName: #smallFindIcon
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>on: anObject [
	
	^ self new foundationOrigin: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>resetHistory [
	"
	self resetHistory
	"
	^ history := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>showPreview [

	isPreviewVisible := true
]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>spotterExtendingMethods [
	^(SystemNavigation default allBehaviors
		flatCollect: [ :each | 
			(Pragma allNamed: self extensionsPragma in: each) 
				collect: [ :p | p method asRingDefinition ] ])
		sorted
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter class>>wasOpened [

	^ wasOpened ifNil: [ false ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>addStep: aStepModel [

	self steps add: aStepModel.
	self notifyStepAdded: aStepModel
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>addStep: aSpotterStep during: aBlock [
	"Adds aSpotterStep without announcements,
	evaluates aBlock and removes previously added
	step after evaluation.
	May be used to determine if it is possible to dive in
	a candidate by adding a fake step to simulate dive in.
	aSpotterStep must not be nil
	aBlock must not be nil"
	self assert: aSpotterStep isNotNil.
	self assert: aBlock isNotNil.
	
	self steps add: aSpotterStep.
	aBlock ensure: [ 
		self steps remove: aSpotterStep ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>after: afterBlock do: doBlock ifTrue: conditionBlock [
	|value|
	value := conditionBlock brickValue: self.
	afterBlock brickValue: self.
	value ifTrue: [ doBlock brickValue: value ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>after: afterBlock do: doBlock with: withBlock [
	|value|
	value := withBlock brickValue: self.
	afterBlock brickValue: self.
	doBlock brickValue: value
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>announce: anAnnouncement [
	
	self announcer announce: anAnnouncement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>beDebugging [
	self exceptionHandler: GTSpotterDebuggingExceptionHandler new
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>beDeployment [
	self exceptionHandler: GTSpotterDeploymentExceptionHandler new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>currentStep [
	^ currentStep
		ifNil: [ self hasSteps
				ifTrue: [ currentStep := self steps last ]
				ifFalse: [ self newStep origin: self foundationOrigin ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>currentStep: aStepModel [
	
	currentStep := aStepModel.
	self notifyCurrentStepChanged
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>defaultExceptionHandler [
	^ GTSpotterDeploymentExceptionHandler new
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>defaultPagerModel [
	^ GLMPagerModel new
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>defaultStep [
	^ GTSpotterStep new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>exceptionHandler [
	^ exceptionHandler ifNil: [ exceptionHandler := self defaultExceptionHandler ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>exceptionHandler: anObject [
	exceptionHandler := anObject
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>exit [

	self exitDueTo: #unknown
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>exitDueTo: anEventType [

	self notifySpotterExitFor: anEventType
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>filterByMethods: aCollection [
	| filter |
	
	filter := GTSpotterMethodListProcessorFilter new.
	aCollection  do: [ :aMethod |
		filter allowProcessorsFrom: aMethod ].
	self processorsFilter: filter
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>foundationOrigin [
	
	^ foundationOrigin ifNil: [ foundationOrigin := self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>foundationOrigin: anObject [
	
	foundationOrigin := anObject
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>getText [

	^ self text
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>gtDisplayOn: stream [

	stream nextPutAll: 'Spotter'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>gtDisplaySpotterMorphOn: aComposite [
	<gtInspectorPresentationOrder: 50>
	
	aComposite morph 
		title: 'Live';
		display: [ 
			GLMBrick new 
				hSpaceFill;
				vSpaceFill;
				addMorphBack: 
					(GTSpotterMorph new
						spotterModel: self);
				yourself ]
]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>gtInspectorStepsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Steps';
		display: [ self steps ];
		when: [ self steps notEmpty ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>handleExceptionsDuring: aBlock [
	self exceptionHandler handleExceptionsDuring: aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>hasMultipleSteps [

	^ self steps size > 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>hasSelected [
	^ self hasSteps and: [ self currentStep hasSelected ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>hasSteps [
	^ 	self steps isNotEmpty
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>hidePreview [

	self isPreviewVisible ifFalse: [ ^ self ].
	isPreviewVisible := false.
	self class dontShowPreview.
	self notifyHidePreview
	
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>historize: target [

	(target = self or: [ target isNil ])
		ifFalse: [ 
			self history removeAllSuchThat: [ :each | each value = target value ] .
			self history addFirst: target ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>history [
	^ history ifNil: [ self class history ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>history: aWeakCollection [
	history := aWeakCollection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>initialize [
	super initialize.
	
	processorsFilter := GTSpotterSettingsProcessorFilter new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>isEmpty [
	self deprecated: 'Use hasSteps instead'.
	^ self hasSteps not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>isPreviewVisible [

	^ isPreviewVisible ifNil: [ isPreviewVisible := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>isShiftPressed [

	^ isShiftPressed ifNil: [ isShiftPressed := false ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>menu [

	^ nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>newStep [

	^ self defaultStep
		spotter: self
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyActOn: anObject for: anEventType [

	self announce: (GTSpotterActOn new 
		element: anObject;
		eventType: anEventType)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyCandidateSelected: anObject for: anEventType [

	self announce: (GTSpotterSelectedCandidateChanged new 
		select: anObject;
		eventType: anEventType)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyCategorySelected: aProcessor [

	self announce: (GTSpotterCategorySelected new category: aProcessor)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyContextChangedFrom: aPreviousContext to: aCurrentContext [
	self announce: (GTSpotterContextChanged new
		previous: aPreviousContext;
		current: aCurrentContext;
		yourself)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyCurrentStepChanged [

	self announce: GTSpotterCurrentStepChanged new
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyDiveIn: anObject for: anEventType [

	self announce: (GTSpotterDiveInElement new 
		element: anObject;
		eventType: anEventType )
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyDiveInCategory: aProcessor for: anEventType [

	self announce: (GTSpotterDiveInCategory new 
		category: aProcessor;
		eventType: anEventType)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyDiveOut: anObject [

	self announce: (GTSpotterDiveOut new element: anObject)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyHideHints [

	self announce: GTSpotterHideHints new
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyHidePreview [

	self announce: GTSpotterHidePreview new
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyRevealHints [

	self announce: GTSpotterRevealHints new
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifySearchFinishedFor: aString processors: aCollectionOfProcessors [

	self announce: (GTSpotterSearchFinished new 
								query: aString;
								processors: aCollectionOfProcessors;
								yourself)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyShowPreview [

	self announce: GTSpotterShowPreview new

	
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifySpotterExitFor: anEventType [

	self announce: (GTSpotterExitAnnouncement new
		eventType: anEventType)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyStepAdded: aStep [

	self announce: (GTSpotterStepAdded new stepModel: aStep)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>notifyStepPopped [

	self announce: GTSpotterStepPopped new
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>onPagePopped [
	
	self steps size > 0 ifTrue: [
		self currentStep: self steps last ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>pagerModel [

	^ pagerModel ifNil: [
		pagerModel := self defaultPagerModel defaultNumberOfVisiblePages: 1.
		pagerModel announcer when: GLMPagePoped send: #onPagePopped to: self.
		pagerModel ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>popStep [

	"there always should be minimum one step left"
	(self steps size > 1)
		ifTrue: [
			self
				after: [ self steps removeLast ]
				do: [ :o | self notifyDiveOut: o ]
				with: self currentStep origin.
			self notifyStepPopped.
			"perform pane popping only after we scrolled to the penultimate pane, so user doesn't see blinking"
			self pagerModel
				scrollToPane: self steps size
				callback: [ self pagerModel popPane: false ] ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>popUntil: aStep [

	[ self steps last = aStep ]
		whileFalse: [ self popStep ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>processorsFilter [

	^ processorsFilter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>processorsFilter: aFilter [
   "Set the filter for determining whether or not processors get added to a step."

	processorsFilter := aFilter
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>pushStep: stepModel [
	
	self addStep: stepModel.
	"updating current step"
	self currentStep: stepModel
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>requestNextCategoryStepWith: aProcessorLink for: anEventType [
	|collection|
	
	collection := aProcessorLink processor allFilteredCandidates
		collect: [ :each | each asSpotterCandidateLink renderingProcessor: aProcessorLink ].
		
	self requestNextStepWith: collection for: anEventType
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>requestNextStepWith: origin for: anEventType [

	text := ''.
	self pushStep: (self newStep origin: origin; event: anEventType; yourself).
	self steps last process: nil
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>setText: aText from: aView [
	"I am the main entry point for triggering a new search in the current step."
	
	self steps isEmpty
		"by default there are no steps, so we need to create one based on foundation origin"
		ifTrue: [ self addStep: ( self newStep origin: self foundationOrigin ) ].

	(aText asString isEmpty and: [ self text isEmpty not ])
		ifTrue: [ self currentStep process: nil ]
		ifFalse: [ self currentStep process: aText asString ].
	
	text := aText asString asText.
	^ true
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>shiftPressed: aBoolean [

	self isShiftPressed = aBoolean ifTrue: [ ^ self ].
	
	isShiftPressed := aBoolean.
	
	SmalltalkImage current vm canHandleShiftPressed
		ifTrue: [ ^ isShiftPressed := false ].

	self isShiftPressed
		ifTrue: [ self notifyRevealHints ]
		ifFalse: [ self notifyHideHints ]

	
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>showPreview [

	self isPreviewVisible ifTrue: [ ^ self ].
	isPreviewVisible := true.
	self class showPreview.
	self notifyShowPreview
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>steps [

	^ steps ifNil: [ steps := OrderedCollection new ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>terminateProcessors [

	self steps do: [ :each | each terminateProcessors ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>text [

	^ text ifNil: [ text := '' asText ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotter>>togglePreview [

	self isPreviewVisible
		ifTrue: [ self hidePreview ]
		ifFalse: [ self showPreview ]
]
