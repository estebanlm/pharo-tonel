Extension {
	#name : #String
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
String>>asBrick [

	^ GLMLabelBrick new
		text: self asString;
		height: [ :b | b approximateHeight ]
]
