"
SUnit Test for PointArray
"
Class {
	#name : #PointArrayTest,
	#superclass : #TestCase,
	#instVars : [
		'pointArray'
	],
	#category : #Balloon-Tests-Collections,
	#timestamp : 'tbn 3/25/2011 15:06'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>setUp  [

	super setUp.
	pointArray := PointArray with: 0@0 with: 10@3
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAt [

	self assert: 0@0 equals: (pointArray at: 1).
	self assert: 10@3 equals: (pointArray at: 2)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAtPut [

	pointArray at: 2 put: -1 @ -1.
	self assert: 0 @ 0 equals: (pointArray at: 1).
	self assert: -1 @ -1 equals: (pointArray at: 2)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAtPutFloat [

	pointArray at: 2 put: 1.2 @ 5.5.
	self assert: 1 @ 5 equals: (pointArray at: 2)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAtPutFraction [

	pointArray at: 2 put: 1/2 @ 51/5.
	self assert: 0 @ 10 equals: (pointArray at: 2)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAtPutInt4 [

	pointArray at: 2 put: 405933 @ -405933.
	self assert: 405933@ -405933 equals: (pointArray at: 2)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testAtPutLargeInteger [

	self should:  [pointArray at: 2 put: 123456789012345678901234567890@987654323456787654378989] raise: Error.	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testBounds [

	self assert: (0@0 corner: 10@3) equals: pointArray bounds
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testDefaultElement [

	self assert: 0@0 equals: pointArray defaultElement
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
PointArrayTest>>testSize [

	self assert: 2 equals: pointArray size
		
]
