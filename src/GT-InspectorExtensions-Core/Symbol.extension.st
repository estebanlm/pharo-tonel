Extension {
	#name : #Symbol
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Symbol>>gtInspectorImplementorsIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite list 
		title: 'Implementors';
		display: [ self systemNavigation allImplementorsOf: self ];
		when: [ (self systemNavigation allImplementorsOf: self) notEmpty ];
		showOnly: 30
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Symbol>>gtInspectorSendersIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite list 
		title: 'Senders';
		display: [ self systemNavigation allSendersOf: self ];
		when: [ (self systemNavigation allSendersOf: self) notEmpty ];
		showOnly: 30;
		withSmalltalkSearch 
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Symbol>>pragmas [
	^ (SystemNavigation default allBehaviors flatCollect: [ :each | 
		(Pragma allNamed: self in: each) 
			collect: [ :p | p method asRingDefinition ] ])
]
