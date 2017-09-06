"
A wizard 

Instance Variables
	cancelButtonAction:		<Object>
	currentIndex:		<Object>
	externalCancelButtonAction:		<Object>
	externalNextButtonAction:		<Object>
	externalPreviousButtonAction:		<Object>
	externalTerminateButtonAction:		<Object>
	genericStep:		<Object>
	nextButtonAction:		<Object>
	previousButtonAction:		<Object>
	specificAnnouncementActions:		<Object>
	steps:		<Object>
	stepsAndPanes:		<Object>
	stepsDictionary:		<Object>
	terminateButtonAction:		<Object>
	wizardSize:		<Object>

cancelButtonAction
	- xxxxx

currentIndex
	- xxxxx

externalCancelButtonAction
	- xxxxx

externalNextButtonAction
	- xxxxx

externalPreviousButtonAction
	- xxxxx

externalTerminateButtonAction
	- xxxxx

genericStep
	- xxxxx

nextButtonAction
	- xxxxx

previousButtonAction
	- xxxxx

specificAnnouncementActions
	- xxxxx

steps
	- xxxxx

stepsAndPanes
	- xxxxx

stepsDictionary
	- xxxxx

terminateButtonAction
	- xxxxx

wizardSize
	- xxxxx

"
Class {
	#name : #GLMWizard,
	#superclass : #GLMImplicitBrowser,
	#instVars : [
		'wizardSize',
		'steps',
		'genericStep',
		'currentIndex',
		'terminateButtonAction',
		'previousButtonAction',
		'nextButtonAction',
		'cancelButtonAction',
		'specificAnnouncementActions',
		'externalCancelButtonAction',
		'externalNextButtonAction',
		'externalPreviousButtonAction',
		'externalTerminateButtonAction',
		'stepsDictionary',
		'stepsAndPanes'
	],
	#category : #Glamour-Browsers-Wizards,
	#timestamp : 'TorstenBergmann 3/10/2015 22:01'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard class>>genericStepWithGenericSizeExample [

	"self genericStepWithGenericSizeExample"
	| wizard |
	wizard := GLMWizard new.
	(wizard genericStep: #step)
		show: [:a | 
		a list
			display: [:aNumber | 1 to: aNumber] 
		] ;
		name: 'Wizard pane';
		size: [:aNumber | aNumber].
	wizard openOn: 4.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard class>>linkedStepsExample [

	"self linkedStepsExample"
	| wizard |
	wizard := GLMWizard new.
	(wizard step: #step1) 
		show: [:a |
			a list
				display: [:aList |
					aList
					].
			];
		name: 'first pane'
		.
	(wizard step: #step2) 
		from: #step1; 
		show: [:a |
			a list
				display: [:aNumber |
					1 to: aNumber
					]
			];
		name: 'second pane'.
	wizard openOn: (1 to: 100).

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard class>>simpleExample [

	"self simpleExample"
	| wizard |
	wizard := GLMWizard new.
	(wizard genericStep: #step)
		show: [:a | 
		a list
			display: [:list | list] 
		] ;
		name: 'Wizard pane';
		size: 2.
	wizard openOn: (1 to: 100).

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>addPaneFrom: aPort  [
	self panes addLast: self computePane.
	self newTransmission
		addActiveOrigin: aPort; 
		destination: (self panes last port: #entity); 
		presentations: (self presentations copy); 
		transmit
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>atBeginning [

	^ self currentIndex = 1 and: [
		self stepToUse atBeginning
		]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>atEnd [

	^ self currentIndex = self steps size and: [
		self stepToUse atEnd
		]
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>backSign [
	^ '<< Back'
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>cancelButtonAction [

	self externalCancelButtonAction value: self entity.
	self announce: (GLMBrowserClosed new)		
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computeFirstPaneValidator [

	|tmpValidator|
	tmpValidator := self computePaneValidator.
	self setFirstPaneButtonsTo: tmpValidator.
	^ tmpValidator  

]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computeLastPaneValidator [

	|tmpValidator|
	tmpValidator := self computePaneValidator.
	self setLastPaneButtonsTo: tmpValidator.
	^ tmpValidator  

]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computeMiddlePaneValidator [

	|tmpValidator|
	tmpValidator := self computePaneValidator.
	self setMiddlePaneButtonsTo: tmpValidator.
	^ tmpValidator  

]

{
	#category : #'building pane',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computePane [

	self hasUniquePane ifTrue: [^ self computePaneWith: self computeSinglePaneValidator].
	self atBeginning ifTrue: [^ self computePaneWith: self computeFirstPaneValidator].
	self atEnd ifTrue: [^ self computePaneWith: self computeLastPaneValidator].
	^( self computePaneWith: self computeMiddlePaneValidator).
	

]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computePaneValidator [

	|tmpPresentation tmpValidator|
	tmpPresentation := (self stepToUse presentationBlock glamourValue: self transmission transmissionStrategy presentations).
	tmpValidator := GLMValidator new.
	tmpValidator show: [:a | a custom: tmpPresentation]. 
	"tmpValidator startOn: self entity."
	^ tmpValidator 

]

{
	#category : #'building pane',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computePaneWith: aValidator [
	| tmpPane |
	tmpPane := GLMPane in: self.
	tmpPane addPresentation: aValidator.
	(tmpPane port: #entity) value: self stepToUse input.
	self updateBrowserTitle.
	^ tmpPane
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>computeSinglePaneValidator [

	|tmpValidator|
	tmpValidator := self computePaneValidator.
	self setSinglePaneButtonsTo: tmpValidator.
	^ tmpValidator  

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>currentIndex [

	^ currentIndex ifNil: [currentIndex := 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>currentIndex: anInteger [

	currentIndex := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>currentStep  [

	^ self steps at: self currentIndex
]

{
	#category : #'accessing - scripting',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>defaultStepName [

	^'default_step_name'
]

{
	#category : #'accessing ports',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>entity: anObject [

	super entity: anObject.
	self updateWhenNext
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalCancelButtonAction [

	^ externalCancelButtonAction ifNil: [externalCancelButtonAction := [:input | ]]
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalCancelButtonAction: aBlock [

	externalCancelButtonAction := aBlock
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalNextButtonAction [

	^ externalNextButtonAction ifNil: [externalNextButtonAction := [:input | ]]
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalNextButtonAction: aBlock [

	externalNextButtonAction := aBlock 
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalPreviousButtonAction [

	^ externalPreviousButtonAction ifNil: [externalPreviousButtonAction := [:input | ]]
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalPreviousButtonAction: aBlock [

	externalPreviousButtonAction := aBlock
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalTerminateButtonAction [

	^ externalTerminateButtonAction ifNil: [externalTerminateButtonAction := [:input | ]]
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>externalTerminateButtonAction: aBlock [

	externalTerminateButtonAction := aBlock
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>forwardSign [
	^ 'Next >>'
]

{
	#category : #'accessing - scripting',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>genericStep [

	|tmpSymbol|
	tmpSymbol := (self defaultStepName, self steps size asString) asSymbol.
	self steps add: tmpSymbol.
	^ self stepsDictionary at: tmpSymbol put: GLMWizardGenericStep new.
]

{
	#category : #'accessing - scripting',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>genericStep: aSymbol  [

	self steps add: (aSymbol).
	^ self stepsDictionary at: aSymbol put: GLMWizardGenericStep new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>hasUniquePane [

	^ self steps size = 1 and: [self stepToUse size = 1]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>initialize [

	super initialize.
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>nextButtonAction [

		self externalNextButtonAction value: self entity. 
		self updateWhenNext.
		
]

{
	#category : #'building pane',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>notifyAndAddNewPane: aGLMPane [

	(self stepsAndPanes at: self currentStep ifAbsentPut: [OrderedCollection new])
		addLast: aGLMPane.  
	self announce: (GLMPaneAdded new
							pane: aGLMPane;
							browser: self;
							yourself ) 
	
]

{
	#category : #'building pane',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>notifyAndRemoveCurrentPane [

	|oldPane   tmpPanes|
	tmpPanes := self stepsAndPanes at: self currentStep ifAbsentPut: [OrderedCollection new].
	oldPane :=  tmpPanes last.
	tmpPanes removeLast.
	self announce: (GLMPaneRemoved new
							pane: oldPane;
							browser: self;
							yourself ) 
	
]

{
	#category : #'building pane',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>notifyAndSetAsCurrentPane: aGLMPane [

	|oldPane   tmpPanes|
	tmpPanes := self stepsAndPanes at: self currentStep ifAbsentPut: [OrderedCollection new].
	tmpPanes removeLast.
	tmpPanes addLast: aGLMPane.
	"self panes addLast: aGLMPane. " 
	self announce: (GLMPaneReplaced 
							oldPane: oldPane 
							newPane: tmpPanes last
							fromBrowser: self ) 
	
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>on: anAnnouncementClass send: aSelector [

	self specificAnnouncementActions at: anAnnouncementClass  put: aSelector 
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>onCancelDo: aBlock [

	self externalCancelButtonAction: aBlock
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>onNextDo: aBlock [

	self externalNextButtonAction: aBlock
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>onPreviousDo: aBlock [

	self externalPreviousButtonAction: aBlock
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>onTerminateDo: aBlock [

	self externalTerminateButtonAction: aBlock
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>populateInputOfStep: aGLMWiizardStep [

	self stepToUse previousStep isEmpty
		ifTrue: [
			self stepToUse input: (self pane port: #entity) value.
			]
		ifFalse: [
			(self stepToUse previousStep size = 1)
				ifTrue: [
					self stepToUse input: ((self stepsAndPanes at: self stepToUse previousStep anyOne) last port: #selection) value.
					]
				ifFalse: [
					|tmpInputs|
					tmpInputs := self stepToUse previousStep collect: [:aSymbol |
						((self stepsAndPanes at: aSymbol) last port: #selection) value
						].
					self stepToUse input: tmpInputs
					].
			].
	
			
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>previousButtonAction [

		self externalPreviousButtonAction value: self entity.
		self updateWhenPrevious
		
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>renderGlamorouslyOn: aRenderer  [
	^ aRenderer renderWizard: self
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>setFirstPaneButtonsTo: aValidator [

	aValidator validator: 'Cancel' act:  [:input |
		self cancelButtonAction
		] .
	aValidator validator: self forwardSign act: [:input |
		self nextButtonAction 
		] populatePorts: #(#selection).
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>setLastPaneButtonsTo: aValidator [

	aValidator validator:  'Cancel' act:  [:input |
		self cancelButtonAction
		].
	aValidator validator: self backSign act: [:input |
		self previousButtonAction
		].
	aValidator validator: 'Finish' act:  [:input |
		self terminateButtonAction
		].
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>setMiddlePaneButtonsTo: aValidator [

	aValidator validator: 'Cancel' act: [:input |
		self cancelButtonAction 
		].
	aValidator validator: self backSign act: [:input |
		self previousButtonAction
		].
	aValidator validator: self forwardSign act: [:input |
		self nextButtonAction
		].
	
]

{
	#category : #'building internal',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>setSinglePaneButtonsTo: aValidator [

	aValidator validator: 'Cancel' act: [:input |
		self cancelButtonAction
		].
	aValidator validator: 'Finish' act: [:input |
		self terminateButtonAction
		].
	
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>setSpecificAnnouncementActionsTo: aRenderer [

	self specificAnnouncementActions keysAndValuesDo: [:anAnnouncementClass :aSymbol |
		self when: anAnnouncementClass send: aSymbol to: aRenderer.
		]
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>specificAnnouncementActions [

	^ specificAnnouncementActions ifNil: [specificAnnouncementActions := Dictionary new]
]

{
	#category : #'accessing - scripting',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>step [


	|tmpSymbol|
	tmpSymbol := (self defaultStepName, self steps size asString) asSymbol.
	self steps add: tmpSymbol.
	^ self stepsDictionary at: tmpSymbol put: GLMWizardStep new.
]

{
	#category : #'accessing - scripting',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>step: aSymbol  [

	self steps add: (aSymbol).
	^ self stepsDictionary at: aSymbol put: GLMWizardStep new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>stepToUse [

	^ self stepsDictionary at: (self steps at: self currentIndex) 
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>steps [

	^ steps ifNil: [steps := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>stepsAndPanes [

	^ stepsAndPanes ifNil: [stepsAndPanes := Dictionary new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>stepsAndPanesDictionary [

	^ stepsDictionary ifNil: [stepsDictionary := Dictionary new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>stepsDictionary [

	^ stepsDictionary ifNil: [stepsDictionary := Dictionary new]
]

{
	#category : #'accessing - buttons actions ',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>terminateButtonAction [

	self externalTerminateButtonAction value: self entity.
	self announce: (GLMBrowserClosed new)
		
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>updateBrowserTitle [
	self title: self stepToUse name.
	self update
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>updatePane [

	|tmpPane|
	self notifyAndSetAsCurrentPane: self computePane.
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>updateWhenNext [

	|tmpPane|
	self populateInputOfStep: self stepToUse.  
	self stepToUse incrementNumberOfDisplay.
	self stepToUse overEnd
		ifTrue: [
			self currentIndex: self currentIndex + 1.
			self populateInputOfStep: self stepToUse.  
			].
	
	tmpPane := self computePane.
	self notifyAndAddNewPane: self computePane.
	
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>updateWhenPrevious [

	|tmpPane|
	self notifyAndRemoveCurrentPane.
	self stepToUse decrementNumberOfDisplay.
	self stepToUse overBeginning 
		ifTrue: [
			
			self currentIndex: self currentIndex - 1].
	self stepToUse input: self entity.
	self notifyAndSetAsCurrentPane: (self stepsAndPanes at: self currentStep) last .
	self updateBrowserTitle.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizard>>valueOf: anObject [

	^ anObject moValue: (self pane port: #entity) value
]
