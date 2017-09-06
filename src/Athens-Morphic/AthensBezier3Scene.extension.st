Extension {
	#name : #AthensBezier3Scene
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBezier3Scene class>>openViewOn: aControlPointsArray [
	
	^ AthensSceneView new
		scene: 	(self on: aControlPointsArray );
		openInWindow
]
