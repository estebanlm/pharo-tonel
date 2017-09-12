Extension { #name : #TreeModel }

{ #category : #'*Versionner-Spec-Browser' }
TreeModel >> whenSelectedNodesChanged: aBlock [
	"Set a block to perform when a new node is selected"

	selectionHolder whenChangedDo: [ :col | aBlock cull: col ]
]
