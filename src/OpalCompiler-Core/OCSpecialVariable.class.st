"
I model self, thisContext and super
"
Class {
	#name : #OCSpecialVariable,
	#superclass : #OCAbstractLocalVariable,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>emitStore: methodBuilder [

	self shouldNotImplement
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>emitValue: methodBuilder [

	methodBuilder pushReceiver
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>isSpecialVariable [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>isThisContext [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>isUninitialized [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSpecialVariable>>isWritable [
	^ false
]
