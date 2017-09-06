"
I model the pushTemporary Bytecode
"
Class {
	#name : #IRTempAccess,
	#superclass : #IRAccess,
	#instVars : [
		'name'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempAccess>>isRemoteTemp [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempAccess>>isTemp [
	^true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempAccess>>name [

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempAccess>>name: aString [
	name := aString
]
