"

"
Class {
	#name : #AthensCairoMatrixTest,
	#superclass : #TestCase,
	#category : #Athens-Cairo-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrixTest>>testCopy [

	| m |
	m := AthensCairoMatrix new.
	self assert: m getHandle equals: m copy getHandle.
	self assert: m getHandle ~~ m copy getHandle.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrixTest>>testInverted [

	| m |
	m := AthensCairoMatrix new.
	self assert: m getHandle ~~ m inverted getHandle.
]
