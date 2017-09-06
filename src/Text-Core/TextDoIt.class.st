"
A doIt action on a text. When the text is clicked the text is seen as source code and evaluated
"
Class {
	#name : #TextDoIt,
	#superclass : #TextAction,
	#instVars : [
		'evalString'
	],
	#category : #Text-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 12:16'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt class>>evalString: str [
	^ self new evalString: str
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt class>>scanFrom: strm [
	"read a doit in the funny format used by Text styles on files. d10 factorial;;  end with two semicolons"

	| pos end doit |
	pos := strm position.
	[strm skipTo: $;. strm peek == $;] whileFalse.
	end := strm position - 1.
	strm position: pos.
	doit := strm next: end-pos.
	strm skip: 2.  ";;"
	^ self evalString: doit
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt>>actOnClick: anEvent for: anObject in: paragraph editor: editor [

	"Note: evalString gets evaluated IN THE CONTEXT OF anObject
	 -- meaning that self and all instVars are accessible"
	Smalltalk compiler evaluate: evalString for: anObject logged: false.
	^ true 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt>>analyze: aString [

	| list |
	list := super analyze: aString.
	evalString := list at: 1.
	^ list at: 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt>>evalString: str [
	evalString := str 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt>>info [
	^ evalString
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextDoIt>>writeScanOn: strm [

	strm nextPut: $d; nextPutAll: evalString; nextPutAll: ';;'
]
