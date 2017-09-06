"
I implement behavior to apply and revert code changes.
"
Class {
	#name : #EpLogBrowserOperationFactory,
	#superclass : #Object,
	#instVars : [
		'entries',
		'errorHandlerBlock',
		'logBrowserModel'
	],
	#category : #EpiceaBrowsers-Integration,
	#timestamp : 'MartinDias 2/21/2017 01:03'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>applyCodeChanges [

	self
		trigger: [ 
			self entries reverseDo: [:each |
				self handleErrorDuring: [ 
					each content applyCodeChange ]]] 
		with: self newApplyEvent
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>applyCompleteRefactoring [

	| refactoringEntry refactoring |
	refactoringEntry := self entries first entries first. "TODO: only first?"
	refactoring := refactoringEntry content asRBRefactoring.
	
	self applyRBRefactoring: refactoring

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>applyPropagateRefactoring [

	| refactoringEntry refactoring |
	refactoringEntry := self entries first entries first. "TODO: only first?"
	refactoring := EpRBPropagateRefactoring target: refactoringEntry content asRBRefactoring.

	self applyRBRefactoring: refactoring

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>applyRBRefactoring: aRBRefactoring [

	self 
		trigger: [
			self handleErrorDuring: [
				| aNautilusUI |
				aNautilusUI := NautilusUI on: Nautilus new.
				(NautilusRefactoring model: aNautilusUI) performRefactoring: aRBRefactoring ]]
		with: self newApplyEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>entries [
	^ entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>entries: aCollection [
	entries := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>errorHandlerBlock [
	^ errorHandlerBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>errorHandlerBlock: aBlock [
	errorHandlerBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>handleErrorDuring: aBlock [
	"TODO: do not catch *all* Errors.
	This error handler exists as a workaround to skip any unexpected error when applying or reverting a code change from GUI.
	For example, when user reverts the protocol addition of a protocol that is already not present, and such action signals an unexpected error. The error in such case should be avoided via testing API."
	
	aBlock
		on: Error
		do: self errorHandlerBlock

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>logBrowserModel [
	^ logBrowserModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>logBrowserModel: aBrowser [
	logBrowserModel := aBrowser
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>newApplyEvent [

	^ EpRedo forAll: (self theLog referencesToAll: self entries)

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>newApplyPreviewLog [

	| events |
	events := self entries flatCollect: [:each | 
		each content previewedApplyEvents ].
	
	^ self newPreviewLogFor: events

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>newPreviewLogFor: rawEvents [

	| aLog filter latestEvents |
	self flag: #fix.
	aLog := EpLog newWithStore: (OmMemoryStore withAll: rawEvents).
	logBrowserModel := EpLogBrowserModel newWithLog: aLog.
	filter := EpLatestCodeChangeFilter new logBrowserModel: logBrowserModel; yourself.
	latestEvents := aLog entries 
		select: [:each | filter accepts: each ]
		thenCollect: [:each | each content ].

	^ EpLog newWithStore: (OmMemoryStore withAll: latestEvents)

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>newRevertEvent [

	^ EpUndo forAll: (self theLog referencesToAll: self entries)

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>newRevertPreviewLog [

	| events |
	events := self entries reversed flatCollect: [:each | 
		each content asRevertedCodeChange previewedApplyEvents ].

	^ self newPreviewLogFor: events

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>revertCodeChanges [

	self
		trigger: [ 
			self entries do: [:each | 
				self handleErrorDuring: [ 
					each content asRevertedCodeChange applyCodeChange ]]]
		with: self newRevertEvent
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>revertCodeChangesInPreviewMode [

	self
		trigger: [ 
			self entries reverseDo: [:each |
				self handleErrorDuring: [ 
					each content applyCodeChange ]]] 
		with: self newRevertEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>theLog [

	^ logBrowserModel theLog
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationFactory>>trigger: aBlock with: anEpLogBrowserOperation [

	^ anEpLogBrowserOperation doInJob: aBlock
]
