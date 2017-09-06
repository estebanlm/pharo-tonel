"
I am an adapter to ease the bridge a CheckBoxModel and a CheckboxMorph
"
Class {
	#name : #MorphicCheckBoxAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>buildWidget [

	| checkButton |
	checkButton := CheckboxMorph
						on: self 
						selected: #state
						changeSelected: #state:. 			
	checkButton 
			label:	self label; 
			beCheckbox;
			hResizing: #spaceFill; 
			vResizing: #shrinkWrap; 
			setBalloonText: self help;
			dragEnabled: self dragEnabled;
			dropEnabled: self dropEnabled;	
			labelClickable: self labelClickable.
	^ checkButton
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>label [
	
	^ self model label
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>labelClickable [
	
	^ self model labelClickable
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>labelOnLeft [

	^ self widgetDo: [ :w | w listDirection: #leftToRight ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>labelOnRight [

	^ self widgetDo: [ :w | w listDirection: #rightToLeft ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>state [
	
	^ self model state
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicCheckBoxAdapter>>state: aBoolean [
	
	^ self model state: aBoolean
]
