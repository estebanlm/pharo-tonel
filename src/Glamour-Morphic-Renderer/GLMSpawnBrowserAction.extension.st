Extension {
	#name : #GLMSpawnBrowserAction
}

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpawnBrowserAction>>morphicActOn: aPresentation [

	^ (self actOn: aPresentation) open
]
