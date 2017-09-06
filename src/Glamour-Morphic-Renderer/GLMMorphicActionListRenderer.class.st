"

"
Class {
	#name : #GLMMorphicActionListRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'labelMorph',
		'container'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer class>>defaultWidth  [
	^100
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer>>actOnPresentationUpdated: ann [
	container removeAllMorphs.
	container addMorphBack: (self morphFrom: ann presentation)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer>>buttonMorph: aModel [
	^UITheme current 
		newButtonIn: nil 
		for: aModel 
		getState: nil
		action: #execute
		arguments: nil 
		getEnabled: nil 
		label: aModel buttonLabel
		help: nil
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer>>morphFrom: anActionListPresentation  [
	| buttonsContainer buttonModel button |
	
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	
	anActionListPresentation allActions do: [ :each | 
		buttonModel := GLMButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
		buttonsContainer addMorphBack: button.
		button width: self class defaultWidth ].
	
	^ buttonsContainer
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer>>rectangleMorphFrom: anActionListPresentation [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: (anActionListPresentation isHorizontal 
			ifTrue: [ #leftToRight ] 
			ifFalse: [ #topToBottom ] );
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		cellInset: 5;
		yourself
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicActionListRenderer>>render: anActionListPresentation [
	container := GLMMorphic containerMorph.
	container
		changeTableLayout;
		listDirection: #leftToRight;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	container addMorphBack: (self morphFrom: anActionListPresentation).
	anActionListPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^ container
]
