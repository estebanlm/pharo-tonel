Extension {
	#name : #RBRefactoryChange
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBRefactoryChange>>gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite diff
		title: 'Changes';
		display: [ { self oldVersionTextToDisplay . self textToDisplay } ]
]
