"
I represent a margin (for now of rectangle-based operations).

It can be expressed as different objects:

- A number. When specified using a number, it sets all the four values to be the same.

- A point. When specified as a point, pairs top/bottom and left/right take their values from a point y and x. 

- Four numbers. They represent all the four directions.

- A rectangle. (do not use this version because it is proposed just for migration and it may force you to create an unnecessary rectangle).

"
Class {
	#name : #Margin,
	#superclass : #Object,
	#instVars : [
		'right',
		'bottom',
		'left',
		'top'
	],
	#category : #Kernel-BasicObjects,
	#timestamp : 'StephaneDucasse 6/18/2015 11:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin class>>fromNumber: aNumber [
	"Create a margin whose four values are the same and based on anInteger"
	
	^ self new fromNumber: aNumber; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin class>>fromPoint: aPoint [
	"Create a margin whose values are based on the point value: top and bottom are y and left right are x."
	
	^ self new fromPoint: aPoint; yourself
]

{
	#category : #'will be deprecated',
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin class>>fromRectangle: aRectangle [
	"Create a margin with four values based on aRectangle using exactly top, left, bottom, right semantics. Pay attention that most of the time you should not use this method but prefer top:left:bottom:right:. The reason is that using rectangle may force you to create rectangles with negative extent which is totally wrong and bogus."
	
	^ self new fromRectangle: aRectangle; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin class>>left: leftNumber top: topNumber right: rightNumber bottom: bottomNumber [

	^ self new setTop: topNumber left: leftNumber bottom: bottomNumber right: rightNumber 

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin class>>top: topNumber left: leftNumber bottom: bottomNumber right: rightNumber [

	^ self new setTop: topNumber left: leftNumber bottom: bottomNumber right: rightNumber 

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>asMargin [
	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>bottom [
	^ bottom
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>expandRectangle: aRectangle [
	"Answer a rectangle whose size has been expanded by the receiver which represents each rectangle corner."
	
	^ Rectangle 
		left: aRectangle left - self left 
		right: aRectangle right + self right 
		top: aRectangle top - self top 
		bottom: aRectangle bottom + self bottom 

]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>extendRectangle: aRectangle [
	"Answer a rectangle whose size has been expanded (without changing its origin) by the receiver which represents each rectangle corner."
	
	^ Rectangle 
		origin: aRectangle origin 
		corner: aRectangle corner + (self width @ self height) 

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>fromNumber: anInteger [

	self setTop: anInteger 
		left: anInteger 
		bottom: anInteger 
		right: anInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>fromPoint: aPoint [

	self setTop: aPoint y 
		left: aPoint x 
		bottom: aPoint y 
		right: aPoint x
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>fromRectangle: aRectangle [
	"Pay attention do not use this method but prefer top:left:bottom:right:"
	
	self setTop: aRectangle top 
		left: aRectangle left 
		bottom: aRectangle bottom 
		right: aRectangle right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>height [

	^ self bottom + self top
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>initialize [

	super initialize.
	
	self fromNumber: 0
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>insetRectangle: aRectangle [
	"Answer a rectangle whose size has been reduced by the receiver. The limitation is that since a rectangle topleft is always less than its bottomright you may have a some cases that are not possible to express. For that you should use a margin object instead of a rectangle."
	
	| l r t b |
	
	l := aRectangle left 	+ self left.
	r := left max: aRectangle right - self right.
	t := aRectangle top + self top.
	b := top max: aRectangle bottom - self bottom.
	
	^ Rectangle left: l right: r top: t bottom: b
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>isZero [

	^ (0 = top) 
		and: [ (0 = left) 
				and: [ (0 = right) 
					and: [ 0 = bottom]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>left [
	^ left
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>printOn: aStream [

	super printOn: aStream.

	aStream 
		nextPutAll: ' top: ';
		print: top;
		nextPutAll: ' left: ';
		print: left;
		nextPutAll: ' bottom: ';
		print: bottom;
		nextPutAll: ' right: ';
		print: right. 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>right [
	^ right
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>setTop: topNumber left: leftNumber bottom: bottomNumber right: rightNumber [

	top := topNumber.
	left := leftNumber.
	bottom := bottomNumber. 
	right := rightNumber.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>top [
	^ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Margin>>width [

	^ self right + self left
]
