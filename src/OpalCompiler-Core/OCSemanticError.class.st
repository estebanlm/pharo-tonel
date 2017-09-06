"
Raises a semantic error during semantic analysis
"
Class {
	#name : #OCSemanticError,
	#superclass : #Error,
	#instVars : [
		'compilationContext',
		'node'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>compilationContext [
	^ compilationContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>compilationContext: anObject [
	compilationContext := anObject
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>defaultAction [
	^self notify:  messageText at: node start.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>methodClass [
	^self methodNode methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>methodNode [
	^node methodNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>node [
	^ node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>node: aNode [
	node := aNode
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticError>>notify: aString at: location [
	"Refer to the comment in Object|notify:."

	^compilationContext requestor 
		ifNil: [SyntaxErrorNotification
					inClass: self methodClass 
					withCode: self methodNode source
					doitFlag: false
					errorMessage: aString
					location: location]
		ifNotNil: [compilationContext requestor
					notify: aString , ' ->'
					at: location
					in: compilationContext requestor text]
]
