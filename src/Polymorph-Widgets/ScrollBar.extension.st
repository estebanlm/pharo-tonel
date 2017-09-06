Extension {
	#name : #ScrollBar
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
ScrollBar class>>imageColorFor: aScrollbar [
	"Return the (button) image colour for the given scrollbar."
	
	^self theme scrollbarImageColorFor: aScrollbar
]
