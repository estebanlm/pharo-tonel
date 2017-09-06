"
I'm a text attribute used to encode an URL.
"
Class {
	#name : #TextURL,
	#superclass : #TextAction,
	#instVars : [
		'url'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL class>>scanFrom: strm [
	"read a link in the funny format used by Text styles on files. Rhttp://www.disney.com;"

	^ self new url: (strm upTo: $;)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL>>actOnClick: anEvent for: anObject in: paragraph editor: editor [
	self notify: 'Please configure the actOnClickBlock to invoke the computation you need. In Pharo by default there is no external web browser'.
	"a possible implementation could be:
		 Smalltalk tools webBrowser openOnUrl: url."

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL>>analyze: aString [

	| list |
	list := super analyze: aString.
	url := list at: 1.
	^ list at: 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL>>info [
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL>>url: aString [
	url := aString
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextURL>>writeScanOn: strm [

	strm nextPut: $R; nextPutAll: url; nextPut: $;
]
