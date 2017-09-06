Extension {
	#name : #Morph
}

{
	#category : #'*Athens-Examples',
	#timestamp : ' 8/31/2017 05:26:39'
}
Morph>>openInSceneView [
	^ AthensSceneView new
		scene: (AthensMorphScene new morph:self);
		openInWindow
]
