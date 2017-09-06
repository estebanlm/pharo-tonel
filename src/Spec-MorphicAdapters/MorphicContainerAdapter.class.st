"
I am the adapter providing the correct container class: PanelMorph
"
Class {
	#name : #MorphicContainerAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>buildWidget [

	^ PanelMorph new
		changeProportionalLayout;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>centerWidget: aWindow [

	self widgetDo: [ :w| w centerWidget: aWindow ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>checkSplitters [
	
	self widgetDo: [ :w | w checkSplitters ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>isRedrawable [
	"This must be overriden in the adapter representing your container"
	
	^ true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>newHSplitterAt: aPosition [
	
	self widgetDo: [ :w | w newHSplitterAt: aPosition ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicContainerAdapter>>newVSplitterAt: aPosition [
	
	self widgetDo: [ :w | w newVSplitterAt: aPosition ]
]
