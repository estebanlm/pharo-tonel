"

"
Class {
	#name : #RectangleTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyRectangle',
		'rectangle1'
	],
	#category : #Graphics-Tests-Primitives,
	#timestamp : ''
}

{
	#category : #setup-teardown,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>setUp [
	emptyRectangle := 0 @ 0 corner: 0 @ 0.
	rectangle1 := 10@10 corner:20@20
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testARectangleContainsItsOrigin [
	self
		assert: (rectangle1 containsPoint: rectangle1 origin)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testARectangleDoesNotContainItsCorner [
	self
		deny: (rectangle1 containsPoint: rectangle1 corner)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testARectangleIntersectsWithItself [
	self
		assert: (rectangle1 intersects: rectangle1)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testAnEmptyRectangleHasNoArea [
	self assert: emptyRectangle area = 0
]

{
	#category : #tests-accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testArea [

	self assert: (0 @ 0 corner: 5 @ 5) area = 25.
	self assert: (2 @ 3 corner: 10 @ 8) area = 40.
	self assert: (5 @ 5 corner: 6 @ 6) area = 1.
	self assert: (-1 @ -2 corner: 2 @ 1) area = 9.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testAreasOutside1 [

    | frame rects visibleArea  |
    frame := 0@0 extent: 300@300.
    rects := OrderedCollection new: 80.
    0 to: 3 do: [:i |
      0 to: 2 do: [:j |
            rects add: (i@j * 20 extent: 10@10)
    ]  ].
  
   visibleArea := Array with: frame.
   rects do: [:aRectangle |  | remnants |
      remnants := OrderedCollection new.
      visibleArea do: [:a | remnants addAll: (a areasOutside: aRectangle)].
      visibleArea := remnants.
  ].
  visibleArea := visibleArea asArray.
  self assert: (visibleArea allSatisfy: [:r | r area ~= 0]).
   1 to: visibleArea size do: [:index |
     index + 1 to: visibleArea size do: [:index2 |
        self deny: ((visibleArea at: index) intersects: (visibleArea at: index2)).
  ]  ].

  1 to: rects size do: [:index |
     1 to: visibleArea size do: [:index2 |
        self deny: ((rects at: index) intersects: (visibleArea at: index2)).
  ]  ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testAreasOutside2 [
    | frame rects visibleArea  |
    frame := 0@0 extent: 300@300.
    rects := OrderedCollection new: 80.
    rects add: (50@50 corner: 200 @ 200);
          add: (100@100 corner: 250@250).
  
   visibleArea := Array with: frame.
   rects do: [:rect |  | remnants |
      remnants := OrderedCollection new.
      visibleArea do: [:a | remnants addAll: (a areasOutside: rect)].
      visibleArea := remnants.
  ].
  visibleArea := visibleArea asArray.
  self assert: (visibleArea allSatisfy: [:r | r area ~= 0]).

   1 to: visibleArea size do: [:idx |
     idx + 1 to: visibleArea size do: [:idx2 |
        self deny: ((visibleArea at: idx) intersects: (visibleArea at: idx2)).
  ]  ].

  1 to: rects size do: [:idx |
     1 to: visibleArea size do: [:idx2 |
        self deny: ((rects at: idx) intersects: (visibleArea at: idx2)).
  ]  ].


]

{
	#category : #tests-accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testBottom [
|rect|
rect:=(0 @ 0 corner: 20 @ 20) bottom:10.
self assert: rect bottom = 10.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testCenter  [
	| r1 c |
	r1 := 0@0 extent: 10@20.
	c := r1 center.
	self assert: (r1 containsPoint: c) description: 'the center is inside the rectangle'.
	self assert: (r1 topLeft distanceTo: c) = (r1 bottomRight distanceTo: c).
	self assert: (r1 bottomLeft distanceTo: c) = (r1 topRight distanceTo: c).
	self assert: (r1 topLeft distanceTo: c) = (r1 bottomLeft distanceTo: c).
	self assert: (r1 translateBy: -20@10) center = (c translateBy: -20@10) description: 'the center is translated with the rectangle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testCenterEmpty [

      | r1 c |
      r1 := 30@10 corner: 10@20.
		"does not create an empty rectangle"
      c := r1 center.
      self assert: (r1 containsPoint: c) description: 'A rectangle contain its center.'.
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomRight distanceTo: c).
      self assert: (r1 bottomLeft distanceTo: c) = (r1 topRight distanceTo: c).
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomLeft distanceTo: c).
      self assert: (r1 translateBy: -20@10) center = (c translateBy: -20@10) description: 'the center is translated with the rectangle'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testCenterEmpty2 [

      | r1 c |
      r1 := 0@0 corner: 0@0.
		"does not create an empty rectangle"
      c := r1 center.
      self deny: (r1 containsPoint: c) description: 'An empty rectangle does not contain its center.'.
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomRight distanceTo: c).
      self assert: (r1 bottomLeft distanceTo: c) = (r1 topRight distanceTo: c).
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomLeft distanceTo: c).
      self assert: (r1 translateBy: -20@10) center = (c translateBy: -20@10) description: 'the center is translated with the rectangle'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testCenterEmptyBasedOnPointPoint [

      | r1 c |
		r1 := Rectangle point: 30@10 point: 10@20.
		"does not create an empty rectangle"
      c := r1 center.
      self assert: (r1 containsPoint: c) description: 'A rectangle contain its center.'.
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomRight distanceTo: c).
      self assert: (r1 bottomLeft distanceTo: c) = (r1 topRight distanceTo: c).
      self assert: (r1 topLeft distanceTo: c) = (r1 bottomLeft distanceTo: c).
      self assert: (r1 translateBy: -20@10) center = (c translateBy: -20@10) description: 'the center is translated with the rectangle'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testFlip [

	| r1 c r1Horiz r1Vert |
   r1 := 30@10 corner: 10@20.
   c := 5@5.
   r1Horiz := r1 flipBy: #horizontal centerAt: c.
   r1Vert := r1 flipBy: #vertical centerAt: c.

   self assert: r1 area = r1Horiz area description: 'flip preserves area'.
   self assert: r1 area = r1Vert area description: 'flip preserves area'.

 	self assert: r1 extent = r1Horiz extent description: 'flip preserves extent'.
	self assert: r1 extent = r1Vert extent description: 'flip preserves extent'.
	self assert:  (r1 flipBy: #horizontal centerAt: r1 center) = r1.
	self assert:  (r1 flipBy: #vertical centerAt: r1 center) = r1
]

{
	#category : #tests-transforming,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testFlipByCenterAt [

	| rectangle |
	
	rectangle := 10 @ 10 corner: 20 @ 20.
	self assert: (10 @ 0 corner: 20 @ 10) equals: (rectangle flipBy: #vertical centerAt: 10 @ 10).
	self assert: (0 @ 10 corner: 10 @ 20) equals: (rectangle flipBy: #horizontal centerAt: 10 @ 10)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testInsettingByNumberShouldWork [

	| rec1 rec2 |
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: 30.
	
	self assert: rec2 height = 140. 
	self assert: rec2 width = 40. 
	
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: 50.
	
	self assert: rec2 height = 100. 
	self assert: rec2 width = 0. 
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testInsettingByRectangleShouldNotProduceNegativeRectangle [

	| rec1 rec2 |
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: (1@2 rectangle: 5@10).
	
	self assert: rec2 left = 1. 
	self assert: rec2 right = 95. 
	self assert: rec2 top = 2. 
	self assert: rec2 bottom = 190. 
	
	
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: (46@2 rectangle: 55@10).
	
	self assert: rec2 left = 46. 
	self assert: rec2 right = 46. 
	self assert: rec2 top = 2. 
	self assert: rec2 bottom = 190. 
	
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: (46@2 rectangle: 55@10).
	
	self assert: rec2 left = 46. 
	self assert: rec2 right = 46. 
	self assert: rec2 top = 2. 
	self assert: rec2 bottom = 190. 
	
	rec1 := 0@0 extent: 100@200.
	rec2 := rec1 insetBy: (1@102 rectangle: 5@105).
	
	self assert: rec2 left = 1. 
	self assert: rec2 right = 95. 
	self assert: rec2 top = 102. 
	self assert: rec2 bottom = 102. 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testInsettingLargerThanRectangleExtentShouldNotProduceNegativeExtent [

	| rec1 rec2 |
	rec1 := 0@0 extent: 100@100.
	rec2 := rec1 insetBy: 200@200.
	
	self assert: rec2 height >= 0. 
	self assert: rec2 width >= 0. 
	
	rec1 := 0@0 extent: 100@100.
	rec2 := rec1 insetBy: 50@50.
	"because insetBy: reduces from both sides"
	self assert: rec2 height = 0. 
	self assert: rec2 width = 0. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testInsettingSmallerThanRectangleExtentShouldProduceCorrectExtent [

	| rec1 rec2 |
	rec1 := 0@0 extent: 100@100.
	rec2 := rec1 insetBy: 40@40.
	
	self assert: rec2 height = 20. 
	self assert: rec2 width = 20. 
]

{
	#category : #tests-accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testLeft [
|rect|
rect:=(0 @ 0 corner: 20 @ 20) left:10.
self assert: rect left = 10.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingDisjointRectangles [

	| aCollection merge |
	aCollection := OrderedCollection new.
	aCollection add: (Rectangle left: -10 right: 0 top: -10 bottom: 0).
	aCollection add: (Rectangle left: 0 right: 10 top: 0 bottom: 10).
	merge := Rectangle merging: aCollection.
	self assert: merge = (Rectangle left: -10 right: 10 top: -10 bottom: 10).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingNestedRectanglesReturnTheContainer [

	| aCollection merge |
	aCollection := OrderedCollection new.
	aCollection add: (Rectangle left: 1 right: 10 top: 1 bottom: 10).
	aCollection add: (Rectangle left: 4 right: 5 top: 4 bottom: 5).
	merge := Rectangle merging: aCollection.
	self assert: merge = aCollection first.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingOneRectangleReturnsThisRectangle [
	| aCollection mergingRectangle |
	aCollection := OrderedCollection new.
	aCollection add: rectangle1.
	mergingRectangle := Rectangle merging: aCollection.
	self assert: mergingRectangle = aCollection first
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingOverlappingRectangles [
	| aCollection merge |
	aCollection := OrderedCollection new.
	aCollection
		add: (Rectangle
				left: 5
				right: 10
				top: 0
				bottom: 15);
		
		add: (Rectangle
				left: 0
				right: 15
				top: 5
				bottom: 10).
	merge := Rectangle merging: aCollection.
	self assert: merge
			= (Rectangle
					left: 0
					right: 15
					top: 0
					bottom: 15)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingOverlappingRects [

	| coll merge |
	coll := OrderedCollection new.
	coll add: (Rectangle left: 5 right: 10 top: 0 bottom: 15).
	coll add: (Rectangle left: 0 right: 15 top: 5 bottom: 10).
	merge := Rectangle merging: coll.
	self assert: merge = (Rectangle left: 0 right: 15 top: 0 bottom: 15).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testMergingTwoRectangles [

	| coll merge |
	coll := OrderedCollection new.
	coll add: (Rectangle left: 1 right: 1 top: 1 bottom: 1).
	coll add: (Rectangle left: 10 right: 10 top: 10 bottom: 10).

	merge := Rectangle merging: coll.
	self assert: merge = (Rectangle left: 1 right: 10 top: 1 bottom: 10).
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testPointNearestTo [

	| rectangle negativeRectangle |
	rectangle := 10 @ 10 corner: 20 @ 20.
	self assert: 10 @ 10 equals: (rectangle pointNearestTo: 9 @ 9).
	self assert: 20 @ 20 equals: (rectangle pointNearestTo: 21 @ 21).
	self assert: 10 @ 20 equals: (rectangle pointNearestTo: 9 @ 21).
	self assert: 20 @ 10 equals: (rectangle pointNearestTo: 21 @ 10).
	self assert: 10 @ 15 equals: (rectangle pointNearestTo: 11 @ 15).
	self assert: 15 @ 10 equals: (rectangle pointNearestTo: 15 @ 13).
	self assert: 20 @ 15 equals: (rectangle pointNearestTo: 17 @ 15).
	self assert: 15 @ 20 equals: (rectangle pointNearestTo: 15 @ 18).
	negativeRectangle := -10 @ -10 corner: -20 @ -20.
	self assert: -10 @ -10 equals: (negativeRectangle pointNearestTo: 0@0).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testPointPointConstructorIsSymmetrical [
	| pt1 pt2 rect1 rect2 |

	pt1:= 0@0.
	pt2 := 10@10.
    
	rect1 := Rectangle point: pt1 point: pt2.
	rect2 := Rectangle point: pt2 point: pt1.
	
	self assert: rect1 equals: rect2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testRectangleWithNegativeExtentShouldHaveZeroExtent [
	
	self assert: (Rectangle origin: 10@10 extent: -5@ -5) extent = (0@0).
	self assert: (Rectangle origin: 10@10 extent: -5@ -5) origin = (10@10).
		self assert: (Rectangle origin: 10@10 extent: 50@ 60) extent = (50@60).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testRectanglesWithSameOriginIntersect [

    | rect1 rect2 |
   rect1 := 10@10 corner: 20@30.
   rect2 := rect1 corner extent: 20@40.
   self deny: (rect1 intersects: rect2).
]

{
	#category : #tests-accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testRight [
|rect|
rect:=(0 @ 0 corner: 20 @ 20) right:10.
self assert: rect right = 10.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testRotateBy [
	| rect |
	
	rect := Rectangle left:0  right:6  top:4  bottom:2. 

	self assert: (rect rotateBy:#left centerAt:0@0) left = 2.
	self assert: (rect rotateBy:#left centerAt:0@0) right = 4.
	self assert: (rect rotateBy:#left centerAt:0@0) top = -6.
	self assert: (rect rotateBy:#left centerAt:0@0) bottom = 0.
	
	self assert: (rect rotateBy:#right centerAt:0@0) left = -4.
	self assert: (rect rotateBy:#right centerAt:0@0) right = -2.
	self assert: (rect rotateBy:#right centerAt:0@0) top = 0.
	self assert: (rect rotateBy:#right centerAt:0@0) bottom = 6.
	
	self assert: (rect rotateBy:#pi centerAt:0@0) left = -6.
	self assert: (rect rotateBy:#pi centerAt:0@0) right = 0.
	self assert: (rect rotateBy:#pi centerAt:0@0) top = -4.
	self assert: (rect rotateBy:#pi centerAt:0@0) bottom = -2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testScaleBy [
	| rect |
	rect:= (2@2 corner: 6@4). 
	
	self assert: (rect scaleBy: 2) left = 4.
	self assert: (rect scaleBy: 2) right = 12.
	self assert: (rect scaleBy: 2) top = 4.
	self assert: (rect scaleBy: 2) bottom = 8.
	
	self assert: (rect scaleBy: (1/2)) left = 1.
	self assert: (rect scaleBy: (1/2)) right = 3.
	self assert: (rect scaleBy: (1/2)) top = 1.
	self assert: (rect scaleBy: (1/2)) bottom = 2.
	
	self assert: (rect scaleBy: 0) left = 0.
	self assert: (rect scaleBy: 0) right = 0.
	self assert: (rect scaleBy: 0) top = 0.
	self assert: (rect scaleBy: 0) bottom = 0.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testSettingLeftDoesNotProduceInvalidRectangle [
  
	| rect1 rect2 |
	
	rect1 := 0@0 corner: 40@40.

	"the left side of new rectangle wants to be beyond the right side of it"
	rect2 := rect1 left: 50.
	
	self assert: rect2 left equals: 40.
	self assert: rect2 right equals: 50.
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testSideNearestTo [
	"rectangular area of screen implies that negalive coordinates not allowed"
	| rectangle |
	rectangle := 5 @ 5 corner: 45 @ 45.
	self assert: #left equals: (rectangle sideNearestTo: 4 @ 34).
	self assert: #right equals: (rectangle sideNearestTo: 60 @ 21).
	self assert: #top equals: (rectangle sideNearestTo: 25 @ 1).
	self assert: #bottom equals: (rectangle sideNearestTo: 23 @ 65)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testStoreOn [
	| assoc assoc2 |
	assoc := (0 @ 0 extent: 1 @ 1) -> 0.
	assoc2 := self class compiler evaluate: assoc storeString.
	self assert: assoc key = assoc2 key.
	self assert: assoc value = assoc2 value
]

{
	#category : #tests-accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testTop [
|rect|
rect:=(0 @ 0 corner: 20 @ 20) top:10.
self assert: rect top = 10.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testTranslateBy [
	| rect |
	rect:= (2@2 corner: 6@4).
	
	self assert: (rect translateBy:2) left = 4.
	self assert: (rect translateBy:2) right = 8.
	self assert: (rect translateBy:2) top = 4.
	self assert: (rect translateBy:2) bottom = 6.
	
	self assert: (rect translateBy:(2 negated)) left = 0.
	self assert: (rect translateBy:(2 negated)) right = 4.
	self assert: (rect translateBy:(2 negated)) top = 0.
	self assert: (rect translateBy:(2 negated)) bottom = 2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testTwoRectanglesWithAnAdjascentBorderDoNotIntersect [
  
   | rect1 rect2 |
   rect1 := 0@0 corner: 40@40.
   rect2 := 40@0 extent:40@40.
   self deny: (rect1 intersects: rect2);
        deny: (rect2 intersects: rect1).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testTwoRectanglesWithAnAdjascentCornerDoNotIntersect [
  
   | rect1 rect2 |
   rect1 := 0@0 corner: 40@40.
   rect2 := 40@40 corner: 50@50.
   self deny: (rect1 intersects: rect2);
        deny: (rect2 intersects: rect1).
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithBottom [

	| r |
	r := Rectangle new.
	r := (0 @ 0) corner: (5 @ 5).
	self assert: (r withBottom: 7) = ((0 @ 0) corner: (5 @ 7)).
	self assert: (r withBottom: 3) = ((0 @ 0) corner: (5 @ 3)).

	r := Rectangle new.
	r := (-5 @ -10) corner: (-2 @ -3).
	self assert: (r withBottom: -2) = ((-5 @ -10) corner: (-2 @ -2)).
	self assert: (r withBottom: 5) = ((-5 @ -10) corner: (-2 @ 5)).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithBottomDoesNotProduceInvalidRectangle [
	"self debug: #testWithBottomDoesNotProduceInvalidRectangle"

	| rect1 rect2 |
	rect1 := 0@10 corner: 50@60.
	
	"it is possible to adjust the bottom below the current bottom side"
	rect2 := rect1 withBottom: 100.
	self assert: rect2 bottom equals: 100.

	"it is possible to adjust the bottom above the current bottom side"
	rect2 := rect1 withBottom: 40.
	self assert: rect2 bottom equals: 40.
	
	"it is possible to adjust the bottom above the current bottom side but not above the top"
	rect2 := rect1 withBottom: -10.
	self assert: rect2 bottom equals: 10.
	self assert: rect2 height isZero
	
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithHeight [

	| r |
	r := Rectangle new.
	r := 1 @ 2 corner: 5 @ 5.
	self assert: (r withHeight: 7) = (1 @ 2 corner: 5 @ 9).
	self assert: (r withHeight: 3) = (1 @ 2 corner: 5 @ 5).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithLeftDoesNotProduceInvalidRectangle [
	"self debug: #testWithLeftDoesNotProduceInvalidRectangle"

	| rect1 rect2 |
	rect1 := 0@10 corner: 50@60.
	
	"it is possible to adjust the left to the left of the current left side"
	rect2 := rect1 withLeft: -10.
	self assert: rect2 left equals: -10.

	"it is possible to adjust the left to the right of the current left side but not over the righ side!!!!"
	rect2 := rect1 withLeft: 40.
	self assert: rect2 left equals: 40.
	
	"it is possible to adjust the left to be to the right of the current left side but not over the righ side, at the maximum 
	you will a zero width rectangle!!!!"
	rect2 := rect1 withLeft: 80.
	self assert: rect2 left equals: 50.
	self assert: rect2 width isZero
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithRightDoesNotProduceInvalidRectangle [
	"self debug: #testWithRightDoesNotProduceInvalidRectangle"

	| rect1 rect2 |
	rect1 := 0@10 corner: 50@60.
	
	"it is possible to adjust the right to the right of the current right side"
	rect2 := rect1 withRight: 100.
	self assert: rect2 right equals: 100.

	"it is possible to adjust the right to the left of the current right side but not over the left side!!!!"
	rect2 := rect1 withRight: 40.
	self assert: rect2 right equals: 40.
	
	"it is possible to adjust the right to be to the left of the current right side but not over the left side itself, at the maximum 
	you will a zero width rectangle!!!!"
	rect2 := rect1 withRight: -10.
	self assert: rect2 right equals: 0.
	self assert: rect2 width isZero
	
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithTop [

	| r |
	r := Rectangle new.
	r := 0 @ 0 corner: 5 @ 5.
	self assert: (r withTop: -2) = (0 @ -2 corner: 5 @ 5).
	self assert: (r withTop: 3) = (0 @ 3 corner: 5 @ 5).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithTopDoesNotProduceInvalidRectangle [
	"self debug: #testWithTopDoesNotProduceInvalidRectangle"

	| rect1 rect2 |
	rect1 := 0@10 corner: 50@60.
	
	"it is possible to adjust the top above of the current top side"
	rect2 := rect1 withTop: -10.
	self assert: rect2 top equals: -10.

	"it is possible to adjust the top below of the current top side"
	rect2 := rect1 withTop: 40.
	self assert: rect2 top equals: 40.
	
	"it is possible to adjust the top below of the current top side but not below the bottom"
	rect2 := rect1 withTop: 70.
	self assert: rect2 top equals: 60.
	self assert: rect2 height isZero
	
]

{
	#category : #'tests-rectangle functions',
	#timestamp : ' 8/31/2017 05:26:43'
}
RectangleTest>>testWithWidth [

	| r |
	r := Rectangle new.
	r := 1 @ 2 corner: 5 @ 5.
	self assert: (r withWidth: 7) = (1 @ 2 corner: 8 @ 5).
	self assert: (r withWidth: 3) = (1 @ 2 corner: 4 @ 5).
]
