"
A GLMBrickedMorph is a direct subclass of Morph with removed layouting mechanism
"
Class {
	#name : #GLMBrickedMorph,
	#superclass : #Morph,
	#category : #Glamour-Morphic-Brick-Morphic,
	#timestamp : 'AliakseiSyrel 1/7/2015 23:25'
}

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>adjustLayoutBounds [
	"no need in it"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>clippingBounds [

	^ self fullBounds
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>computeBounds [
	"nothing to compute, everything is already computed"
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>computeFullBounds [
	"nothing to compute, everything is already computed"
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>doLayoutIn: layoutBounds [
	"we remove morphic layouting mechanism"
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>layoutBounds: aRectangle [
	"I'm not a morph anymore"
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>layoutChanged [

	"empty"
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>outerBounds [
	^ self fullBounds
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>privateFullBounds [
	^ self fullBounds
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickedMorph>>privateInvalidateMorph: aMorph [
	"empty"
]
