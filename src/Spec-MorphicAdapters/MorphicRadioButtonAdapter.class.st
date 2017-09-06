"
I am the adapter used to link a RadioButtonModel with a CheckboxMorph (which can also act as a radio button)
"
Class {
	#name : #MorphicRadioButtonAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicRadioButtonAdapter>>buildWidget [
	^ CheckboxMorph new
		on: self selected: #state changeSelected: #state:;
		label: self label;
		labelClickable: self labelClickable;
		beRadioButton;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setBalloonText: self help;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicRadioButtonAdapter>>label [

	^ self model label
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicRadioButtonAdapter>>labelClickable [

	^ self model labelClickable
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicRadioButtonAdapter>>state [

	^ self model state
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicRadioButtonAdapter>>state: aBoolean [

	^ self model state: aBoolean
]
