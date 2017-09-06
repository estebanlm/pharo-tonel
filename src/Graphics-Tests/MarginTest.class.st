"
This is the unit test for the class Margin. 
"
Class {
	#name : #MarginTest,
	#superclass : #TestCase,
	#category : #Graphics-Tests-Primitives,
	#timestamp : 'HenrikNergaard 7/28/2016 20:07'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testConstruction [

	| margin |
	
	margin := Margin top: 1 left: 2 bottom: 3 right: 4.
	
	self assert: margin asMargin == margin.
	
	self 
		assert: margin left 		equals: 2;
		assert: margin right 		equals: 4;
		assert: margin top 		equals: 1;
		assert: margin bottom 	equals: 3;
		assert: margin width 		equals: 6;
		assert: margin height 	equals: 4.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testExpandRectangle [

	| rect |
	
	rect := 2 asMargin expandRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: ((2@2) negated extent: 14@14).
	
	rect := ( 2@1 ) asMargin expandRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: ((2@1) negated extent: 14@12).
	
	rect := (Margin top: 1 left: 2 bottom: 3 right: 4) expandRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: ((2@1) negated extent: 16@14)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testExtendRectangle [

	| rect |
	
	rect := 2 asMargin extendRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (0@0 extent: 14@14).
	
	rect := ( 2@1 ) asMargin extendRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (0@0 extent: 14@12).
	
	rect := (Margin top: 1 left: 2 bottom: 3 right: 4) extendRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (0@0 extent: 16@14)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testFromPoint [

	| margin |

	margin := Margin fromPoint: 2@1.
	
	self 
		assert: margin left 		equals: 2;
		assert: margin right 		equals: 2;
		assert: margin top 		equals: 1;
		assert: margin bottom 	equals: 1;
		assert: margin width 		equals: 4;
		assert: margin height 	equals: 2.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testInitialization [

	| margin |
	
	margin := Margin new.
	
	self assert: margin asMargin == margin.
	
	self 
		assert: margin left 		equals: 0;
		assert: margin right 		equals: 0;
		assert: margin top 		equals: 0;
		assert: margin bottom 	equals: 0;
		assert: margin width 		equals: 0;
		assert: margin height 	equals: 0;
		assert: margin isZero 	equals: true. 
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
MarginTest>>testInsetRectangle [

	| rect |
	
	rect := 2 asMargin insetRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (2@2 extent: 6@6).
	
	rect := ( 2@1 ) asMargin insetRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (2@1 extent: 6@8).
	
	rect := (Margin top: 1 left: 2 bottom: 3 right: 4) insetRectangle: (0@0 extent: 10@10).
	
	self assert: rect equals: (2@1 extent: 4@6)
]
