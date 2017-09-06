Extension {
	#name : #TreeModel
}

{
	#category : #'*Versionner-Spec-Browser',
	#timestamp : ' 8/31/2017 05:26:38'
}
TreeModel>>whenSelectedNodesChanged: aBlock [
	"Set a block to perform when a new node is selected"

	selectionHolder whenChangedDo: [ :col | aBlock cull: col ]
]
