"

"
Class {
	#name : #GLMPortIdentifierTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testAsOriginIdentifier [
	| id |
	id := GLMPortIdentifier new.
	self assert: id asGlamourOriginIdentifier equals: id
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testAsTargetIdentifier [
	| id |
	id := GLMPortIdentifier new.
	self assert: id asGlamourTargetIdentifier equals: id
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testAssociationAsOriginIdentifier [
	self assert: ((#pane -> #port) asGlamourOriginIdentifier isKindOf: GLMPortIdentifier).
	self assert: (#pane -> #port) asGlamourOriginIdentifier paneName equals: #pane.
	self assert: (#pane -> #port) asGlamourOriginIdentifier portName equals: #port
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testAssociationAsTargetIdentifier [
	self assert: ((#pane -> #port) asGlamourTargetIdentifier isKindOf: GLMPortIdentifier).
	self assert: (#pane -> #port) asGlamourTargetIdentifier paneName equals: #pane.
	self assert: (#pane -> #port) asGlamourTargetIdentifier portName equals: #port
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testSymbolAsOriginIdentifier [
	self assert: (#pane asGlamourOriginIdentifier isKindOf: GLMPortIdentifier).
	self assert: #pane asGlamourOriginIdentifier paneName equals: #pane.
	self assert: #pane asGlamourOriginIdentifier portName equals: #selection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPortIdentifierTest>>testSymbolAsTargetIdentifier [
	self assert: (#pane asGlamourTargetIdentifier isKindOf: GLMPortIdentifier).
	self assert: #pane asGlamourTargetIdentifier paneName equals: #pane.
	self assert: #pane asGlamourTargetIdentifier portName equals: #entity
]
