"
I am used to compute a MenuGroupModel.
There is not Morphic represenation of a MenuGroup, that is why I do not have a coresponding morph.
"
Class {
	#name : #MorphicMenuGroupAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuGroupAdapter>>buildWidget [

	^ self menuItems collect: [ :each | each buildWithSpec ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuGroupAdapter>>menuItems [
	
	^ self model menuItems
]
