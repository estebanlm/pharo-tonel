"
I'm a example that shows how to have a simple editor in which text is highlighted or not depending on the editor model state.  Try it with:

SHStylingOrNotDependingOnModelState new open.

Thus, depending on the model state, the view should be styled or not styled. This is achieve by implementing a #shoutAboutToStyle: method in the model (here, an instance of myself). #shoutAboutToStyle: returns true if the view which is passed as argument must be styled. In this excample, if the value of the 'state' instance variable is #code, then the text is hilighted, else it is not.

Instance Variables:
	code	<Text>
	codeEditing    <Boolean>
"
Class {
	#name : #SHStylingOrNotDependingOnModelState,
	#superclass : #Model,
	#instVars : [
		'code',
		'codeEditing'
	],
	#category : #Shout-Examples,
	#timestamp : 'AlainPlantec 9/20/2011 17:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>code [
	^ code ifNil: [code := '' asText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>code: someText [
	code := someText.
	self changed: #code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>codeEditing [
	^ codeEditing ifNil: [codeEditing := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>codeEditing: aBoolean [
	codeEditing = aBoolean ifTrue: [^self].
	codeEditing := aBoolean.
	self changed: #code.

]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>open [
	| window editor bar |
	window := (StandardWindow labelled: 'Code and text editor') model: self.
	bar := window newRow: {
			window 
				newCheckboxFor: self 
				getSelected: #codeEditing 
				setSelected: #codeEditing:
				label: 'Code editing' 
				help: 'Checked for code editing' }.
	editor := window newTextEditorFor:  self getText:  #code setText: #code: getEnabled: nil. 
	window addMorph: (window newColumn: {bar. editor})
		fullFrame: LayoutFrame identity.
	^ window openInWorld
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHStylingOrNotDependingOnModelState>>shoutAboutToStyle: aTextView [
	^ self codeEditing
]
