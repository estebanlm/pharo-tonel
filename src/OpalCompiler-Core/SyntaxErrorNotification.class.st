"

"
Class {
	#name : #SyntaxErrorNotification,
	#superclass : #Notification,
	#instVars : [
		'inClass',
		'code',
		'doitFlag',
		'location'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : ''
}

{
	#category : #exceptionInstantiator,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification class>>inClass: aClass withCode: codeString doitFlag: doitFlag errorMessage: errorString location: location [
	| sourceCode |
	sourceCode := (self new
		setClass: aClass
		code: codeString
		doitFlag: doitFlag
		errorMessage: errorString
		location: location) signal.
	sourceCode ifNil: [ (OCAbortCompilation sourceCode: sourceCode) signal ].
	^ sourceCode
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>defaultAction [

	^ UIManager default syntaxErrorNotificationDefaultAction: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>doitFlag [
	^doitFlag
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>errorClass [
	^inClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>errorCode [
	^code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>errorMessage [
	^messageText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>location [
	^location
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>messageText [
	^ super messageText
		ifNil: [messageText := code]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
SyntaxErrorNotification>>setClass: aClass code: codeString doitFlag: aBoolean errorMessage: errorString location: anInteger [
	inClass := aClass.
	code := codeString.
	doitFlag := aBoolean.
	messageText := errorString.
	location := anInteger
]
