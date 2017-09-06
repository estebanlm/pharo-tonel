"
i just a stub for rendering nothing , so that all update requests (like from Morhpic), are simply ignored
"
Class {
	#name : #OSNullFormRenderer,
	#superclass : #OSWindowFormRenderer,
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 17:02'
}

{
	#category : #size,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullFormRenderer>>newExtent: anExtent [

]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullFormRenderer>>updateAll [
	"Do nothing"
]

{
	#category : #'morphic integration',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullFormRenderer>>updateAreas: allDamage immediate: forceToScreen [
	"Do Nothing"
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullFormRenderer>>updateRectangle: aRectangle [
	"Do nothing"
]
