Extension {
	#name : #DACompositeDependency
}

{
	#category : #'*Tool-DependencyAnalyser-UI',
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>nodeClass [
	^ self dependencies first isMessageSendDependency
		ifTrue: [ DAManuallyAddedDependentPackageNode ]
		ifFalse: [ DADependentPackageNode ]
]
