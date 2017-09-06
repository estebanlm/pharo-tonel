Extension {
	#name : #GLMCompositePresentation
}

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>fastList [
	^ self custom: GLMFastListPresentation new
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>fastTable [
	^ self custom: GLMFastTablePresentation new
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>fastTree [
	^ self custom: GLMFastTreePresentation new
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>fastTreeTable [
	^ self custom: GLMFastTreeTablePresentation new
]
