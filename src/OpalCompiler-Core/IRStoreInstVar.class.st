"
store inst var
"
Class {
	#name : #IRStoreInstVar,
	#superclass : #IRInstVarAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:47'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreInstVar>>accept: aVisitor [
	^ aVisitor visitStoreInstVar: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreInstVar>>isStore [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreInstVar>>popIntoNode [
	^ IRPopIntoInstVar new
		index: index; 
		yourself
]
