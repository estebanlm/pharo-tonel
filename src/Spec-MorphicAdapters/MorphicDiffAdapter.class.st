"
I am an adpater to bridge a DiffModel and a DiffMorph
"
Class {
	#name : #MorphicDiffAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>buildWidget [

	^ DiffMorph new  
		on: self ;
		from: self leftText to: self rightText contextClass: self contextClass;
		 hResizing:	#spaceFill;
		vResizing: #spaceFill;
		setBalloonText: self  help;
		showOptions: self showOptions;
		showOnlyDestination: self showOnlyDestination;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>contextClass [

	^ self model contextClass
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>contextClass: aClass [
	self widgetDo: [ :w | 
		w 
			contextClass: aClass;
			updateText ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>leftText [

	^ self model leftText
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>leftText: aText [

	self widgetDo: [ :w | 
		w sourceTextModel setText: aText.
		w updateText ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>rightText [

	^ self model rightText
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>rightText: aText [
	self
		widgetDo: [ :w | 
			w destTextModel setText: aText.
			w updateText ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showBoth [

	self widgetDo: [ :w | w showBoth ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOnlyDestination [

	^ self model showOnlyDestination
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOnlyDestination: aBoolean [

	self widgetDo: [ :w | w showOnlyDestination: aBoolean ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOnlySource [

	^ self model showOnlySource
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOnlySource: aBoolean [

	self widgetDo: [ :w | w showOnlySource: aBoolean ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOptions [

	^ self model showOptions
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDiffAdapter>>showOptions: aBoolean [

	self widgetDo: [ :w | w showOptions: aBoolean ]
]
