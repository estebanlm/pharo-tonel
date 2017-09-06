"
An OCSourceCodeChanged is used to pass corrected source code from OCUndeclaredVariableWarning back to OpalCompiler>>compile  so that parsing can be restarted,. Introduced to resolve Case 12954.
"
Class {
	#name : #OCSourceCodeChanged,
	#superclass : #Notification,
	#instVars : [
		'newSourceCode'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'BenComan 3/6/2014 02:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSourceCodeChanged>>newSourceCode [
	^newSourceCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSourceCodeChanged>>newSourceCode: aString [
	newSourceCode := aString
]
