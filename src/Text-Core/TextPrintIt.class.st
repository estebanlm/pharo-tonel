"
A ""Print It"" action on a text. When the text is clicked the text is seen as source code and evaluated. After that the result is printed
"
Class {
	#name : #TextPrintIt,
	#superclass : #TextDoIt,
	#category : #Text-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 12:16'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextPrintIt>>actOnClick: anEvent for: anObject in: paragraph editor: editor [

	| result |
	result := Smalltalk compiler evaluate: evalString for: anObject logged: false.
	UIManager inform: result printString.
	^ true 
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextPrintIt>>writeScanOn: strm [

	strm nextPut: $P; nextPutAll: evalString; nextPutAll: ';;'
]
