"
If a variable is not found or some other problem occurs during checking (ASTChecker) than a particular subclass instance of me is signal, usually causing a notification to the user. If not handled, the default handling is done, and compiling continues.
"
Class {
	#name : #OCSemanticWarning,
	#superclass : #Notification,
	#instVars : [
		'compilationContext',
		'node'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'ajh 7/7/2004 17:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>compilationContext [
	^ compilationContext 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>compilationContext: anObject [
	compilationContext := anObject
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>defaultAction [
	
	compilationContext interactive ifFalse: [ ^nil ].
	^self openMenuIn: 
		[:labels :lines :caption | 
		UIManager default chooseFrom: labels lines: lines title: caption]
]

{
	#category : #'accessing - compatibility',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>errorCode [
	self requestor ifNil: [
		^ self node methodNode asString ].
	^ self requestor contents
]

{
	#category : #'accessing - compatibility',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>errorMessage [
	^ self messageText
]

{
	#category : #'accessing - compatibility',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>location [
	^ self node sourceInterval first
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>methodClass [
	^node methodNode methodClass
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>methodNode [
	^node methodNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>node [
	^node 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>node: anObject [
	node := anObject
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>notify: aString at: location [
	"Refer to the comment in Object|notify:."

	^self requestor 
		ifNil: [SyntaxErrorNotification
					inClass: self methodClass 
					withCode: self methodNode source
					doitFlag: false
					errorMessage: aString
					location: location]
		ifNotNil: [self requestor
					notify: aString , ' ->'
					at: location
					in: self requestor text]
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>openMenuIn: aBlock [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSemanticWarning>>requestor [
	^ compilationContext requestor
]
