Extension {
	#name : #Array
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Array>>asLayoutFrame [
	 ^ LayoutFrame new fromArray: self
]
