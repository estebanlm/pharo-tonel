"
This strategy replaces the presentations from the pane of the destination port.
"
Class {
	#name : #GLMReplacePresentationsStrategy,
	#superclass : #GLMPresentStrategy,
	#category : #Glamour-Core,
	#timestamp : 'tg 2/20/2010 14:52'
}

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMReplacePresentationsStrategy>>transmitIn: aContext [
	"it is important for the destination to be set after the presentation, 
	because when the presentation is a browser, we might forward the entity internally"
	self transmission destination hasPane ifTrue: [
		self transmission destination pane notingPresentationChangeDo: [
			self transmission destination pane clearIn: aContext.
			self transmission destination pane presentations: self presentations copy ]].

]
