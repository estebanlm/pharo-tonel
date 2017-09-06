Extension {
	#name : #GLMMorphicRenderer
}

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMMorphicRenderer>>openInExternalWindow: aRenderable [
    window := GLMOSWindowMorphWorldRenderer render: aRenderable from: self.
    ^ window open
]
