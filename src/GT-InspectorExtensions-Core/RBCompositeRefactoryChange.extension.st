Extension {
	#name : #RBCompositeRefactoryChange
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBCompositeRefactoryChange>>gtInspectorPreviewIn: composite [
	composite list 
		title: 'Changes';
		display: [ self changes ];
		when: [ self changes notEmpty ]
]
