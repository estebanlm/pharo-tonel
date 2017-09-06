"

"
Class {
	#name : #MCSortingTest,
	#superclass : #TestCase,
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest class>>isUnitTest [
	^false
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>classNamed: aSymbol [
	^ MCClassDefinition
		name: aSymbol
		superclassName: #Object
		category: ''
		instVarNames: #()
		comment: ''
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>methodNamed: aSymbol class: className meta: aBoolean [
	^ MCMethodDefinition
		className: className
		classIsMeta: aBoolean
		selector: aSymbol
		category: ''
		timeStamp: ''
		source: ''
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>sortDefinitions: aCollection [
	^ aCollection asSortedCollection asArray
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>sortKeyFor: aDefinition [
	^ String streamContents:
		[:s |
		aDefinition description
			do: [:ea | s nextPutAll: ea asString]
			separatedBy: [s nextPut: $.]]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>testConsistentSorting [
	| definitions shuffledAndSorted|
	definitions :=
		{self methodNamed: #a class: #A meta: false.
		self methodNamed: #a class: #A meta: true.
		self methodNamed: #a class: #B meta: false.
		self methodNamed: #b class: #A meta: false.
		self methodNamed: #b class: #B meta: false.
		self classNamed: #A.
		self classNamed: #B}.
	shuffledAndSorted :=
		(1 to: 100) collect: [:ea | self sortDefinitions: definitions shuffled].
	self assert: shuffledAndSorted asSet size = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSortingTest>>testSortOrder [
	| aA aAm aB bA bB A B cA bAm cAm |
	aA := self methodNamed: #a class: #A meta: false.
	bA := self methodNamed: #b class: #A meta: false.
	cA := self methodNamed: #c class: #A meta: false.
	aAm := self methodNamed: #a class: #A meta: true.
	bAm := self methodNamed: #b class: #A meta: true.
	cAm := self methodNamed: #c class: #A meta: true.
	aB := self methodNamed: #a class: #B meta: false.
	bB := self methodNamed: #b class: #B meta: false.
	A := self classNamed: #A.
	B := self classNamed: #B.
	self assert: (self sortDefinitions: {aA. aAm. cAm. aB. bAm. bA. bB. A. cA. B})
					= {A. aAm. bAm. cAm. aA. bA. cA. B. aB.  bB}
]
