Extension {
	#name : #SettingNode
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SettingNode>>gtInspectorLiveIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite morph
		title: 'Live';
		display: [ self settingDeclaration inputWidget ];
		when: [ self settingDeclaration notNil and: [ self settingDeclaration inputWidget notNil ] ]
]
