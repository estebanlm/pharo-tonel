"
I'm a TermCap which define the styles with the printing of characters, used when OSSubProcess is not installed in the image.
Not really powerfull, better install OSSubProcess and use TermCapTput
"
Class {
	#name : #TermInfoCharacter,
	#superclass : #NullTermInfo,
	#instVars : [
		'cache'
	],
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 6/24/2016 10:49'
}

{
	#category : #TermStyle,
	#timestamp : ' 8/31/2017 07:16:54'
}
TermInfoCharacter>>on: aStream [
	"Define the stream where termcap will change the style, normaly it's used on a terminal"

	out := aStream
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:54'
}
TermInfoCharacter>>print: aString [
	"Print on the outStream aString"

	out nextPutAll: aString
]

{
	#category : #TermStyle,
	#timestamp : ' 8/31/2017 07:16:54'
}
TermInfoCharacter>>set: aString [
	self print: Character escape asString, '['   , aString
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:54'
}
TermInfoCharacter>>setBackgroundColor: aColor [

	self set: aColor asTerminfoCharacterBackground , 'm'.
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:54'
}
TermInfoCharacter>>setFontColor: aColor  [

	self set: aColor asTerminfoCharacterFont, 'm'
]
