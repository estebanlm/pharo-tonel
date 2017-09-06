"
A MessageSendDebugAction is an action that sends a message to a receiver with the right amount of arguments. 

To specify the receiver subclasses have to override the method #receiver. Furthermoe subclasses must specify an id. The selector is optional as the id will be used if no selector is present/


Instance Variables
	id:		<Object>
	selector:		<Object>

id
	- xxxxx

selector
	- xxxxx

"
Class {
	#name : #MessageSendDebugAction,
	#superclass : #DebugAction,
	#instVars : [
		'id',
		'selector'
	],
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>arguments [

	^ #()
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>executeAction [
	
	self receiver 
		perform: self selector
		withEnoughArguments: self arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>id [

	^ id
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>id: aSymbol [
	
	id := aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>receiver [

	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>selector [

	^ selector ifNil: [ self id ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
MessageSendDebugAction>>selector: aSymbol [

	selector := aSymbol
]
