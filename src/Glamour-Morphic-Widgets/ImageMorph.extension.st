Extension {
	#name : #ImageMorph
}

{
	#category : #'*glamour-morphic-widgets',
	#timestamp : ' 8/31/2017 05:26:34'
}
ImageMorph>>setOptimalResizing [
	self hResizing: #rigid.
	self vResizing: #rigid
]
