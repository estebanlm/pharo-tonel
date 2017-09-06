"
This strategy sets presentations only if none exits in the pane of the destination port.
"
Class {
	#name : #GLMPresentIfNoneStrategy,
	#superclass : #GLMPresentStrategy,
	#category : #Glamour-Core,
	#timestamp : 'tg 2/20/2010 14:52'
}

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentIfNoneStrategy>>transmitIn: aContext [
	(self transmission destination hasPane and: [
		self transmission destination pane presentations isEmpty]) ifTrue: [	
			self transmission destination pane
				notingPresentationChangeDo: [
					self transmission destination pane clearIn: aContext.
					self transmission destination pane presentations: self presentations copy ] ]
]
