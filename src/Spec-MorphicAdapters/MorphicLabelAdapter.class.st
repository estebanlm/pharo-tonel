"
I am the adapter used to bridget a LabelModel and a LabelMorph
"
Class {
	#name : #MorphicLabelAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'emphasisOptions'
	],
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicLabelAdapter>>buildWidget [
	| label |
	label := LabelMorph new model: self.
	label
		getEnabledSelector: #enabled;
		getTextSelector: #getText;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		setBalloonText: self help;
		color: self model color;
		emphasis: (self emphasisCodeFor: self model emphasis).
	^ label
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicLabelAdapter>>emphasis: anEmphasis [

	self widgetDo: [ :w | w emphasis: (self emphasisCodeFor: anEmphasis) ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicLabelAdapter>>emphasisCodeFor: anEmphasis [
	^ anEmphasis
		inject: 0
		into: [ :sum :next | sum + (self emphasisOptions at: next) ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicLabelAdapter>>emphasisOptions [
	^ emphasisOptions
		ifNil:
			[ 
			emphasisOptions := {(#bold -> 1).
			(#italic -> 2).
			(#underline -> 4).
			(#narrow -> 8).
			(#struck -> 16)} asDictionary ]
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicLabelAdapter>>getText [

	^ self model label
]
