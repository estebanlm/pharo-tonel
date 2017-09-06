Extension {
	#name : #MetacelloVersionLoadDirective
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MetacelloVersionLoadDirective>>gtInspectorChildren [
	^ self loadDirectives
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MetacelloVersionLoadDirective>>gtInspectorLoadDirectivesIn: composite [
	<gtInspectorPresentationOrder: 1>
	composite tree
		title: 'Load directives';
		display: [ { self } ];
		format: [:each | each label ifEmpty: [each title]];
		rootsExpanded;
		children: #gtInspectorChildren;
		filterOn: [:text :each | '*', text, '*' match: each label ]
]
