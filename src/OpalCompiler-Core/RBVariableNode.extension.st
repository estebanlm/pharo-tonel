Extension {
	#name : #RBVariableNode
}

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>binding [
	^self propertyAt: #binding ifAbsent: [nil].
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>binding: aSemVar [
	aSemVar ifNil: [^self removeProperty: #binding ifAbsent: []].
	self propertyAt: #binding put: aSemVar.
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isArg [

	^self binding isArg
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isClean [
	^ (self isInstance | self isSpecialVariable) not
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isGlobal [
	^self binding isGlobal
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isInstance [
	^self binding isInstance
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isSpecialVariable [
	^ self binding isSpecialVariable
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isTemp [
	^self binding isTemp
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBVariableNode>>isUndeclared [

	^self binding isUndeclared
]
