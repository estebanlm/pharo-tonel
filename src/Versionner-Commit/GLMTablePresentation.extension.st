Extension {
	#name : #GLMTablePresentation
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
GLMTablePresentation>>column: aBlockOrString evaluated: aBlock modified: aModifiedBlock width: aNumber [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString;
		computation: aBlock;
		modifiedBlock: aModifiedBlock;
		width: aNumber)
]
