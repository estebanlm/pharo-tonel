"
You have to call scripting methods after #model: or it will not work
"
Class {
	#name : #RbScriptingSetBeforeModel,
	#superclass : #ReInvocationSequenceRule,
	#category : #Rubric-Rules,
	#timestamp : 'YuriyTymchuk 2/25/2016 16:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RbScriptingSetBeforeModel>>group [
	^ 'Rubric'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
RbScriptingSetBeforeModel>>initialize [
	super initialize.
	
	self add: #(beForSmalltalkScripting beForSmalltalkCode) requiresPreSend: #model:
]
