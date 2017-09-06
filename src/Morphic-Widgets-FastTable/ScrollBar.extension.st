Extension {
	#name : #ScrollBar
}

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>canScrollDown [

	^value < 1
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>canScrollUp [

	^value > 0
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>pageDelta [
	^ pageDelta
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>scrollDownByPageDelta [
	self scrollDown: self pageDelta
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>scrollRestrictedDown: aValue [

	"only scroll if the scrollbar is not at its end yet"

	self canScrollDown ifFalse: [ ^self ].
	
	self scrollDown: aValue
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>scrollRestrictedUp: aValue [

	"only scroll if the scrollbar is not at its end yet"

	self canScrollUp ifFalse: [ ^self ].
	
	self scrollUp: aValue
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
ScrollBar>>scrollUpByPageDelta [
	self scrollUp: self pageDelta
]
