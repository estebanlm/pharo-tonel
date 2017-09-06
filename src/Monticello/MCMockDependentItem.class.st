"
Mock for dependency testing
"
Class {
	#name : #MCMockDependentItem,
	#superclass : #MCMock,
	#instVars : [
		'name',
		'provides',
		'requires'
	],
	#category : #Monticello-Mocks,
	#timestamp : 'TorstenBergmann 2/5/2014 13:52'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>><= other [
	^ self name <= other name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>name [

	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>name: aString [

	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>provides: anArray [

	provides := anArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>provisions [

	^ provides ifNil: [#()]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>requirements [

	^ requires ifNil: [#()]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDependentItem>>requires: anArray [

	requires := anArray
]
