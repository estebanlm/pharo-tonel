"
Example for multi-touch devices.

"
Class {
	#name : #SDL2TouchExample,
	#superclass : #SDL2AthensExample,
	#instVars : [
		'circle',
		'moveToDraw'
	],
	#category : #OSWindow-SDL2-Examples-Touch,
	#timestamp : 'MerwanOuddane 8/21/2015 14:06'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample class>>example [
	^ self new open
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>backgroundColor [
	^ Color white
]

{
	#category : #'manage move',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>beginMove: touchId at: position [
	moveToDraw at: touchId put: (SDL2TouchStateMachine for: position * self defaultExtent)
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>clearSurface [
	renderer athensSurface
		drawDuring:
			[ :canvas | 
			canvas setPaint: self backgroundColor.
			canvas drawShape: (0 @ 0 extent: self defaultExtent) ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>createEventHandler [
	^OSWindowTouchEventHandler new
		touchExample: self;
		yourself
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>drawCircleAt: point color: color [
	renderer athensSurface
		drawDuring: [ :canvas | 
			canvas pathTransform translateBy: point.
			canvas
				setPaint: color;
				setShape: circle;
				draw ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>drawMoves [
	moveToDraw
		do:
			[ :each | 
			| first last moves color path |
			first := each first.
			last := each finish.
			moves := each move.
			color := each color.
			path := renderer athensSurface
				createPath:
					[ :builder | 
					builder
						absolute;
						moveTo: first.
					moves do: [ :move | builder lineTo: move ] ].
			self drawCircleAt: first color: color.
			renderer athensSurface
				drawDuring: [ :canvas | 
					canvas
						setStrokePaint: color;
						setShape: path;
						draw ].
			last ifNotNil: [ self drawCircleAt: last color: color ] ]
]

{
	#category : #'manage move',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>endMove: touchId at: position [
	(moveToDraw at: touchId) finish: position * self defaultExtent.
	[ 
	| d |
	d := Delay forMilliseconds: 3000.
	d wait.
	moveToDraw removeKey: touchId ifAbsent: [  ] ] fork
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>initialize [
	super initialize.
	moveToDraw := Dictionary new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>initializeFromSurface [
	circle := renderer athensSurface
		createPath:
			[ :builder | 
			builder
				absolute;
				moveTo: -5 @ 0;
				ccwArcTo: 0 @ 5 angle: 90 degreesToRadians;
				ccwArcTo: 5 @ 0 angle: 90 degreesToRadians;
				ccwArcTo: 0 @ -5 angle: 90 degreesToRadians;
				ccwArcTo: -5 @ 0 angle: 90 degreesToRadians ]
]

{
	#category : #'manage move',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>move: touchId at: position [
	(moveToDraw at: touchId) add: position * self defaultExtent
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchExample>>redraw [
	self clearSurface.
	self drawMoves
]
