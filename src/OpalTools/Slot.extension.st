Extension {
	#name : #Slot
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
Slot>>gtInspectorUsersIn: composite [
	<gtInspectorPresentationOrder: 30>
	| users |
	users := self usingMethods.
	composite list 
		title: 'Users';
		display: [ users collect: #asRingDefinition];
		when: [ users notEmpty ];
		showOnly: 30
]
