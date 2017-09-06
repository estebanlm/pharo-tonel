"
I know how to render a ruler in an Athens canvas.

Note: an instance of me cannot be used to render in more than one canvas.
"
Class {
	#name : #HiRulerRenderer,
	#superclass : #HiRenderer,
	#instVars : [
		'ruler',
		'rulerBuilder'
	],
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer class>>model: aModel athensCanvas: aCanvas ruler: aRuler [
	^ self basicNew
		initializeWithModel: aModel
		athensCanvas: aCanvas
		ruler: aRuler;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>canvasPointFor: aNode [
	^ (rulerBuilder centerOfColumnIndex: aNode rulerPoint x) @ (rulerBuilder centerOfRowIndex: aNode rulerPoint y)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>canvasPointsForAll: aCollectionOfNodes [
	^ aCollectionOfNodes collect: [ :rulerPoint | 
		(rulerBuilder centerOfColumnIndex: rulerPoint x) @ (rulerBuilder centerOfRowIndex: rulerPoint y) ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>initializeWithModel: aModel athensCanvas: aCanvas ruler: aRuler [
	self initialize.
		
	rulerBuilder := aModel.
	athensCanvas := aCanvas.
	ruler := aRuler.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>render [
	self renderLinks.
	self renderNodes.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>renderLinks [
	self flag: #todo. "FIX"

	ruler links do: [ :link |
		link linkBuilder renderer
			rulerBuilder: rulerBuilder;
			athensCanvas: athensCanvas;
			checkpoints: (self canvasPointsForAll: link checkpoints);
			render ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerRenderer>>renderNodes [
	ruler nodes do: [ :aNode | 
		rulerBuilder nodeBuilder renderer
			athensCanvas: athensCanvas;
			location: (self canvasPointFor: aNode);
			render ]
]
