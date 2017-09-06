"
reify args
"
Class {
	#name : #RFArgumentsReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 6/17/2015 16:36'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification class>>entities [
	^{RBMessageNode. RBMethodNode. RBBlockNode}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification class>>key [
	^#arguments
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>genForRBMessageNode [
	^RBTemporaryNode named: self varName.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>genForRBProgramNode [
	^RBTemporaryNode named: self varName.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>preamble: aNode [
	^aNode isMessage 
		ifTrue: [ self preambleForMessage: aNode ]
		ifFalse: [ self preambleForMethod: aNode ]
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>preambleForMessage: aNode [
	| preamble arguments |
	preamble := OrderedCollection new.
	arguments := OrderedCollection new.

	(1 to: aNode numArgs) reverseWithIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			preamble add:  (RFStorePopIntoTempNode named: name).
	].
	
	(1 to: aNode numArgs) withIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			arguments add:  (RBTemporaryNode named: name).
	].
	preamble addAll: (RBArrayNode statements: arguments).
	preamble add: (RFStorePopIntoTempNode named: 'RFArgumentsReificationVar').
	preamble addAll: arguments.
	^ preamble 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>preambleForMethod: aNode [
	| preamble arguments |
	preamble := OrderedCollection new.
	arguments := aNode argumentNames collect: [ :name | RBTemporaryNode named: name].
	preamble addAll: (RBArrayNode statements: arguments).
	preamble add: (RFStorePopIntoTempNode named: 'RFArgumentsReificationVar').
	^ preamble 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFArgumentsReification>>varName [
	^#RFArgumentsReificationVar
]
