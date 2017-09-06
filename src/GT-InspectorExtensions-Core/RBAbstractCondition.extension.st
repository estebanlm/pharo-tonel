Extension {
	#name : #RBAbstractCondition
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBAbstractCondition class>>gtExampleBasic [
	<gtExample>
	^ RBCondition new
		type: { }
		block: [ true ]
		errorString: #'error'
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBAbstractCondition>>gtInspectorChildren [
	^ #()
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBAbstractCondition>>gtInspectorTreeIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite tree
		title: 'Tree';
		display: [ { self } ]	;
		children: [ :each | each gtInspectorChildren ];
		when: [ self gtInspectorChildren notEmpty ]
]
