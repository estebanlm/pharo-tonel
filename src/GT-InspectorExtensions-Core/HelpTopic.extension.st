Extension {
	#name : #HelpTopic
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
HelpTopic>>gtInspectorActionOpenHelpBrowser [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ HelpBrowser openOn: self ];
		icon: (Smalltalk ui icons iconNamed: #bookIcon);
		title: 'Browse'
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
HelpTopic>>gtInspectorContentsIn: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Contents';
		display: [ self contents ];
		when: [ self contents notEmpty  ] 
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
HelpTopic>>gtInspectorSubtopicsIn: composite [
	<gtInspectorPresentationOrder: 50>

	composite tree
		shouldValidate: false;
		title: 'Subtopics';
		display: [ self subtopics ];
		children: [ :each | each subtopics ];
		when: [ self hasSubtopics ];
		format: #title
]
