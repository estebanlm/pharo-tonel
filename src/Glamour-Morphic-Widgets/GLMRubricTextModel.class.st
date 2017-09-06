"

"
Class {
	#name : #GLMRubricTextModel,
	#superclass : #GLMMorphicModel,
	#instVars : [
		'primarySelectionInterval',
		'hasUnacceptedEdits'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #'text managing',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>clearUserEdits [
	
	self hasUnacceptedEdits: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>getText [
	^ self glamourPresentation formatedDisplayValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>hasUnacceptedEdits [
	^ hasUnacceptedEdits ifNil: [ hasUnacceptedEdits := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>hasUnacceptedEdits: aBoolean [
	hasUnacceptedEdits := aBoolean.
	self announce: RubEditsStateChangedInModel new
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>menu [

	^ self menu: MenuMorph new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>primarySelectionInterval [
	^ primarySelectionInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>primarySelectionInterval: anInterval  [
	primarySelectionInterval := anInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>setText: aText from: aRubScrolledTextMorph  [
	self glamourPresentation text: aText.
	^true
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricTextModel>>shiftMenu [

	^ nil
]
