Extension {
	#name : #GLMCompositePresentation
}

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMCompositePresentation>>openInExternalWindow [
    ^ self defaultRenderer openInExternalWindow: self
]

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMCompositePresentation>>openInExternalWindowOn: anObject  [
    ^ self openOn: anObject inExternalWindowWith: self defaultRenderer
]

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMCompositePresentation>>openInExternalWindowWith: aRenderer  [
    ^ aRenderer openInExternalWindow: self
]

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMCompositePresentation>>openOn: anObject inExternalWindowWith: aRenderer  [
     
    self startOn: anObject. 
    ^ aRenderer openInExternalWindow: self
]
