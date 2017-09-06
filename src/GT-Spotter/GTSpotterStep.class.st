"
It models one step in the spotter search.

A step knows:
- the origin object 
- the active processors that handle the query, and the candidates
- the selected candidate, and
- the list of all filtered candidates

It also knows the stream through which the list of candidates is affected.

The key method is process:
"
Class {
	#name : #GTSpotterStep,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'processors',
		'origin',
		'context',
		'selected',
		'stream',
		'candidates',
		'asyncTask',
		'spotter',
		'lastSearchContext',
		'event'
	],
	#category : #GT-Spotter-Model,
	#timestamp : 'TudorGirba 11/26/2014 15:13'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep class>>gtExampleBasic [
	<gtExample>
	^ self new
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>actDueTo: anEventType [
	"Perform an action associated with currently selected item.
	(can be triggered by doubleClick: or keyboard Enter press)"
	
	self
		assert: [ self hasSelected ]
		description: [ 'Spotter can not perform an action due to ', anEventType asString, ' if there is no selected candidate' ].

	self spotter
		historize: self selected;
		notifyActOn: self selectedCandidate for: anEventType.
	self selectedCategory actOn: self selectedCandidate for: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>addProcessor: aProcessor [

	self processors add: aProcessor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>asyncTask [

	^ asyncTask ifNil: [ asyncTask := self defaultTask ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>basicRelevantProcessorsProcess: aSpotterContext [
	self basicRelevantProcessorsProcess: aSpotterContext do: [ :processor | 
		processor filterInContext: aSpotterContext ].
	aSpotterContext continueFilter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>basicRelevantProcessorsProcess: aSpotterContext do: aBlock [
	aSpotterContext text substrings 
		detect: [ :each | each beginsWith: '#' ]
		ifFound: [ :categoryQuery | 
			| categoryQueryPrefix |
			aSpotterContext text: (aSpotterContext text copyReplaceAll: categoryQuery with: '').
			categoryQueryPrefix := categoryQuery allButFirst asLowercase.
			self processors 
				select: [ :each | 
					self 
						processor: each 
						isRelevantForQuery: categoryQueryPrefix ]
				thenDo: aBlock ]
		ifNone: [ 
			self processors do: aBlock ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>canDiveIn: aCandidate [
	| newFakeStep canDiveIn|
	canDiveIn := false.
	newFakeStep := self spotter newStep origin: self origin.
	self spotter
		addStep: newFakeStep
		during: [ aCandidate spotterProcessorsFor: newFakeStep.
			canDiveIn := newFakeStep processors notEmpty ].
	^ canDiveIn
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>canDiveInSelectedCandidate [

	^ self canDiveIn: self selected candidate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>candidates [

	^ candidates ifNil: [
		candidates := GTSpotterCandidatesList new.
		candidates announcer subscribe: GTSpotterCandidateAdded send: #onCandidateAdded to: self.
		candidates announcer subscribe: GTSpotterAllCandidatesAdded send: #onCandidateAdded to: self.
		candidates announcer subscribe: GTSpotterAllCandidatesRemoved do: [ self deselect ].
		candidates ]
]

{
	#category : #processing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>configureProcessorsStartingAt: anIndex with: aConfigurationBlock [
	"Execute aConfigurationBlock with all processors starting at anIndex.
	(this assumes processors are stored in an OrderedCollection that captures the
	orderin which they are added to the step.)"
	
	(anIndex > self processors size) ifTrue: [ ^ self ].
	anIndex to: self processors size do: [ :processorIndex |
		aConfigurationBlock value: (self processors at: processorIndex) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>context [

	^ context ifNil: [ context := self newContextForQuery: nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>context: aGTSpotterContext [
	context := aGTSpotterContext
]

{
	#category : #'accessing - defaults',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>defaultStream [
	^ GTSpotterUIThreadStream new
]

{
	#category : #'accessing - defaults',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>defaultTask [
	^ GLMAsyncTask new
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>deselect [
	"Deselects a candidate without notifying anyone"

	selected := nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>diveIn [
	self diveInDueTo: #undefined
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>diveInCategory [
	"dive in category of selected candidate"
	^ self diveInCategoryDueTo: #unknown
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>diveInCategory: aProcessor dueTo: anEventType [
	"dive in specified aCategory"

	self spotter
		requestNextCategoryStepWith: (self candidates getProcessorLink: aProcessor) for: #diveInCategory;
		notifyDiveInCategory: aProcessor for: anEventType
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>diveInCategoryDueTo: anEventType [
	"dive in category of selected candidate"

	self diveInCategory: self selected processor dueTo: anEventType
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>diveInDueTo: anEventType [
	self canDiveInSelectedCandidate ifTrue: [ 
		self spotter
			historize: self selected;
			requestNextStepWith: self selected candidate for: #diveIn;
			notifyDiveIn: self selected candidate for: anEventType ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>event [
	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>event: anObject [
	event := anObject
]

{
	#category : #'accessing - dynamic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>exceptionHandler [
	^ GTCurrentSpotterExceptionHandler value ifNil: [ self spotter exceptionHandler ]
	" #ifNil: is necessary because the sender chain of #spotterProcessorsFor:pragma: may have multiple callees outside of the exception handler (async) ... so we have to provide a global but yet easy fallback "
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>exit [

	self spotter exit
]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>gtInspectorProcessorsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Processors';
		display: [ self processors ];
		format: #gtDisplayString;
		when: [ self spotter notNil ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>hasCandidates [
	"Return true if there are any candidates in all categories,
	false otherwise"
	<return: #Boolean>
	
	^ self candidates isNotEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>hasPreviousNavigationFromClass: aClass [
	"Return true if origin of the previous step is kind of aClass.
	Return false if there is no previous step or if origin is not a kind of aClass"
	<return: #Boolean>
	
	^ self hasPreviousStep and: [
		self previousStep origin isKindOf: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>hasPreviousStep [
	"Return true if there is previous step,
	meaning that I am not a first step in spotter,
	false otherwise"
	<return: #Boolean>
	
	^ self spotter hasSteps
		and: [ self spotter steps first ~= self ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>hasSelected [
	"Return true if there is a selected candidate, false otherwise"
	<return: #Boolean>
	
	^ selected isNotNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>isCategorySelected: aProcessor [
	"Return true if a category assigned to aProcessor is currently selected,
	false otherwise"
	<return: #Boolean>
	
	^ self hasSelected and: [ self selected processor == aProcessor ]
]

{
	#category : #zz-deprecated,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>isEmpty [
	self deprecated: 'Use hasCandidates instead'.
	^ self hasCandidates not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>isSelected: aCandidateLink [
	"Return true if aCandidateLink is currently selected,
	false otherwise"
	<return: #Boolean>
	
	^ self hasSelected and: [ self selected == aCandidateLink ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>listProcessor [
	| processor |
	processor := GTSpotterCandidatesListProcessor new.
	self addProcessor: processor.
	^ processor
]

{
	#category : #processing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>newContextForQuery: aString [
	^ GTSpotterContext new 
		step: self;
		stream: self stream;
		text: aString;
		search: aString;
		yourself
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>notifySelectedCandidateChanged: aDoubleLink [
	
	self notifySelectedCandidateChanged: aDoubleLink for: #unknown
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>notifySelectedCandidateChanged: aCandidateLink for: anEventType [
	| aCandidate |
	
	self
		assert: [ aCandidateLink isNotNil ]
		description: [ 'aCandidateLink must not be nil' ].

	aCandidate := aCandidateLink candidate.
	self announcer announce: (GTSpotterSelectedCandidateChanged new select: aCandidate).
	self spotter notifyCandidateSelected: aCandidate for: anEventType
]

{
	#category : #'event processing',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>onCandidateAdded [
	"Select first candidate item in the list if there is no already selected
	candidate and candidate list has at least one candidate"
	(self hasSelected or: [ self candidates isEmpty ])
		ifFalse: [ self selectFirst ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>origin [

	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>origin: anObject [

	origin := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>previousProcessorFrom: aCollection [
	aCollection do: [ :each | 
		each asSpotterCandidateLink processor ifNotNil: [ ^ each processor ] ]. " we assume they are all identical "
	^ GTSpotterCandidatesListProcessor new
		title: 'Items';
		filter: GTFilterSubstring;
		yourself
]

{
	#category : #'accessing - dynamic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>previousStep [
	"Return a spotter step before me which must exist,
	otherwise behavior is undefined."
	<return: #GTSpotterStep>
	self assert: self hasPreviousStep.
	
	^ self spotter steps at: 
			(self spotter steps indexOf: self) - 1
]

{
	#category : #processing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>process: aString [
	"I do not accept empty queries or the same queries as before.
	If nil is passed, than an empty string will be processed. This approach is used to
	destinguish when user deletes last character in the search and when search field became
	empty after spawning new step"
	
	"no need to search for the same query"
	(self context matches: aString) ifTrue: [ ^ self ].
	self context: (self newContextForQuery: aString).
	
	" updating timestamp in a stream, to prevent candidates from old process being shown "
	self stream updateTimestamp.
	
	self asyncTask
		execute: [ :aCurrentContext |
			self spotter notifyContextChangedFrom: lastSearchContext to: self context.
			self processContext: aCurrentContext ]
		withArguments: { self context. }
		callback: [
			lastSearchContext := self context. 
			self spotter notifySearchFinishedFor: aString processors: self processors ]
		"added small delay before actual searching. It makes spotter faster :)"
		delay: 200
]

{
	#category : #processing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>processContext: aSpotterContext [
	self spotter handleExceptionsDuring: [ 
		self stream removeAllCandidates.
		self relevantProcessorsProcess: aSpotterContext  ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>processor: aProcessor isRelevantForQuery: aString [
	| trimmedProcessorTitle |
	trimmedProcessorTitle := aProcessor title asLowercase 
										copyReplaceAll: String space
										with: ''.
	^ trimmedProcessorTitle beginsWith: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>processors [

	^ processors ifNil: [ 
		processors := OrderedCollection new.
		self origin spotterProcessorsFor: self.
		"this is a hack. we do it here just because we need to store the
		category name in the brick after the processors have been created"
		processors do: [ :each | 				
			self candidates addProcessor: each ].
		processors ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>processors: aCollection [

	processors := aCollection
]

{
	#category : #'accessing - dynamic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>processorsFilter [

	^ self spotter processorsFilter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>relevantProcessorsProcess: aSpotterContext [
	[ self basicRelevantProcessorsProcess: aSpotterContext ]
		on: Error
		do: [ :exception | 
			self exceptionHandler 
				handleException: exception 
				do: [ ('[Spotter] Exception in process: ', exception asString) logCr ] ]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>select: aCandidateLink [
	"Select a given candidate link due to unknown reason.
	It is not recommended to use this method, unless you really need to.
	Note: use #select:dueTo: to allow better usage statistics"
	
	self select: aCandidateLink dueTo: #unknown
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>select: aCandidateLink dueTo: anEventType [
	"Select a given candidate due to provided event type.
	A selection reason is used for statistical purposes and helps us
	better understand how users use spotter and as result improve it.
	aCandidateLink must not be nil.
	anEventType must not be nil"

	self
		assert: [ aCandidateLink isNotNil ]
		description: [ 'Candidate link must not be nil' ].

	self
		assert: [ aCandidateLink processor isNotNil ]
		description: [ 'Candidate must have assigned category (processor)' ].
	
	"A given candidate is already selected, do nothing"
	(self isSelected: aCandidateLink)
		ifTrue: [ ^ self ].

	self spotter
		after: [
			selected := aCandidateLink.
			self notifySelectedCandidateChanged: aCandidateLink for: anEventType ]
		do: [ self spotter notifyCategorySelected: self selected processor ]
		ifTrue: [ (self isCategorySelected: aCandidateLink processor) not ]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectFirst [
	"Select the first candidate.
	Note: there must be at least one candidate in order to select first,
	make sure to check #hasCandidates before using me"
	self
		assert: [ self candidates isNotEmpty ]
		description: [ 'There must be at least one candidate in order to select the first' ].

	self select: self candidates head
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectNextCategory [
	| currentCategory nextCategory |

	currentCategory := self candidates getProcessorLinkByCandidateLink: self selected.
	nextCategory := self candidates nextProcessorLinkOf: currentCategory.
	
	self select: ((currentCategory = nextCategory)
		ifTrue: [ nextCategory tailLink ]
		ifFalse: [ nextCategory headLink ])
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectNextDueTo: anEventType [
	
	self select: self selected next dueTo: anEventType
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectPreviousCategory [
	|currentCategory previousCategory|
	self selected ifNil: [ ^ self ].
	
	currentCategory := self candidates getProcessorLinkByCandidateLink: self selected.
	previousCategory := self candidates previousProcessorLinkOf: currentCategory.
	
	self select: previousCategory headLink
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectPreviousDueTo: anEventType [

	self select: self selected previous dueTo: anEventType
]

{
	#category : #'accessing - selected',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selected [
	"Return a candidate link (represented by double link) to allow fast access to
	next and previous candidate. In order to get actual candidate object behind
	the link send #candidate to it.
	selected can not be nil (always use hasSelected before using me)"
	<return: #GTSpotterCandidateLink>
	self
		assert: [ selected isNotNil ]
		description: [ 'Selected candidate can not be accessed where there is no one' ].
	
	^ selected
]

{
	#category : #'accessing - selected',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectedCandidate [
	"Return an actual candidate object behind candidate link. 
	Note: Since selected link can not be accessed if there is no selected one,
	always check #hasSelected before using me"
	<return: #Object>

	^ self selected candidate
]

{
	#category : #'accessing - selected',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>selectedCategory [
	"Return a category processor that produced a currently selected candidate.
	Note: Since selected link can not be accessed if there is no selected one,
	always check #hasSelected before using me"
	<return: #GTSpotterProcessor>
	
	^ self selected processor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>spotter [

	^ spotter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>spotter: aSpotter [
	spotter := aSpotter 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>stream [

	^ stream ifNil: [
		stream := self defaultStream.
		stream
			onAddedSelector: #addCandidate:in:;
			onRemoveSelector: #removeAllCandidatesOf:;
			receiver: self candidates.
		stream ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStep>>terminateProcessors [

	self asyncTask terminate
]
