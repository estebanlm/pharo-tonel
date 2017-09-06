Extension {
	#name : #UITheme
}

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
UITheme>>fastTableColumnResizingColor [
	^ self selectionColor
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
UITheme>>fastTableColumnSplitterSelectedColor [
	^ self selectionColor alpha: 0.3
]

{
	#category : #'*Morphic-Widgets-FastTable',
	#timestamp : ' 8/31/2017 05:26:21'
}
UITheme>>fastTableHeaderColor [
	^ self lightBackgroundColor
]
