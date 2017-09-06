"
I model the pushRemoteTemporary Bytecode
"
Class {
	#name : #IRRemoteTempAccess,
	#superclass : #IRTempAccess,
	#instVars : [
		'tempVectorName'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:14'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteTempAccess>>isRemoteTemp [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteTempAccess>>tempVectorName [
	^ tempVectorName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteTempAccess>>tempVectorName: anObject [
	tempVectorName := anObject
]
