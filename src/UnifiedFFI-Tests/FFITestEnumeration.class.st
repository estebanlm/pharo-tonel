"

"
Class {
	#name : #FFITestEnumeration,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'AAA',
		'BBB',
		'CCC',
		'DDD'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'accessing enum',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>AAA [
	"This method was automatically generated"
	^ AAA
]

{
	#category : #'accessing enum',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>BBB [
	"This method was automatically generated"
	^ BBB
]

{
	#category : #'accessing enum',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>CCC [
	"This method was automatically generated"
	^ CCC
]

{
	#category : #'accessing enum',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>DDD [
	"This method was automatically generated"
	^ DDD
]

{
	#category : #'enum declaration',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>enumDecl [
	^ #(AAA 1
	BBB  2
	CCC 3
	DDD 2400) 
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestEnumeration class>>initialize [
	self initializeEnumeration
]
