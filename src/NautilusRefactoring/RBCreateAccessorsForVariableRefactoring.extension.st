Extension {
	#name : #RBCreateAccessorsForVariableRefactoring
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCreateAccessorsForVariableRefactoring>>whatToDisplayIn: aBrowser  [

	^ (self changes changes 
		select: [:change | {getterMethod. setterMethod} includes: change selector ]) 
		flatCollect: [:change | change whatToDisplayIn: aBrowser ]
]
