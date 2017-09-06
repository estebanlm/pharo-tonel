"
store literal variable
"
Class {
	#name : #IRStoreLiteralVariable,
	#superclass : #IRLiteralVariableAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:48'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreLiteralVariable>>accept: aVisitor [
	^ aVisitor visitStoreLiteralVariable: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreLiteralVariable>>isStore [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStoreLiteralVariable>>popIntoNode [
	^ IRPopIntoLiteralVariable new
		association: association;
		yourself
]
