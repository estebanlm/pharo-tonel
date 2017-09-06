Extension {
	#name : #RBProgramNode
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
RBProgramNode>>gtInspectorSymbolicBytecodeIn: composite [
	<gtInspectorPresentationOrder: 30> 
	^ (GTOpalScopeBrowser new treeIn: composite)
		title: 'Scopes'
]
