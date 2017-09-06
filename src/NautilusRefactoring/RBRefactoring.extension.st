Extension {
	#name : #RBRefactoring
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefactoring>>whatToDisplayIn: aBrowser  [
	
	^ self changes changes flatCollect: [:e | e whatToDisplayIn: aBrowser ]
]
