"
Drop list supporting morphs in list.
"
Class {
	#name : #MorphDropListMorph,
	#superclass : #DropListMorph,
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 12:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>font [
	"Answer the content font"

	^self listFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>font: aFont [
	"Set the list font"

	self listFont: aFont
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>listMorphClass [
	"Answer the class for a new list morph"

	^PluggableMorphListMorph
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>newContentMorph [
	"Answer a new content morph"

	^Morph new
		changeTableLayout;
		listDirection: #leftToRight;
		wrapCentering: #center;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		layoutInset: 2;
		color: Color transparent;
		borderWidth: 0;
		clipSubmorphs: true;
		lock
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>updateContentColor: paneColor [
	"Change the content text color."
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphDropListMorph>>updateContents [
	"Update the contents."

	|item|
	self contentMorph removeAllMorphs.
	self listSelectionIndex > 0
		ifTrue: [item := (self list at: self listSelectionIndex) copy
					hResizing: #spaceFill;
					vResizing: #rigid.
				self contentMorph
					addMorph: item]
]
