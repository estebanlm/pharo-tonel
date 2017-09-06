"

"
Class {
	#name : #GLMMorphicMorphRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'scrollPane'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicMorphRenderer>>actOnKeyStroke: aPresentation event: anEvent from: aMorph  [
	| action |

	anEvent commandKeyPressed ifFalse: [ ^self ].
	action := (self allKeyboardActionsFor: aPresentation) 
		detect: [ :each | each shortcut = anEvent keyCharacter  ] 
		ifNone: [ nil ].
		
	action 
		ifNotNil: [ action actOn: aPresentation].
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicMorphRenderer>>actOnPresentationUpdated: ann [
	scrollPane scrollTarget: (self morphFrom: ann presentation)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicMorphRenderer>>allKeyboardActionsFor: aPresentation  [
	^(aPresentation allActions, 
		aPresentation allSelectionActions) 
		select: [ :action | action hasShortcut ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicMorphRenderer>>morphFrom: aMorphPresentation [
	| morph  |
	
	morph := aMorphPresentation morph 
		vResizing: #spaceFill; 
		hResizing: #spaceFill;
		yourself.
	
	(self allKeyboardActionsFor: aMorphPresentation) ifNotEmpty: [
		morph 
			on: #keyStroke 
			send: #actOnKeyStroke:event:from: 
			to: self 
			withValue: aMorphPresentation ].
		
	^morph
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicMorphRenderer>>render: aMorphPresentation [
	aMorphPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^ (scrollPane := self scrollMorphFor: (self morphFrom: aMorphPresentation))
]
