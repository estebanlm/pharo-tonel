"

"
Class {
	#name : #GLMTransmissionScriptingTest,
	#superclass : #TestCase,
	#instVars : [
		'browser'
	],
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>setUp [
	browser := GLMExplicitBrowser new.
	browser addPane: (GLMPane new name: #one).
	browser addPane: (GLMPane new name: #two).
	browser addPane: (GLMPane new name: #three).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>testFrom [
	browser transmit from: #one.
	self assert: browser transmissions first origins first pane equals: browser panes first.
	self assert: browser transmissions first origins first name equals: GLMPortIdentifier defaultOriginPortName
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>testFromPort [
	browser transmit from: #one port: #port.
	self assert: browser transmissions first origins first pane equals: browser panes first.
	self assert: browser transmissions first origins first name equals: #port
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>testTo [
	browser transmit to: #one.
	self assert: browser transmissions first destination pane equals: browser panes first.
	self assert: browser transmissions first destination name equals: GLMPortIdentifier defaultTargetPortName
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>testToPort [
	browser transmit to: #one port: #port.
	self assert: browser transmissions first destination pane equals: browser panes first.
	self assert: browser transmissions first destination name equals: #port
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTransmissionScriptingTest>>testToWatcher [
	browser transmit toWatcher.
	self assert: browser transmissions first destination pane equals: browser watcherPane
]
