"
I am a debugging action for stepping to a selected bytecode.
"
Class {
	#name : #GTStepToBytecodeDebugAction,
	#superclass : #DebugAction,
	#category : #GT-BytecodeDebugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 10:52'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction class>>gtBytecodeDebuggerActionFor: aDebugger [
	<gtContextBytecodeCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousPlay
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction>>"protocol: testing"
appliesToDebugger: aDebugger [

	^ (aDebugger session isContextPostMortem: aDebugger currentContext) not and: [ 
		aDebugger bytecodePresentation selection offset > aDebugger currentContext pc ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction>>defaultLabel [

	^ 'Step to bytecode'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction>>defaultOrder [

	^ 10
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction>>executeAction [

	self session
		runToBytecode: self debugger bytecodePresentation selection 
		inContext: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTStepToBytecodeDebugAction>>id [

	^ GTStepToBytecodeDebugAction name
]
