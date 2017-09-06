"
I am the adapter used to bridget a SliderModel and a PluggableSliderMorph
"
Class {
	#name : #MorphicSliderAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>absoluteValue [

	^ self model absoluteValue
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>absoluteValue: aFloat [

	^ self model absoluteValue: aFloat
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>buildWidget [
	^ PluggableSliderMorph new
		model: self;
		getValueSelector: #value;
		setValueSelector: #value:;
		value: self absoluteValue;
		getLabelSelector: #label;
		max: self max;
		min: self min;
		quantum: self quantum;
		setBalloonText: self help;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>label [

	^ self model label
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>max [

	^ self model max
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>min [

	^ self model min
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>quantum [

	^ self model quantum
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>value [

	^ self model value
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicSliderAdapter>>value: aValue [

	^ self model value: aValue
]
