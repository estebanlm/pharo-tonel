"
LiteralVariables are 

-> Globals
-> Pool access
-> Class Var access
"
Class {
	#name : #IRLiteralVariableAccess,
	#superclass : #IRAccess,
	#instVars : [
		'association'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRLiteralVariableAccess>>association  [
	^association
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRLiteralVariableAccess>>association: anAssociation [
	association := anAssociation
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRLiteralVariableAccess>>isLiteralVariable [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRLiteralVariableAccess>>name [
	^association key
]
