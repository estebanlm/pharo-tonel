"
I simply wrap an existing glamour action. Currently I just return the action when one send #asGlamourAction.
"
Class {
	#name : #GTGlamourWrapperDebuggingAction,
	#superclass : #DebugAction,
	#instVars : [
		'glamourAction'
	],
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 1/11/2016 16:05'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGlamourWrapperDebuggingAction class>>gtActionFor: aDebugger [
	<gtContextCodeDebuggingAction>
	|index|
	
	index := 0.
	^ aDebugger codePresentation defaultSelectionActions collect: [ :each | 
			self new 
				glamourAction: each;
				order: (index := index + 10) ]
]

{
	#category : #transformation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGlamourWrapperDebuggingAction>>asGlamourAction [
	|actionBlock|
	actionBlock := glamourAction action.
	
	^ glamourAction
		action: [ :presentation :entity |
			self precondition ifTrue: [ 
				self preAction.
				actionBlock cull: presentation cull: entity.
				self postAction ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGlamourWrapperDebuggingAction>>glamourAction: anObject [
	glamourAction := anObject.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGlamourWrapperDebuggingAction>>initialize [
	super initialize.
	self needsUpdate: false.
	self needsValidation: false.
]
