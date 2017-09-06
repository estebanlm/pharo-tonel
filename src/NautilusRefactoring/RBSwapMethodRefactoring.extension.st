Extension {
	#name : #RBSwapMethodRefactoring
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSwapMethodRefactoring>>whatToDisplayIn: aBrowser  [

	^ (self changes changes 
		select: [:change | selector = change selector ]) 
		flatCollect: [:change | change whatToDisplayIn: aBrowser ]
]
