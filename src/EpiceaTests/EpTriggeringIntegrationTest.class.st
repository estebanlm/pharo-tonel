"

"
Class {
	#name : #EpTriggeringIntegrationTest,
	#superclass : #EpEnabledIntegrationTest,
	#category : #EpiceaTests-Integration,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>changesBrowserOpenedWindows [

	^ ChangesBrowser allSubInstances reject: [ :each | each window isClosed ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>monticelloRepository [

	^ GoferResource current monticelloRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>resources [

	^ super resources copyWith: GoferResource
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>testMCVersionLoad [
	
	| gofer anEntry |
	gofer := Gofer new.
	gofer disablePackageCache.
	gofer 
		repository: self monticelloRepository;
		package: 'GoferFoo'.
	gofer load.
	gofer unload.

	"Check EpMonitor logged it correctly"
	self assert: (self countLogEventsWith: EpClassAddition) equals: 1.

	anEntry := (self allLogEntriesWith: EpClassAddition) anyOne.

	self 
		assert: (anEntry tags includesKey: EpLog triggererReferenceKey) 
		description: 'It did not recognize that the code change was triggered by other event.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>testNoTrigger [
	
	classFactory newClass.
	[ classFactory newClass ] asJob run.

	"Check EpMonitor logged them correctly"
	self assert: (self countLogEventsWith: EpClassAddition) equals: 2.

	(self allLogEntriesWith: EpClassAddition) do: [ :anEntry |
		self deny: (anEntry tags includesKey: EpLog triggererReferenceKey) ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpTriggeringIntegrationTest>>testRefactoring [
	"Really hacky"

	| aClass newName nautilus windowsAfter windowsBefore anEntry |
	"Create class"
	aClass := classFactory newClass.
	newName := aClass name, 'Renamed'.

	"Rename the class, using Nautilus machinery"
	nautilus := Nautilus browsedEnvironment: Nautilus defaultBrowsedEnvironment.
	windowsBefore := self changesBrowserOpenedWindows.
	[ (NautilusRefactoring model: nautilus) renameClass: aClass ]
		on: ProvideAnswerNotification
		do: [ :n | n resume: newName ].
	windowsAfter := self changesBrowserOpenedWindows.
	self assert: (windowsAfter copyWithoutAll: windowsBefore) size = 1.
	windowsAfter anyOne window triggerOkAction.
	self assert: aClass name = newName.

	"Check EpMonitor logged it correctly"
	self assert: (self countLogEventsWith: EpBehaviorNameChange) equals: 1.

	anEntry := (self allLogEntriesWith: EpBehaviorNameChange) anyOne.

	self 
		assert: (anEntry tags includesKey: EpLog triggererReferenceKey) 
		description: 'It did not recognize that the code change was triggered by other event.'
]
