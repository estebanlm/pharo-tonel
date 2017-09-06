"
This is a mock class. The Monticello tests manipulated it to simulate a developer modifying code in the image.
"
Class {
	#name : #MCMockClassA,
	#superclass : #MCMock,
	#instVars : [
		'ivar'
	],
	#classVars : [
		'CVar',
		'InitializationOrder'
	],
	#category : #MonticelloMocks,
	#timestamp : 'cwp 8/10/2003 16:43'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA class>>cVar [
	^ CVar
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA class>>initializationOrder [

	^ InitializationOrder
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA class>>initialize [
	CVar := #initialized.
	InitializationOrder := 1.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA class>>one [

	^ 1
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA class>>touchCVar [
	CVar := #touched
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>a [
	^ 'a2'
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>b [
	^ 'b1'
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>c [
	^ 'c1'
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>d [
	^ 'd'
]

{
	#category : #boolean,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>falsehood [
	^ false
]

{
	#category : #boolean,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>moreTruth [

	^ true
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>one [
	^ 1
]

{
	#category : #'drag\'n\'drop',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>q [

]

{
	#category : #boolean,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>truth [
	^ true
]

{
	#category : #numeric,
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockClassA>>two [
	^ 2
]
