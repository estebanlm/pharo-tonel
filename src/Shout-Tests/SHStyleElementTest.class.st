"
I am testing the class SHStyleElement
"
Class {
	#name : #SHStyleElementTest,
	#superclass : #TestCase,
	#instVars : [
		'element'
	],
	#category : #Shout-Tests-Styling,
	#timestamp : 'AlexandreBergel 9/30/2011 15:22'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SHStyleElementTest>>setUp [
	element := SHStyleElement withTokens: #(#self #super #true #false).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SHStyleElementTest>>testPrintOn [
	"
	self debug: #testPrintOn
	"
	self assert: element printString =  'a SHStyleElement tokens: #(#self #super #true #false)'

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SHStyleElementTest>>testStyleForTable [
	"
	self debug: #testStyleForTable
	"
	| table |
	table := element styleForTable.
	self assert: table size = 4.
	self assert: (table collect: #first) = element tokens
]
