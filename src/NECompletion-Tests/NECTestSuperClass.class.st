"
I'm only for SUnit TestCases.
"
Class {
	#name : #NECTestSuperClass,
	#superclass : #Object,
	#instVars : [
		'superInstVar'
	],
	#classVars : [
		'SuperClassVar'
	],
	#category : #NECompletion-Tests,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECTestSuperClass class>>initialize [
	SuperClassVar := Dictionary new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECTestSuperClass>>initialize [
	superInstVar := Dictionary new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECTestSuperClass>>testIt: aString [
	self subclassResponsibility 
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECTestSuperClass>>toBeOverriden: anArgument  [
	15 > 16
		ifTrue: [self sample * anArgument ]
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECTestSuperClass>>toBeOverridenWithReturn [
	^ 'saga'
]
