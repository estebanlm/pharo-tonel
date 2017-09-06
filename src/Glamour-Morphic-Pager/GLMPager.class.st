"

"
Class {
	#name : #GLMPager,
	#superclass : #GLMFinder,
	#instVars : [
		'scrollButtonIconRenderBlock',
		'minimumPageNumberForScrollbar'
	],
	#category : #Glamour-Morphic-Pager-Glamour,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager class>>extensionsPragma [
	^ #gtInspectorPresentationOrder:
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>minimumPageNumberForScrollbar [

	^ minimumPageNumberForScrollbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>minimumPageNumberForScrollbar: aNumber [

	minimumPageNumberForScrollbar := aNumber
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>renderGlamorouslyOn: aRenderer [

	^ aRenderer renderPager: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>scrollButtonIconRenderBlock [

	^ scrollButtonIconRenderBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>scrollButtonIconRenderBlock: aBlock [

	scrollButtonIconRenderBlock := aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPager>>shouldDisplayPresentationCreatedBy: aCollection  [
	^ true
]
