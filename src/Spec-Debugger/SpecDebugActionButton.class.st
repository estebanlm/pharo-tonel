"
I am a button encapsulating a debug action. All my settings are set based on the corresponding debug action.
"
Class {
	#name : #SpecDebugActionButton,
	#superclass : #ButtonModel,
	#instVars : [
		'debugActionHolder'
	],
	#category : #Spec-Debugger,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebugActionButton>>debugAction [

	^ debugActionHolder value 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebugActionButton>>debugAction: aDebugAction [

	debugActionHolder value: aDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebugActionButton>>initialize [

	super initialize.

	debugActionHolder := nil asValueHolder.
	debugActionHolder whenChangedDo: [ self update ]
	
	
	
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebugActionButton>>update [

	self debugAction ifNotNil:  [ :aDebugAction | 
		self label: aDebugAction label.
		self help: aDebugAction help, Character tab asString, (aDebugAction keymap ifNil: [ '' ] ifNotNil: [ :k | k   printString]).
		self icon: aDebugAction icon.
		self enabled: aDebugAction enabled.
		self state: false.
		self action: [ aDebugAction execute ] ]
]
