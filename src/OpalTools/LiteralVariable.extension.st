Extension {
	#name : #LiteralVariable
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
LiteralVariable>>gtInspectorUsersIn: composite [
	<gtInspectorPresentationOrder: 30>
	| users |
	users := self usingMethods.
	composite list 
		title: 'Users';
		display: [ users];
		when: [ users notEmpty ];
		showOnly: 30
]
