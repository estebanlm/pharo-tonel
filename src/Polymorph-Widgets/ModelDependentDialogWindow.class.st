"
DialogWindow that updates content based upon its model.
"
Class {
	#name : #ModelDependentDialogWindow,
	#superclass : #DialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 12:44'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ModelDependentDialogWindow>>addInitialPanel [
	"Don't until the model is set."
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ModelDependentDialogWindow>>model: anObject [
	"Set the model and add the panel for it."
	
	super model: anObject.
	self paneMorphs copy do: [:p | p delete].
	self addMainPanel
]
