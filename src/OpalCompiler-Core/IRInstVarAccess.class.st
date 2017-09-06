"
I am a bytecode accessing an instance variable. As such, I have an index.
"
Class {
	#name : #IRInstVarAccess,
	#superclass : #IRAccess,
	#instVars : [
		'index'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstVarAccess>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstVarAccess>>index: anInteger [
	index := anInteger
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRInstVarAccess>>isInstVarAccess [
	^ true
]
