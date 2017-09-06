"
This is the class responsible for the binding to Morphic.

| browser |
browser := GLMTabulator new.
browser column: #one; column: #two.

browser transmit to: #one; andShow: [:a | a list.].
browser transmit to: #two; from: #one; andShow: [ :a |
	a text.].
browser openOn: #(a b c d)
"
Class {
	#name : #GLMMorphicRenderer,
	#superclass : #GLMRenderer,
	#instVars : [
		'window'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : 'tg 4/1/2010 07:11'
}

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>open: aRenderable [
	window := GLMMorphicWindowRenderer render: aRenderable from: self.
	^ window openInWorld 
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderAccordionCompositePresentation: aCompositePresentation [
	^ GLMMorphicAccordionRenderer render: aCompositePresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderAccumulator: aBrowser  [
	^ GLMMorphicAccumulatorRenderer render: aBrowser from: self
]

{
	#category : #'rendering actions',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderAction: anAction [
	^ GLMMorphicActionRenderer render: anAction from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderActionListPresentation: anActionListPresentation  [
	^GLMMorphicActionListRenderer render: anActionListPresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderDashboard: aBrowser  [
	^ GLMMorphicDashboardRenderer render: aBrowser from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderDiffPresentation: aPresentation [
	^ GLMMorphicDiffRenderer render: aPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderDropDownListPresentation: aDropListPresentation [
	^ GLMMorphicDropDownRenderer render: aDropListPresentation from: self	
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderDynamicPresentation: aPresentation [
	^ GLMMorphicDynamicRenderer render: aPresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderExpander: aBrowser  [
	^ GLMMorphicExpanderRenderer render: aBrowser from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderFinder: aBrowser  [
	^ aBrowser hasFixedSizePanes 
		ifTrue: [GLMMorphicFixedPanesFinderRenderer render: aBrowser from: self]
		ifFalse: [GLMMorphicVariablePanesFinderRenderer render: aBrowser from: self]
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderLabelPresentation: aLabelPresentation  [
	^ GLMMorphicLabelRenderer render: aLabelPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderListPresentation: aListPresentation  [
	^ GLMMorphicListRenderer render: aListPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderListingPresentation: aPresentation  [
	^ GLMMorphicListingRenderer render: aPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderMorphPresentation: aMorphPresentation  [
	^ GLMMorphicMorphRenderer render: aMorphPresentation from: self
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderPane: aPane  [
	^ GLMMorphicPaneRenderer render: aPane from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderPharoMethodPresentation: aSmalltalkMethodPresentation  [
	^ GLMMorphicPharoMethodRenderer render: aSmalltalkMethodPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderPharoScriptPresentation: aPharoScriptPresentation  [
	^ GLMMorphicPharoScriptRenderer render: aPharoScriptPresentation from: self
]

{
	#category : #'rendering actions',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderPopupAction: anAction [
	^ GLMMorphicPopupActionRenderer render: anAction from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderRubricHighlightedTextPresentation: aPresentation [

	^ GLMMorphicRubricHighlightedTextRenderer render: aPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderRubricTextPresentation: aPresentation [
	^ GLMMorphicRubricTextRenderer render: aPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderSmalltalkCodePresentation: aSmalltalkCodePresentation  [
	^ GLMMorphicSmalltalkCodeRenderer render: aSmalltalkCodePresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderSpecPresentation: aPresentation  [
	^ GLMMorphicSpecRenderer render: aPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderStackedVerticallyCompositePresentation: aCompositePresentation [
	^ GLMMorphicVerticallyStackedRenderer render: aCompositePresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderStacker: aBrowser  [
	^ GLMMorphicStackerRenderer render: aBrowser from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderTabbedCompositePresentation: aCompositePresentation [
	^ GLMMorphicTabbedRenderer render: aCompositePresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderTablePresentation: aPresentation  [
	^ GLMMorphicTableRenderer render: aPresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderTabulator: aBrowser  [
	^ GLMMorphicTabulatorRenderer render: aBrowser from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderTextPresentation: aTextPresentation  [
	^ GLMMorphicTextRenderer render: aTextPresentation from: self
]

{
	#category : #'rendering presentations',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderTreePresentation: aPresentation  [
	^ GLMMorphicTreeRenderer render: aPresentation from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderValidator: aBrowser  [

	| tmpValidatorRenderer |
	tmpValidatorRenderer :=  GLMMorphicValidatorRenderer new.
	aBrowser  setSpecificAnnouncementActionsTo: tmpValidatorRenderer.  
	^ tmpValidatorRenderer render: aBrowser from: self
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderWizard: aGLMWizard [

	|tmpRenderer|
	tmpRenderer :=  GLMMorphicWizardRenderer new.
	aGLMWizard  setSpecificAnnouncementActionsTo: tmpRenderer.  
	^ (tmpRenderer renderer: self) render: aGLMWizard
]

{
	#category : #'rendering browsers',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderWrapper: aBrowser  [
	^ GLMMorphicWrapperRenderer render: aBrowser from: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>window [
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>window: anObject [
	window := anObject
]
