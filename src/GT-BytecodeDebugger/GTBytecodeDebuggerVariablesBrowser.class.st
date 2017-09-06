"
I provide a different view of all variables from  a Context suitable for a bytecode debugger:
- I show the complete stack of variables stored by the context (both named and unnamed variables)
- I show the slots of the receiver object using the notation rcv0, rcv1, etc., as this is how slots are accessed in bytecode instructions
"
Class {
	#name : #GTBytecodeDebuggerVariablesBrowser,
	#superclass : #GTDebuggerVariablesBrowser,
	#category : #GT-BytecodeDebugger-UI,
	#timestamp : 'AndreiChis 12/30/2015 11:03'
}

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerVariablesBrowser>>buildVariablesFromContext: aContext  [

	^ aContext gtBytecodeDebuggerRetrieveContextValues
]

{
	#category : #'private building',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerVariablesBrowser>>variablesIn: aComposite [

	^ (super variablesIn: aComposite)
		sorted: nil
]
