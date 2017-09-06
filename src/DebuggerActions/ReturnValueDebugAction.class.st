"
A ReturnValueDebugAction forces a return of a given value to the previous context

"
Class {
	#name : #ReturnValueDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
ReturnValueDebugAction class>>actionType [
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ReturnValueDebugAction>>defaultLabel [

	^ 'Return entered value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ReturnValueDebugAction>>defaultOrder [

	^ 50
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
ReturnValueDebugAction>>executeAction [
	|expression value|
	
	expression := UIManager default request: 'Enter expression for return value:'.
	value := self class compiler
			source: expression;
			context: self currentContext;
			receiver: self currentContext receiver;
			evaluate.

	self session returnValue: value from: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ReturnValueDebugAction>>id [

	^ #returnValue
]
