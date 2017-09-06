Extension {
	#name : #FileSystem
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
FileSystem>>gtInspectorRootItemsIn: composite [
	<gtInspectorPresentationOrder: 40>
	(self root gtInspectorItemsIn: composite)
		title: 'Root directory'
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
FileSystem>>gtInspectorWorkingDirectoryItemsIn: composite [
	<gtInspectorPresentationOrder: 40>
	(self workingDirectory gtInspectorItemsIn: composite)
		title: 'Working directory'
]
