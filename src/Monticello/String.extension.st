Extension {
	#name : #String
}

{
	#category : #'*monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
String>>extractNumber [
	^ ('0', self select: [:ea | ea isDigit]) asNumber
]
