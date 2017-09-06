"

"
Class {
	#name : #GLMPortReferenceTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortReferenceTest>>testOriginTransformedValue [
	| port reference |
	port := GLMSimplePort new value: 41.
	reference := (GLMOriginPortReference new)
		port: port;
		transformation: [ :x | x + 1 ].
	self assert: reference value equals: 42
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortReferenceTest>>testOriginValue [
	| port reference |
	port := GLMSimplePort new value: 42.
	reference := GLMOriginPortReference new port: port.
	self assert: reference value equals: 42
]
