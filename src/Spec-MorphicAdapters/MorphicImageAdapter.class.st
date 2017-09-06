"
I am the bridge between an ImageModel and a AlphaImageMorph
"
Class {
	#name : #MorphicImageAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicImageAdapter>>adapt: aComposableModel [

	super adapt: aComposableModel.
	widget
		on: #click
		send: #click
		to: self
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicImageAdapter>>buildWidget [
	| alphaImage |
	alphaImage := AlphaImageMorph new.
	alphaImage model: self.
	alphaImage
		getImageSelector: #getImage;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		layout: (self model autoScale 
				ifTrue: [ #scaledAspect ]
				ifFalse: [ #center ]);
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		setBalloonText: self help;
		update: #getImage.
	^ alphaImage
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicImageAdapter>>click [

	^ self model action value
]

{
	#category : #'widget protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicImageAdapter>>getImage [

	^ self model image
]

{
	#category : #'widget protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicImageAdapter>>switchAutoscale [
	| layoutValue |
	layoutValue := self model autoScale
		ifTrue: [ #scaledAspect ]
		ifFalse: [ #center ].
	self widgetDo: [ :w | w layout: layoutValue ]
]
