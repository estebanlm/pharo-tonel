"
SpecInterpreter
	interpretASpec: MorphicButtonAdapter  defaultSpec
	model: (MorphicButtonAdapter model: ButtonModel2 new)

"
Class {
	#name : #MorphicButtonAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>action [

	self widget ifNotNil: [:m | m takeKeyboardFocus ].
	self model performAction.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>askBeforeChanging [

	^ self model askBeforeChanging
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>buildLabel: text withIcon: icon [

	icon ifNil: [ ^ text
			ifNil: [ '' ]
			ifNotNil: [ text ] ].
	
	^ IconicListItem 
		text: text 
		icon: icon

]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>buildWidget [
	
	| button | 
	button := PluggableButtonMorph
				on: self 
				getState: #state 
				action:  #action 
				label: #label 
				menu: nil. 	
	button 
		getEnabledSelector: #enabled ;
		getFontSelector: #font ;
		hResizing: #spaceFill ;
		vResizing: #spaceFill ;
		askBeforeChanging: self askBeforeChanging ;
		setBalloonText: self model help ;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled ;	
		eventHandler: (MorphicEventHandler new on: #keyStroke send: #keyStroke:fromMorph: to: self).
	^ button
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>font [
	^self model font
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>keyStroke: anEvent fromMorph: aMorph [

]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>label [
	
	^ self buildLabel: self model label withIcon: self model icon
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>menu: aMenu [
	| menuModel |
	
	menuModel := self model menu.
	menuModel isBlock ifTrue: [ menuModel := menuModel value ].
	^ menuModel buildWithSpec
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicButtonAdapter>>state [

	^ self model state
]
