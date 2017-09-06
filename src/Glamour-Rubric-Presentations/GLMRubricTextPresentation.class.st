"
A presentation that displays text using Rubric.


"
Class {
	#name : #GLMRubricTextPresentation,
	#superclass : #GLMTextualPresentation,
	#instVars : [
		'withLineNumbers',
		'withAnnotation',
		'wrapped',
		'tabWidth',
		'withColumns',
		'textSegments',
		'primarySelectionInterval',
		'withGhostText'
	],
	#category : #Glamour-Rubric-Presentations,
	#timestamp : 'AndreiChis 10/1/2014 13:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>addTextSegment: aTextSegmentMorph [
	self textSegments add: aTextSegmentMorph
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>clearUserEdits [
	self flag: 'Should remove the need for using #defer:. Currently it used as
	the rendered suspends all announcements for a presentation when it handles a text changed request.'.
	UIManager default defer: [ 
		self announce: (GLMTextEditorRequest new 
			action: [ :anEditor | anEditor model clearUserEdits]) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>codeEditingSelectionActions [
	
	^ { 
		(GLMGenericAction new) 
				title: 'Cut'; 
				action: [ :aPresentation |
					aPresentation cut ]; 
				iconName: #smallCutIcon;
				shortcut: $x; 
				withSeparatorBefore;
				yourself.
		(GLMGenericAction new) 
				title: 'Copy';
				action: [ :aPresentation |
					aPresentation copySelection ]; 
				iconName: #smallCopyIcon;
				shortcut: $c; 
				yourself.
		(GLMGenericAction new) 
				title: 'Paste';
				action: [ :aPresentation |
					aPresentation paste ]; 
				iconName: #smallPasteIcon;
				shortcut: $v; 
				yourself.
		(GLMGenericAction new) 
				title: 'Paste...';
				action: [ :aPresentation |
					aPresentation pasteRecent  ]; 
				iconName: #smallCopyIcon;
				withSeparatorAfter;
				yourself. }
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>copySelection [

	self announce: (GLMTextEditorRequest for: #copySelection)
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>cut [

	self announce: (GLMTextEditorRequest for: #cut)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>defaultSelectionActions [

	^ self executionSelectionActions
	
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>flash [

	self announce: (GLMTextEditorRequest new 
		action: [ :anEditor | anEditor flash])
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>hasUnacceptedEdits [

	self announce: (GLMTextEditorRequest new 
		action: [ :anEditor | ^ anEditor model hasUnacceptedEdits])
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>paste [

	self announce: (GLMTextEditorRequest for: #paste)
]

{
	#category : #'actions text',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>pasteRecent [

	self announce: (GLMTextEditorRequest for: #pasteRecent)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>primarySelectionInterval [
	^ primarySelectionInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>primarySelectionInterval: anInterval [
	primarySelectionInterval := anInterval
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderRubricTextPresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>scrollAtIndex: anIndex [
	self primarySelectionInterval: (anIndex to: anIndex - 1)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>tabWidth [
	^ tabWidth ifNil: [ TextStyle default rubTabWidth ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>tabWidth: anInteger [
	tabWidth := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>textSegments [
	^textSegments ifNil: [ textSegments := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withAnnotation [
	
	^ withAnnotation ifNil: [ withAnnotation := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withAnnotation: aBoolean [
	
	withAnnotation := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withColumns [
	
	^ withColumns ifNil: [ withColumns := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withColumns: aBoolean [
	
	withColumns := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withGhostText [
	
	^ withGhostText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withGhostText: aText [
	
	withGhostText := aText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withLineNumbers [
	
	^ withLineNumbers ifNil: [ withLineNumbers := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withLineNumbers: aBoolean [
	
	withLineNumbers := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>withTextSegments: aCollection [
	self textSegments addAll: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>wrapped [
	
	^  wrapped ifNil: [ wrapped := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricTextPresentation>>wrapped: aBoolean [
	
	wrapped := aBoolean
]
