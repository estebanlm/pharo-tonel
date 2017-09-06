"
I am a Spec ComposableModel for all Glamour presentations (GLMPresentation subclasses.) By default I open a GLMPharoScriptPresentation, a Smalltalk code snippet editor.

For examples see my class side.

"
Class {
	#name : #GlamourPresentationModel,
	#superclass : #ComposableModel,
	#instVars : [
		'presentation',
		'glmPres'
	],
	#category : #Glamour-SpecIntegration,
	#timestamp : 'JurajKubelka 1/18/2017 16:34'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed add: #presentation
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>exampleGLMExamples [
	<gtExample>
	"open the Glamour Examples Browser"
	|ui|
	ui := GlamourPresentationModel new.
	ui presentationClass: GLMExamplesBrowser startOn: GLMBasicExamples.
	^ ui openWithSpec
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>exampleGLMPharoScript [
	<gtExample>
	^ GlamourPresentationModel new openWithSpec.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel>>glmPres [
	glmPres isNil ifTrue:[glmPres := GLMPharoScriptPresentation new].
	^ glmPres 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel>>initializeWidgets [
	"Should actually do nothing at all.
	This is because we cannot create the morph and later set the presentation.
	So we will do all of this in the presentation: accessor.
	"

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel>>presentation [
	presentation isNil ifTrue:[
		| morph |
		morph := GLMMorphicRenderer new render: self glmPres.
		morph hResizing: #spaceFill.
		morph vResizing: #spaceFill.
		presentation := MorphicGenericAdapter morph: morph].

	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel>>presentation: anObject [
	presentation := anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel>>presentationClass: aGLMCompositePresentation startOn: anObject  [
	glmPres := aGLMCompositePresentation new startOn: anObject
]
