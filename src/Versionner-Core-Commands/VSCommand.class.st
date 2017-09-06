"
VSCommand is a command design pattern for capturing actions.
"
Class {
	#name : #VSCommand,
	#superclass : #Object,
	#instVars : [
		'target',
		'requestor',
		'workflow'
	],
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand class>>target: target for: requestor [
	^ self new
		target: target;
		requestor: requestor;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>canBeApplied [
	^ true
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>chooseRepositoryFromList: repositories [
	repositories size > 1
		ifTrue: [ 
			^ UIManager default
				chooseFrom: (repositories collect: [ :repository | repository description ])
				values: repositories
				title: 'Select repository' ].
	^ repositories first
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>execute [
	self subclassResponsibility 
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>executeWithDevWorkflow: devWorkflow [
	workflow := devWorkflow.
	self execute
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>order [
	^ self title
]

{
	#category : #repositories,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>repositoryOfPackageNamed: packageName [
	"Return the repository of the package given as parameter. Create one (using UI) if necessary"

	| mcPackage workingCopy repositories repository repositoryIndex |
	mcPackage := MCPackage named: packageName.
	workingCopy := mcPackage workingCopy.
	repositories := workingCopy repositoryGroup repositories reject: [ :rep | rep == MCCacheRepository default ].
	repositories
		ifEmpty: [ repository := MCTool newRepository.
				   workingCopy repositoryGroup addRepository: repository. ].
	repositories size > 1
		ifTrue: [ 
			repositoryIndex := self uiManager chooseFrom: (repositories collect: #printString).
			repositoryIndex = 0
				ifTrue: [ ^ nil ].
			repository := repositories at: repositoryIndex ].
	repositories size = 1
		ifTrue: [ repository := repositories first ].
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>requestor [
	^ requestor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>requestor: anObject [
	requestor := anObject
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>showExecuteWhile: aBlock [

	^Cursor execute showWhile:  aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommand>>target: aConfigurationClass [
	target := aConfigurationClass
]
