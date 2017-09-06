"

"
Class {
	#name : #GLMNoBrowserTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMNoBrowserTest>>testCreation [

	self deny: GLMNoBrowser new isNil.
	self assert: (GLMNoBrowser new) == GLMNoBrowser new
]
