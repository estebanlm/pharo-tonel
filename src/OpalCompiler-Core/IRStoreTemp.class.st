"
store temp
"
Class {
	#name : #IRStoreTemp,
	#superclass : #IRTempAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:48'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreTemp>>accept: aVisitor [
	^ aVisitor visitStoreTemp: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreTemp>>isStore [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreTemp>>popIntoNode [
	^ IRPopIntoTemp new
		name: name;
		yourself
]
