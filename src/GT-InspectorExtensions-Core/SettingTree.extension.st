Extension {
	#name : #SettingTree
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SettingTree>>gtInspectorTreeIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite tree 
		title: 'Tree';
		display: [ self settingTreeRoots ];
		children: [ :each | self childrenOf: each ];
		format: [ :each | each settingDeclaration label ] 
]
