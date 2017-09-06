"

"
Class {
	#name : #MCScannerTest,
	#superclass : #MCTestCase,
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>assertScans: anArray [
	self assert: (MCScanner scan: anArray printString readStream) = anArray
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test1 [
	self assertScans: #(a '23' (x))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test2 [
	self assertScans: 'it''s alive'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test3 [
	self assert: (MCScanner scan: '(a #b c)' readStream) = #(a #b c)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test4 [
	self assertScans: #(a '23' (x () ')''q' y12)).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test5 [
	self assertScans: #((a) b)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCScannerTest>>test6 [
	self should: [MCScanner scan: '(a b' readStream] raise: Error
]
