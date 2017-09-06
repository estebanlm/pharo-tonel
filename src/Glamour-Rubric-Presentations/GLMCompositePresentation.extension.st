Extension {
	#name : #GLMCompositePresentation
}

{
	#category : #'*glamour-rubric-presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>pharoMethod [
	^ self custom: GLMPharoMethodPresentation new
]

{
	#category : #'*glamour-rubric-presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>pharoPlayground [
	self deprecated: 'Use #pharoScript instead'.
	^ self custom: GLMPharoScriptPresentation new
]

{
	#category : #'*glamour-rubric-presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>pharoScript [
	^ self custom: GLMPharoScriptPresentation new
]

{
	#category : #'*glamour-rubric-presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMCompositePresentation>>rubricText [
	self deprecated: 'Use #text instead'.
	^ self custom: GLMRubricTextPresentation new
]
