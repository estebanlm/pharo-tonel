Extension {
	#name : #RBCompositeRefactoryChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeRefactoryChange>>whatToDisplayIn: aBrowser [

	^ self changes flatCollect: [:each | each whatToDisplayIn: aBrowser ]
]
