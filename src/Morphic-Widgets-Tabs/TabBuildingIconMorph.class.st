"
I implement rotated icon to animate background tab building. 
I use stepping mechanizm for animation.

Just create my instance with #new message to use in other morphs.

Internal Representation and Key Implementation Points.

    Instance Variables
	progress:		<Integer>
	progressIconMorph:		<ImageMorph>


    Implementation Points
"
Class {
	#name : #TabBuildingIconMorph,
	#superclass : #Morph,
	#instVars : [
		'progressIconMorph',
		'progress'
	],
	#category : #Morphic-Widgets-Tabs,
	#timestamp : 'DenisKudryashov 7/6/2017 15:19'
}

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBuildingIconMorph>>currentIcon [
	^TabMorph perform: (#refreshIcon, progress asString) asSymbol
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBuildingIconMorph>>initialize [
	super initialize.
	self 
		clipLayoutCells: true;
		color: Color transparent.
	progress := 1.
	progressIconMorph := self currentIcon asMorph.
	self addMorphBack: progressIconMorph.
	self extent: progressIconMorph extent.
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBuildingIconMorph>>step [
	progress := progress + 1.
	progress > 10 ifTrue: [ progress := 1 ].
	
	progressIconMorph form: self currentIcon
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBuildingIconMorph>>stepTime [
	
	^ 100 "milliseconds"
]
