"
A ""Print It"" action on a text. When the text is clicked the text is seen as source code and evaluated. After that the result is printed
"
Class {
	#name : #TextPrintIt,
	#superclass : #TextDoIt,
	#category : #Text-Core
}

{ #category : #'as yet unclassified' }
TextPrintIt >> actOnClick: anEvent for: anObject in: paragraph editor: editor [

	| result |
	result := Smalltalk compiler evaluate: evalString for: anObject logged: false.
	UIManager inform: result printString.
	^ true 
]

{ #category : #styling }
TextPrintIt >> writeScanOn: strm [

	strm nextPut: $P; nextPutAll: evalString; nextPutAll: ';;'
]
