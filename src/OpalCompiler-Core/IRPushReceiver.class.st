"
I am modelling the push self bytecode
"
Class {
	#name : #IRPushReceiver,
	#superclass : #IRAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushReceiver>>accept: aVisitor [
	^ aVisitor visitPushReceiver: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushReceiver>>canBeQuickReturn [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushReceiver>>isSelf [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushReceiver>>quickRetNode [
	^ IRReturnReceiver new
	
]
