Extension {
	#name : #OSWindowRenderer
}

{
	#category : #'*OSWindow-Core-Extras',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>onRenderThread: aBlock [
	OSWindowRenderThread enqueueOperation: aBlock
]

{
	#category : #'*OSWindow-Core-Extras',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>onRenderThreadBlocking: aBlock [
	OSWindowRenderThread enqueueBlockingOperation: aBlock
]
