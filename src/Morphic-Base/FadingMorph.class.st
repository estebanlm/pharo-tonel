"
FadingMorph is a morph that fades out of existence after a certain time. The implementation uses a stepping event which reduces the visibility of the morph and its submorphs until they are no longer visible, when this happens the morph will delete itself.

Variables:
<alpha> holds the current alpha value. [ Float ]
<fadingFactor> a value of how much the alpha shall be reduced per step message send. [ Float ]
<resetable> boolean value used by #handleMouseMove: to descide whether or not to reset the alpha on mouse over.

The morph has a default layout, color, and borderstyle which can be changed after instance creation the same way other morphs can.

The morph itself updates its translucency per 100ms. One can change the variable fadingFactor to reduce or increase the time a FadingMorph is present in the world.

If the mouse is moved over a FadingMorph present in the world, it will reset the alpha, which means that the fading will start from the begining again, this can be turned off by sending #beUnResetable. 

"
Class {
	#name : #FadingMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'alpha',
		'fadingFactor',
		'resetable'
	],
	#category : #Morphic-Base-Basic,
	#timestamp : 'HenrikNergaard 1/25/2016 00:17'
}

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>areasRemainingToFill: aRectangle  [
	
	"the whole rectangle is translucent"
	
	^Array with: aRectangle
]

{
	#category : #properties-setting,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>beResetable [

	resetable := true
]

{
	#category : #properties-setting,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>beUnResetable [

	resetable := false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>defaultFadingFactor [
	"show the morph for 2.5 seconds"
	
	^0.04 
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>fullDrawOn: aCanvas [

	super fullDrawOn: (aCanvas asAlphaBlendingCanvas: alpha)
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>handleMouseMove: anEvent [

	(anEvent wasHandled or: [ resetable not ]) ifTrue:[ ^self ]. 
	
	self resetAlpha.

	anEvent wasHandled: true.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>initialize [

	super initialize.
	
	self 
	initializeAppearance;
	initializeLayout;
	beResetable;
	resetAlpha.
	
	fadingFactor := self defaultFadingFactor.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>initializeAppearance [

	self 
	color: Color gray;
	borderStyle: (BorderStyle inset width: 3)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>initializeLayout [

	self 
	changeTableLayout;
	layoutInset: 6;
	listDirection: #topToBottom;
	cellPositioning: #topRight;
	hResizing: #shrinkWrap;
	vResizing: #shrinkWrap;
	cellInset: 0.
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>rejectsEvent: anEvent [

	^(anEvent isMouse and: [ anEvent isMouseDown ]) or: [ super rejectsEvent: anEvent ]
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>resetAlpha [

	alpha := 1.0
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>step [

	alpha <= fadingFactor ifTrue: [ ^self delete ].

	alpha := alpha - fadingFactor.
	
	self changed.

	
	
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>stepTime [

	^100
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:13'
}
FadingMorph>>wantsSteps [
	^true
]
