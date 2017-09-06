"

"
Class {
	#name : #GLMTransmissionContextTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionContextTest>>testCopy [
	| context copy |
	context := GLMTransmissionContext new.
	context addPort: GLMSimplePort new.
	copy := context copy.
	self assert: copy ~~ context.
	self assert: copy ports equals: context ports.
	self assert: copy ports ~~ context ports
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionContextTest>>testForbiddenAnnouncements [
	| context pane |
	context := GLMTransmissionContext new.
	pane := GLMPane new.
	self assert: (context canAnnounceMatchingPresentationsChanged: pane).
	context forbidToAnnounceMatchingPresentationsChanged: pane.
	self assert: (context canAnnounceMatchingPresentationsChanged: pane) not
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionContextTest>>testInclues [
	| context port |
	port := GLMSimplePort new.
	context := GLMTransmissionContext new.
	context addPort: port.
	self assert: (context includesPort: port)
]
