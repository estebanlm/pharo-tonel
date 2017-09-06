"
store remote temp
"
Class {
	#name : #IRStoreRemoteTemp,
	#superclass : #IRRemoteTempAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:48'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreRemoteTemp>>accept: aVisitor [
	^ aVisitor visitStoreRemoteTemp: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreRemoteTemp>>isStore [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreRemoteTemp>>popIntoNode [
	^ IRPopIntoRemoteTemp new
		name: name;
		tempVectorName: tempVectorName;
		yourself
]
